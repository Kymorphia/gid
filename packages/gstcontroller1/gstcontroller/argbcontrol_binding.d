/// Module for [ARGBControlBinding] class
module gstcontroller.argbcontrol_binding;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.control_binding;
import gst.control_source;
import gst.object;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.types;

/**
    A value mapping object that attaches multiple control sources to a guint
    gobject properties representing a color. A control value of 0.0 will turn the
    color component off and a value of 1.0 will be the color level.
*/
class ARGBControlBinding : gst.control_binding.ControlBinding
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_argb_control_binding_get_type != &gidSymbolNotFound ? gst_argb_control_binding_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ARGBControlBinding self()
  {
    return this;
  }

  /**
  Get builder for [gstcontroller.argbcontrol_binding.ARGBControlBinding]
  Returns: New builder object
  */
  static ARGBControlBindingGidBuilder builder()
  {
    return new ARGBControlBindingGidBuilder;
  }

  /** */
  @property gst.control_source.ControlSource controlSourceA()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.control_source.ControlSource)("control-source-a");
  }

  /** */
  @property void controlSourceA(gst.control_source.ControlSource propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.control_source.ControlSource)("control-source-a", propval);
  }

  /** */
  @property gst.control_source.ControlSource controlSourceB()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.control_source.ControlSource)("control-source-b");
  }

  /** */
  @property void controlSourceB(gst.control_source.ControlSource propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.control_source.ControlSource)("control-source-b", propval);
  }

  /** */
  @property gst.control_source.ControlSource controlSourceG()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.control_source.ControlSource)("control-source-g");
  }

  /** */
  @property void controlSourceG(gst.control_source.ControlSource propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.control_source.ControlSource)("control-source-g", propval);
  }

  /** */
  @property gst.control_source.ControlSource controlSourceR()
  {
    return gobject.object.ObjectWrap.getProperty!(gst.control_source.ControlSource)("control-source-r");
  }

  /** */
  @property void controlSourceR(gst.control_source.ControlSource propval)
  {
    gobject.object.ObjectWrap.setProperty!(gst.control_source.ControlSource)("control-source-r", propval);
  }

  /**
      Create a new control-binding that attaches the given #GstControlSource to the
      #GObject property.
  
      Params:
        object = the object of the property
        propertyName = the property-name to attach the control source
        csA = the control source for the alpha channel
        csR = the control source for the red channel
        csG = the control source for the green channel
        csB = the control source for the blue channel
      Returns: the new #GstARGBControlBinding
  */
  this(gst.object.ObjectWrap object, string propertyName, gst.control_source.ControlSource csA, gst.control_source.ControlSource csR, gst.control_source.ControlSource csG, gst.control_source.ControlSource csB)
  {
    GstControlBinding* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = gst_argb_control_binding_new(object ? cast(GstObject*)object._cPtr(No.Dup) : null, _propertyName, csA ? cast(GstControlSource*)csA._cPtr(No.Dup) : null, csR ? cast(GstControlSource*)csR._cPtr(No.Dup) : null, csG ? cast(GstControlSource*)csG._cPtr(No.Dup) : null, csB ? cast(GstControlSource*)csB._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

class ARGBControlBindingGidBuilderImpl(T) : gst.control_binding.ControlBindingGidBuilderImpl!T
{

  /** */
  T controlSourceA(gst.control_source.ControlSource propval)
  {
    return setProperty("control-source-a", propval);
  }

  /** */
  T controlSourceB(gst.control_source.ControlSource propval)
  {
    return setProperty("control-source-b", propval);
  }

  /** */
  T controlSourceG(gst.control_source.ControlSource propval)
  {
    return setProperty("control-source-g", propval);
  }

  /** */
  T controlSourceR(gst.control_source.ControlSource propval)
  {
    return setProperty("control-source-r", propval);
  }
}

/// Fluent builder for [gstcontroller.argbcontrol_binding.ARGBControlBinding]
final class ARGBControlBindingGidBuilder : ARGBControlBindingGidBuilderImpl!ARGBControlBindingGidBuilder
{
  ARGBControlBinding build()
  {
    return new ARGBControlBinding(cast(void*)createGObject(ARGBControlBinding._getGType), No.Take);
  }
}
