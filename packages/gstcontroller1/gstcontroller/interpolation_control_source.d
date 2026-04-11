/// Module for [InterpolationControlSource] class
module gstcontroller.interpolation_control_source;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.timed_value_control_source;
import gstcontroller.types;

/**
    #GstInterpolationControlSource is a #GstControlSource, that interpolates values between user-given
    control points. It supports several interpolation modes and property types.
    
    To use #GstInterpolationControlSource get a new instance by calling
    [gstcontroller.interpolation_control_source.InterpolationControlSource.new_], bind it to a #GParamSpec and set some
    control points by calling [gstcontroller.timed_value_control_source.TimedValueControlSource.set].
    
    All functions are MT-safe.
*/
class InterpolationControlSource : gstcontroller.timed_value_control_source.TimedValueControlSource
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
    return cast(void function())gst_interpolation_control_source_get_type != &gidSymbolNotFound ? gst_interpolation_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InterpolationControlSource self()
  {
    return this;
  }

  /**
      Get builder for [gstcontroller.interpolation_control_source.InterpolationControlSource]
      Returns: New builder object
  */
  static InterpolationControlSourceGidBuilder builder()
  {
    return new InterpolationControlSourceGidBuilder;
  }

  /** */
  @property gstcontroller.types.InterpolationMode mode()
  {
    return gobject.object.ObjectWrap.getProperty!(gstcontroller.types.InterpolationMode)("mode");
  }

  /** */
  @property void mode(gstcontroller.types.InterpolationMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstcontroller.types.InterpolationMode)("mode", propval);
  }

  /**
      This returns a new, unbound #GstInterpolationControlSource.
      Returns: a new, unbound #GstInterpolationControlSource.
  */
  this()
  {
    GstControlSource* _cretval;
    _cretval = gst_interpolation_control_source_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gstcontroller.interpolation_control_source.InterpolationControlSource]
class InterpolationControlSourceGidBuilderImpl(T) : gstcontroller.timed_value_control_source.TimedValueControlSourceGidBuilderImpl!T
{

  /** */
  T mode(gstcontroller.types.InterpolationMode propval)
  {
    return setProperty("mode", propval);
  }
}

/// Fluent builder for [gstcontroller.interpolation_control_source.InterpolationControlSource]
final class InterpolationControlSourceGidBuilder : InterpolationControlSourceGidBuilderImpl!InterpolationControlSourceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InterpolationControlSource build()
  {
    return new InterpolationControlSource(cast(void*)createGObject(InterpolationControlSource._getGType), Yes.Take);
  }
}
