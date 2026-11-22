/// Module for [DataQueue] class
module gid.gstbase1.data_queue;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    #GstDataQueue is an object that handles threadsafe queueing of objects. It
    also provides size-related functionality. This object should be used for
    any #GstElement that wishes to provide some sort of queueing functionality.
*/
class DataQueue : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gst_data_queue_get_type != &gidSymbolNotFound ? gst_data_queue_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDataQueue";
  }

  /** Returns `this`, for use in `with` statements. */
  override DataQueue self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstbase1.data_queue.DataQueue]
      Returns: New builder object
  */
  static DataQueueGidBuilder builder() nothrow
  {
    return new DataQueueGidBuilder;
  }

  /** */
  @property uint currentLevelBytes() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("current-level-bytes");
  }

  /** */
  @property ulong currentLevelTime() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("current-level-time");
  }

  /** */
  @property uint currentLevelVisible() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("current-level-visible");
  }
}

/// Fluent builder implementation template for [gid.gstbase1.data_queue.DataQueue]
class DataQueueGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstbase1.data_queue.DataQueue]
final class DataQueueGidBuilder : DataQueueGidBuilderImpl!DataQueueGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DataQueue build() nothrow
  {
    return new DataQueue(cast(void*)createGObject(DataQueue._getGType), Yes.Take);
  }
}
