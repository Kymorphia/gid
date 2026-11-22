/// Module for [InterpolationControlSource] class
module gid.gstcontroller1.interpolation_control_source;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstcontroller1.c.functions;
import gid.gstcontroller1.c.types;
import gid.gstcontroller1.timed_value_control_source;
import gid.gstcontroller1.types;

/**
    #GstInterpolationControlSource is a #GstControlSource, that interpolates values between user-given
    control points. It supports several interpolation modes and property types.
    
    To use #GstInterpolationControlSource get a new instance by calling
    [gid.gstcontroller1.interpolation_control_source.InterpolationControlSource.new_], bind it to a #GParamSpec and set some
    control points by calling [gid.gstcontroller1.timed_value_control_source.TimedValueControlSource.set].
    
    All functions are MT-safe.
*/
class InterpolationControlSource : gid.gstcontroller1.timed_value_control_source.TimedValueControlSource
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
    return cast(void function())gst_interpolation_control_source_get_type != &gidSymbolNotFound ? gst_interpolation_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstInterpolationControlSource";
  }

  /** Returns `this`, for use in `with` statements. */
  override InterpolationControlSource self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstcontroller1.interpolation_control_source.InterpolationControlSource]
      Returns: New builder object
  */
  static InterpolationControlSourceGidBuilder builder() nothrow
  {
    return new InterpolationControlSourceGidBuilder;
  }

  /** */
  @property gid.gstcontroller1.types.InterpolationMode mode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstcontroller1.types.InterpolationMode)("mode");
  }

  /** */
  @property void mode(gid.gstcontroller1.types.InterpolationMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstcontroller1.types.InterpolationMode)("mode", propval);
  }

  /**
      This returns a new, unbound #GstInterpolationControlSource.
      Returns: a new, unbound #GstInterpolationControlSource.
  */
  this() nothrow
  {
    GstControlSource* _cretval;
    _cretval = gst_interpolation_control_source_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gstcontroller1.interpolation_control_source.InterpolationControlSource]
class InterpolationControlSourceGidBuilderImpl(T) : gid.gstcontroller1.timed_value_control_source.TimedValueControlSourceGidBuilderImpl!T
{

  /** */
  T mode(gid.gstcontroller1.types.InterpolationMode propval) nothrow
  {
    return setProperty("mode", propval);
  }
}

/// Fluent builder for [gid.gstcontroller1.interpolation_control_source.InterpolationControlSource]
final class InterpolationControlSourceGidBuilder : InterpolationControlSourceGidBuilderImpl!InterpolationControlSourceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InterpolationControlSource build() nothrow
  {
    return new InterpolationControlSource(cast(void*)createGObject(InterpolationControlSource._getGType), Yes.Take);
  }
}
