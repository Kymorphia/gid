/// Module for [ParamSpecArray] class
module gst.param_spec_array;

import gid.gid;
import gobject.param_spec;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A GParamSpec derived structure for arrays of values.
*/
class ParamSpecArray
{
  GstParamSpecArray _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gst.param_spec_array.ParamSpecArray");

    _cInstance = *cast(GstParamSpecArray*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `parentInstance` field.
      Returns: super class
  */
  @property gobject.param_spec.ParamSpec parentInstance()
  {
    return cToD!(gobject.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecArray*)this._cPtr).parentInstance);
  }

  /**
      Set `parentInstance` field.
      Params:
        propval = super class
  */
  @property void parentInstance(gobject.param_spec.ParamSpec propval)
  {
    cValueFree!(gobject.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecArray*)this._cPtr).parentInstance);
    dToC(propval, cast(void*)&(cast(GstParamSpecArray*)this._cPtr).parentInstance);
  }

  /**
      Get `elementSpec` field.
      Returns: the #GParamSpec of the type of values in the array
  */
  @property gobject.param_spec.ParamSpec elementSpec()
  {
    return cToD!(gobject.param_spec.ParamSpec)(cast(void*)(cast(GstParamSpecArray*)this._cPtr).elementSpec);
  }

  /**
      Set `elementSpec` field.
      Params:
        propval = the #GParamSpec of the type of values in the array
  */
  @property void elementSpec(gobject.param_spec.ParamSpec propval)
  {
    cValueFree!(gobject.param_spec.ParamSpec)(cast(void*)(cast(GstParamSpecArray*)this._cPtr).elementSpec);
    dToC(propval, cast(void*)&(cast(GstParamSpecArray*)this._cPtr).elementSpec);
  }
}
