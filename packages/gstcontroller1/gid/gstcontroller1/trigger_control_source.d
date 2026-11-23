/// Module for [TriggerControlSource] class
module gid.gstcontroller1.trigger_control_source;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstcontroller1.c.functions;
import gid.gstcontroller1.c.types;
import gid.gstcontroller1.timed_value_control_source;
import gid.gstcontroller1.types;

/**
    #GstTriggerControlSource is a #GstControlSource, that returns values from user-given
    control points. It allows for a tolerance on the time-stamps.
    
    To use #GstTriggerControlSource get a new instance by calling
    [gid.gstcontroller1.trigger_control_source.TriggerControlSource.new_], bind it to a #GParamSpec and set some
    control points by calling [gid.gstcontroller1.timed_value_control_source.TimedValueControlSource.set].
    
    All functions are MT-safe.
*/
class TriggerControlSource : gid.gstcontroller1.timed_value_control_source.TimedValueControlSource
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
    return cast(void function())gst_trigger_control_source_get_type != &gidSymbolNotFound ? gst_trigger_control_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstTriggerControlSource";
  }

  /** Returns `this`, for use in `with` statements. */
  override TriggerControlSource self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstcontroller1.trigger_control_source.TriggerControlSource]
      Returns: New builder object
  */
  static TriggerControlSourceGidBuilder builder() nothrow
  {
    return new TriggerControlSourceGidBuilder;
  }

  /** */
  @property long tolerance() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("tolerance");
  }

  /** */
  @property void tolerance(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("tolerance", propval);
  }

  /**
      This returns a new, unbound #GstTriggerControlSource.
      Returns: a new, unbound #GstTriggerControlSource.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GstControlSource* _cretval;
      _cretval = gst_trigger_control_source_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gstcontroller1.trigger_control_source.TriggerControlSource]
class TriggerControlSourceGidBuilderImpl(T) : gid.gstcontroller1.timed_value_control_source.TimedValueControlSourceGidBuilderImpl!T
{

  /** */
  T tolerance(long propval) nothrow
  {
    return setProperty("tolerance", propval);
  }
}

/// Fluent builder for [gid.gstcontroller1.trigger_control_source.TriggerControlSource]
final class TriggerControlSourceGidBuilder : TriggerControlSourceGidBuilderImpl!TriggerControlSourceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TriggerControlSource build() nothrow
  {
    return new TriggerControlSource(cast(void*)createGObject(TriggerControlSource._getGType), Yes.Take);
  }
}
