/// Module for [DirectControlBinding] class
module gid.gstcontroller1.direct_control_binding;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.control_binding;
import gid.gst1.control_source;
import gid.gst1.object;
import gid.gstcontroller1.c.functions;
import gid.gstcontroller1.c.types;
import gid.gstcontroller1.types;

/**
    A value mapping object that attaches control sources to gobject properties. It
    will map the control values directly to the target property range. If a
    non-absolute direct control binding is used, the value range [0.0 ... 1.0]
    is mapped to full target property range, and all values outside the range
    will be clipped. An absolute control binding will not do any value
    transformations.
*/
class DirectControlBinding : gid.gst1.control_binding.ControlBinding
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_direct_control_binding_get_type != &gidSymbolNotFound ? gst_direct_control_binding_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDirectControlBinding";
  }

  /** Returns `this`, for use in `with` statements. */
  override DirectControlBinding self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstcontroller1.direct_control_binding.DirectControlBinding]
      Returns: New builder object
  */
  static DirectControlBindingGidBuilder builder() nothrow
  {
    return new DirectControlBindingGidBuilder;
  }

  /** */
  @property bool absolute() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("absolute");
  }

  /** */
  @property gid.gst1.control_source.ControlSource controlSource() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gst1.control_source.ControlSource)("control-source");
  }

  /** */
  @property void controlSource(gid.gst1.control_source.ControlSource propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gst1.control_source.ControlSource)("control-source", propval);
  }

  /**
      Create a new control-binding that attaches the #GstControlSource to the
      #GObject property. It will map the control source range [0.0 ... 1.0] to
      the full target property range, and clip all values outside this range.
  
      Params:
        object = the object of the property
        propertyName = the property-name to attach the control source
        cs = the control source
      Returns: the new #GstDirectControlBinding
  */
  this(gid.gst1.object.ObjectWrap object, string propertyName, gid.gst1.control_source.ControlSource cs) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstControlBinding* _cretval;
      const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
      _cretval = gst_direct_control_binding_new(object ? cast(GstObject*)object._cPtr(No.Dup) : null, _propertyName, cs ? cast(GstControlSource*)cs._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Create a new control-binding that attaches the #GstControlSource to the
      #GObject property. It will directly map the control source values to the
      target property range without any transformations.
  
      Params:
        object = the object of the property
        propertyName = the property-name to attach the control source
        cs = the control source
      Returns: the new #GstDirectControlBinding
  */
  static gid.gstcontroller1.direct_control_binding.DirectControlBinding newAbsolute(gid.gst1.object.ObjectWrap object, string propertyName, gid.gst1.control_source.ControlSource cs) nothrow
  {
    GstControlBinding* _cretval;
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_direct_control_binding_new_absolute(object ? cast(GstObject*)object._cPtr(No.Dup) : null, _propertyName, cs ? cast(GstControlSource*)cs._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstcontroller1.direct_control_binding.DirectControlBinding)(cast(GstControlBinding*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstcontroller1.direct_control_binding.DirectControlBinding]
class DirectControlBindingGidBuilderImpl(T) : gid.gst1.control_binding.ControlBindingGidBuilderImpl!T
{

  /** */
  T absolute(bool propval) nothrow
  {
    return setProperty("absolute", propval);
  }

  /** */
  T controlSource(gid.gst1.control_source.ControlSource propval) nothrow
  {
    return setProperty("control-source", propval);
  }
}

/// Fluent builder for [gid.gstcontroller1.direct_control_binding.DirectControlBinding]
final class DirectControlBindingGidBuilder : DirectControlBindingGidBuilderImpl!DirectControlBindingGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DirectControlBinding build() nothrow
  {
    return new DirectControlBinding(cast(void*)createGObject(DirectControlBinding._getGType), Yes.Take);
  }
}
