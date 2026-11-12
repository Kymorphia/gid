/// Module for [LogField] class
module glib.log_field;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    Structure representing a single field in a structured log entry. See
    [glib.global.logStructured] for details.
    
    Log fields may contain arbitrary values, including binary with embedded nul
    bytes. If the field contains a string, the string must be UTF-8 encoded and
    have a trailing nul byte. Otherwise, @length must be set to a non-negative
    value.
*/
class LogField : StructWrap!(GLogField)
{
  /**
      Create a `log_field.LogField` wrap type.
      Params:
        key = field name (UTF-8 string)
        value = field value (arbitrary bytes)
        length = length of @value, in bytes, or -1 if it is nul-terminated
  */
  this(string key = string.init, const(void)* value = (const(void)*).init, ptrdiff_t length = ptrdiff_t.init) nothrow
  {
    this.key = key;
    this.value = value;
    this.length = length;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private const(char)* _keyRef; // Keeps borrowed GC string alive

  /**
      Get `key` field.
      Returns: field name (UTF-8 string)
  */
  @property string key() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GLogField*)this._cPtr).key);
  }

  /**
      Set `key` field.
      Params:
        propval = field name (UTF-8 string)
  */
  @property void key(string propval) nothrow
  {
    if (_refuseBorrowedStore("key"))
      return;

    _keyRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GLogField*)this._cPtr).key = cast(const(char)*)_keyRef;
  }

  /**
      Get `value` field.
      Returns: field value (arbitrary bytes)
  */
  @property const(void)* value() nothrow
  {
    return (cast(GLogField*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = field value (arbitrary bytes)
  */
  @property void value(const(void)* propval) nothrow
  {
    (cast(GLogField*)this._cPtr).value = propval;
  }

  /**
      Get `length` field.
      Returns: length of @value, in bytes, or -1 if it is nul-terminated
  */
  @property ptrdiff_t length() nothrow
  {
    return (cast(GLogField*)this._cPtr).length;
  }

  /**
      Set `length` field.
      Params:
        propval = length of @value, in bytes, or -1 if it is nul-terminated
  */
  @property void length(ptrdiff_t propval) nothrow
  {
    (cast(GLogField*)this._cPtr).length = propval;
  }

  private const(void)* _valueRef; // Keeps D value data assigned with setValueString/setValueBytes alive

  /**
  Create a log field with a string value.
  Params:
  key = field name (UTF-8 string)
  value = field value string (kept alive by the LogField, passed to C with its length)
  */
  this(string key, string value) nothrow
  {
    this.key = key;
    setValueString(value);
  }

  /**
  Create a log field with a binary value.
  Params:
  key = field name (UTF-8 string)
  value = field value bytes (kept alive by the LogField, passed to C with its length)
  */
  this(string key, const(ubyte)[] value) nothrow
  {
    this.key = key;
    setValueBytes(value);
  }

  /**
  Set the value to a string.
  Params:
  val = The string value (kept alive by the LogField, passed to C with its length)
  */
  void setValueString(string val) nothrow
  {
    _valueRef = val.length > 0 ? cast(const(void)*)val.ptr : cast(const(void)*)"".ptr;
    (cast(GLogField*)this._cPtr).value = _valueRef;
    (cast(GLogField*)this._cPtr).length = cast(ptrdiff_t)val.length;
  }

  /**
  Set the value to binary data.
  Params:
  val = The value bytes (kept alive by the LogField, passed to C with its length)
  */
  void setValueBytes(const(ubyte)[] val) nothrow
  {
    _valueRef = val.length > 0 ? cast(const(void)*)val.ptr : cast(const(void)*)"".ptr;
    (cast(GLogField*)this._cPtr).value = _valueRef;
    (cast(GLogField*)this._cPtr).length = cast(ptrdiff_t)val.length;
  }

  /**
  Get a copy of the value as a string (a nul-terminated value if length is -1).
  Returns: The value string
  */
  string valueString() nothrow
  {
    auto cval = cast(const(char)*)(cast(GLogField*)this._cPtr).value;
    auto len = (cast(GLogField*)this._cPtr).length;

    if (!cval)
      return null;

    return len < 0 ? cval.fromCString : cval[0 .. len].idup;
  }

  /**
  Get a copy of the value as bytes (up to the nul-terminator if length is -1).
  Returns: The value bytes
  */
  ubyte[] valueBytes() nothrow
  {
    auto cval = cast(const(ubyte)*)(cast(GLogField*)this._cPtr).value;
    auto len = (cast(GLogField*)this._cPtr).length;

    if (!cval)
      return null;

    if (len < 0)
      for (len = 0; cval[len] != 0; len++) {}

    return cval[0 .. len].dup;
  }
}
