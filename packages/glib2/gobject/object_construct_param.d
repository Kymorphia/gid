/// Module for [ObjectConstructParam] class
module gobject.object_construct_param;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;
import gobject.value;

/**
    The GObjectConstructParam struct is an auxiliary structure used to hand
    #GParamSpec/#GValue pairs to the @constructor of a #GObjectClass.
*/
class ObjectConstructParam
{
  GObjectConstructParam _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.object_construct_param.ObjectConstructParam");

    _cInstance = *cast(GObjectConstructParam*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `pspec` field.
      Returns: the #GParamSpec of the construct parameter
  */
  @property gobject.param_spec.ParamSpec pspec()
  {
    return cToD!(gobject.param_spec.ParamSpec)(cast(void*)(cast(GObjectConstructParam*)this._cPtr).pspec);
  }

  /**
      Set `pspec` field.
      Params:
        propval = the #GParamSpec of the construct parameter
  */
  @property void pspec(gobject.param_spec.ParamSpec propval)
  {
    cValueFree!(gobject.param_spec.ParamSpec)(cast(void*)(cast(GObjectConstructParam*)this._cPtr).pspec);
    dToC(propval, cast(void*)&(cast(GObjectConstructParam*)this._cPtr).pspec);
  }

  /**
      Get `value` field.
      Returns: the value to set the parameter to
  */
  @property gobject.value.Value value()
  {
    return cToD!(gobject.value.Value)(cast(void*)(cast(GObjectConstructParam*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the value to set the parameter to
  */
  @property void value(gobject.value.Value propval)
  {
    cValueFree!(gobject.value.Value)(cast(void*)(cast(GObjectConstructParam*)this._cPtr).value);
    dToC(propval, cast(void*)&(cast(GObjectConstructParam*)this._cPtr).value);
  }
}
