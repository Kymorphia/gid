/// Module for [ParamSpecArray] class
module gid.gst1.param_spec_array;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.param_spec;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/**
    A GParamSpec derived structure for arrays of values.
*/
class ParamSpecArray : StructWrap!(GstParamSpecArray)
{
  /**
      Create a `param_spec_array.ParamSpecArray` wrap type.
      Params:
        elementSpec = the #GParamSpec of the type of values in the array
  */
  this(gid.gobject2.param_spec.ParamSpec elementSpec = gid.gobject2.param_spec.ParamSpec.init) nothrow
  {
    this.elementSpec = elementSpec;
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

  /**
      Get `parentInstance` field.
      Returns: super class
  */
  @property gid.gobject2.param_spec.ParamSpec parentInstance() nothrow
  {
    return cToD!(gid.gobject2.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecArray*)this._cPtr).parentInstance);
  }

  private gid.gobject2.param_spec.ParamSpec _elementSpecRef; // Keeps borrowed field value alive

  /**
      Get `elementSpec` field.
      Returns: the #GParamSpec of the type of values in the array
  */
  @property gid.gobject2.param_spec.ParamSpec elementSpec() nothrow
  {
    return cToD!(gid.gobject2.param_spec.ParamSpec)(cast(void*)(cast(GstParamSpecArray*)this._cPtr).elementSpec);
  }

  /**
      Set `elementSpec` field.
      Params:
        propval = the #GParamSpec of the type of values in the array
  */
  @property void elementSpec(gid.gobject2.param_spec.ParamSpec propval) nothrow
  {
    if (_refuseBorrowedStore("elementSpec"))
      return;

    _elementSpecRef = propval;
    (cast(GstParamSpecArray*)this._cPtr).elementSpec = propval ? cast(GParamSpec*)propval._cPtr(No.Dup) : null;
  }
}
