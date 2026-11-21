/// Module for [DebugKey] class
module gid.glib2.debug_key;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;

/**
    Associates a string with a bit flag.
    Used in [gid.glib2.global.parseDebugString].
*/
class DebugKey : StructWrap!(GDebugKey)
{
  /**
      Create a `debug_key.DebugKey` wrap type.
      Params:
        key = the string
        value = the flag
  */
  this(string key = string.init, uint value = uint.init) nothrow
  {
    this.key = key;
    this.value = value;
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
      Returns: the string
  */
  @property string key() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GDebugKey*)this._cPtr).key);
  }

  /**
      Set `key` field.
      Params:
        propval = the string
  */
  @property void key(string propval) nothrow
  {
    if (_refuseBorrowedStore("key"))
      return;

    _keyRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GDebugKey*)this._cPtr).key = cast(const(char)*)_keyRef;
  }

  /**
      Get `value` field.
      Returns: the flag
  */
  @property uint value() nothrow
  {
    return (cast(GDebugKey*)this._cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = the flag
  */
  @property void value(uint propval) nothrow
  {
    (cast(GDebugKey*)this._cPtr).value = propval;
  }
}
