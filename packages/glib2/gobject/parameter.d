/// Module for [Parameter] class
module gobject.parameter;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;
import gobject.value;

/**
    The GParameter struct is an auxiliary structure used
    to hand parameter name/value pairs to [gobject.object.ObjectWrap.newv].

    Deprecated: This type is not introspectable.
*/
class Parameter
{
  GParameter _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GParameter*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `name` field.
      Returns: the parameter name
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GParameter*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = the parameter name
  */
  @property void name(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GParameter*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GParameter*)this._cPtr).name);
  }

  /**
      Get `value` field.
      Returns: the parameter value
  */
  @property gobject.value.Value value() nothrow
  {
    return cToD!(gobject.value.Value)(cast(void*)&(cast(GParameter*)this._cPtr).value);
  }
}
