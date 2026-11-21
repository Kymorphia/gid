/// Module for [ARGBControlBinding] class
module gid.gstcontroller1.argbcontrol_binding;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.control_binding;
import gid.gst1.control_source;
import gid.gst1.object;
import gid.gstcontroller1.c.functions;
import gid.gstcontroller1.c.types;
import gid.gstcontroller1.types;

/**
    A value mapping object that attaches multiple control sources to a guint
    gobject properties representing a color. A control value of 0.0 will turn the
    color component off and a value of 1.0 will be the color level.
*/
class ARGBControlBinding : gid.gst1.control_binding.ControlBinding
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_argb_control_binding_get_type != &gidSymbolNotFound ? gst_argb_control_binding_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstARGBControlBinding";
  }

  /** Returns `this`, for use in `with` statements. */
  override ARGBControlBinding self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstcontroller1.argbcontrol_binding.ARGBControlBinding]
      Returns: New builder object
  */
  static ARGBControlBindingGidBuilder builder() nothrow
  {
    return new ARGBControlBindingGidBuilder;
  }

  /** */
  @property gid.gst1.control_source.ControlSource controlSourceA() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.control_source.ControlSource)("control-source-a");
  }

  /** */
  @property void controlSourceA(gid.gst1.control_source.ControlSource propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.control_source.ControlSource)("control-source-a", propval);
  }

  /** */
  @property gid.gst1.control_source.ControlSource controlSourceB() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.control_source.ControlSource)("control-source-b");
  }

  /** */
  @property void controlSourceB(gid.gst1.control_source.ControlSource propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.control_source.ControlSource)("control-source-b", propval);
  }

  /** */
  @property gid.gst1.control_source.ControlSource controlSourceG() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.control_source.ControlSource)("control-source-g");
  }

  /** */
  @property void controlSourceG(gid.gst1.control_source.ControlSource propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.control_source.ControlSource)("control-source-g", propval);
  }

  /** */
  @property gid.gst1.control_source.ControlSource controlSourceR() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.control_source.ControlSource)("control-source-r");
  }

  /** */
  @property void controlSourceR(gid.gst1.control_source.ControlSource propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.control_source.ControlSource)("control-source-r", propval);
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
  this(gid.gst1.object.ObjectWrap object, string propertyName, gid.gst1.control_source.ControlSource csA, gid.gst1.control_source.ControlSource csR, gid.gst1.control_source.ControlSource csG, gid.gst1.control_source.ControlSource csB) nothrow
  {
    GstControlBinding* _cretval;
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_argb_control_binding_new(object ? cast(GstObject*)object._cPtr(No.Dup) : null, _propertyName, csA ? cast(GstControlSource*)csA._cPtr(No.Dup) : null, csR ? cast(GstControlSource*)csR._cPtr(No.Dup) : null, csG ? cast(GstControlSource*)csG._cPtr(No.Dup) : null, csB ? cast(GstControlSource*)csB._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gid.gstcontroller1.argbcontrol_binding.ARGBControlBinding]
class ARGBControlBindingGidBuilderImpl(T) : gid.gst1.control_binding.ControlBindingGidBuilderImpl!T
{

  /** */
  T controlSourceA(gid.gst1.control_source.ControlSource propval) nothrow
  {
    return setProperty("control-source-a", propval);
  }

  /** */
  T controlSourceB(gid.gst1.control_source.ControlSource propval) nothrow
  {
    return setProperty("control-source-b", propval);
  }

  /** */
  T controlSourceG(gid.gst1.control_source.ControlSource propval) nothrow
  {
    return setProperty("control-source-g", propval);
  }

  /** */
  T controlSourceR(gid.gst1.control_source.ControlSource propval) nothrow
  {
    return setProperty("control-source-r", propval);
  }
}

/// Fluent builder for [gid.gstcontroller1.argbcontrol_binding.ARGBControlBinding]
final class ARGBControlBindingGidBuilder : ARGBControlBindingGidBuilderImpl!ARGBControlBindingGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ARGBControlBinding build() nothrow
  {
    return new ARGBControlBinding(cast(void*)createGObject(ARGBControlBinding._getGType), Yes.Take);
  }
}
