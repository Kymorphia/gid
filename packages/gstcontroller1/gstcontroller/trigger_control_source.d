/// Module for [TriggerControlSource] class
module gstcontroller.trigger_control_source;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gstcontroller.c.functions;
import gstcontroller.c.types;
import gstcontroller.timed_value_control_source;
import gstcontroller.types;

/**
    #GstTriggerControlSource is a #GstControlSource, that returns values from user-given
    control points. It allows for a tolerance on the time-stamps.
    
    To use #GstTriggerControlSource get a new instance by calling
    [gstcontroller.trigger_control_source.TriggerControlSource.new_], bind it to a #GParamSpec and set some
    control points by calling [gstcontroller.timed_value_control_source.TimedValueControlSource.set].
    
    All functions are MT-safe.
*/
class TriggerControlSource : gstcontroller.timed_value_control_source.TimedValueControlSource
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
    return cast(void function())gst_trigger_control_source_get_type != &gidSymbolNotFound ? gst_trigger_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TriggerControlSource self()
  {
    return this;
  }

  /**
      Get builder for [gstcontroller.trigger_control_source.TriggerControlSource]
      Returns: New builder object
  */
  static TriggerControlSourceGidBuilder builder()
  {
    return new TriggerControlSourceGidBuilder;
  }

  /** */
  @property long tolerance()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("tolerance");
  }

  /** */
  @property void tolerance(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("tolerance", propval);
  }

  /**
      This returns a new, unbound #GstTriggerControlSource.
      Returns: a new, unbound #GstTriggerControlSource.
  */
  this()
  {
    GstControlSource* _cretval;
    _cretval = gst_trigger_control_source_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gstcontroller.trigger_control_source.TriggerControlSource]
class TriggerControlSourceGidBuilderImpl(T) : gstcontroller.timed_value_control_source.TimedValueControlSourceGidBuilderImpl!T
{

  /** */
  T tolerance(long propval)
  {
    return setProperty("tolerance", propval);
  }
}

/// Fluent builder for [gstcontroller.trigger_control_source.TriggerControlSource]
final class TriggerControlSourceGidBuilder : TriggerControlSourceGidBuilderImpl!TriggerControlSourceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TriggerControlSource build()
  {
    return new TriggerControlSource(cast(void*)createGObject(TriggerControlSource._getGType), Yes.Take);
  }
}
