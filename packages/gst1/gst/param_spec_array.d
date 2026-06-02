/// Module for [ParamSpecArray] class
module gst.param_spec_array;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstParamSpecArray*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `parentInstance` field.
      Returns: super class
  */
  @property gobject.param_spec.ParamSpec parentInstance() nothrow
  {
    return cToD!(gobject.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecArray*)this._cPtr).parentInstance);
  }

  /**
      Set `parentInstance` field.
      Params:
        propval = super class
  */
  @property void parentInstance(gobject.param_spec.ParamSpec propval) nothrow
  {
    cValueFree!(gobject.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecArray*)this._cPtr).parentInstance);
    dToC(propval, cast(void*)&(cast(GstParamSpecArray*)this._cPtr).parentInstance);
  }

  /**
      Get `elementSpec` field.
      Returns: the #GParamSpec of the type of values in the array
  */
  @property gobject.param_spec.ParamSpec elementSpec() nothrow
  {
    return cToD!(gobject.param_spec.ParamSpec)(cast(void*)(cast(GstParamSpecArray*)this._cPtr).elementSpec);
  }

  /**
      Set `elementSpec` field.
      Params:
        propval = the #GParamSpec of the type of values in the array
  */
  @property void elementSpec(gobject.param_spec.ParamSpec propval) nothrow
  {
    cValueFree!(gobject.param_spec.ParamSpec)(cast(void*)(cast(GstParamSpecArray*)this._cPtr).elementSpec);
    dToC(propval, cast(void*)&(cast(GstParamSpecArray*)this._cPtr).elementSpec);
  }
}
