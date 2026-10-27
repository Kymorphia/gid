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

  /**
      Create a `param_spec_array.ParamSpecArray` wrap type.
      Params:
        elementSpec = the #GParamSpec of the type of values in the array
  */
  this(gobject.param_spec.ParamSpec elementSpec = gobject.param_spec.ParamSpec.init) nothrow
  {
    this.elementSpec = elementSpec;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstParamSpecArray*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `parentInstance` field.
      Returns: super class
  */
  @property gobject.param_spec.ParamSpec parentInstance() nothrow
  {
    return cToD!(gobject.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecArray*)this._cPtr).parentInstance);
  }

  private gobject.param_spec.ParamSpec _elementSpecRef; // Keeps borrowed field value alive

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
    _elementSpecRef = propval;
    (cast(GstParamSpecArray*)this._cPtr).elementSpec = propval ? cast(GParamSpec*)propval._cPtr(No.Dup) : null;
  }
}
