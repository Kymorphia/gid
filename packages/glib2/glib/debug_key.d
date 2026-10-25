/// Module for [DebugKey] class
module glib.debug_key;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    Associates a string with a bit flag.
    Used in [glib.global.parseDebugString].
*/
class DebugKey
{
  GDebugKey _cInstance;

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
    _cInstance = *cast(GDebugKey*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

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
    cValueFree!(string)(cast(void*)(cast(GDebugKey*)this._cPtr).key);
    dToC(propval, cast(void*)&(cast(GDebugKey*)this._cPtr).key);
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
