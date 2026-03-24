/// Module for [DataQueue] class
module gstbase.data_queue;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    #GstDataQueue is an object that handles threadsafe queueing of objects. It
    also provides size-related functionality. This object should be used for
    any #GstElement that wishes to provide some sort of queueing functionality.
*/
class DataQueue : gobject.object.ObjectWrap
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
    return cast(void function())gst_data_queue_get_type != &gidSymbolNotFound ? gst_data_queue_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataQueue self()
  {
    return this;
  }

  /**
  Get builder for [gstbase.data_queue.DataQueue]
  Returns: New builder object
  */
  static DataQueueGidBuilder builder()
  {
    return new DataQueueGidBuilder;
  }

  /** */
  @property uint currentLevelBytes()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("current-level-bytes");
  }

  /** */
  @property ulong currentLevelTime()
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("current-level-time");
  }

  /** */
  @property uint currentLevelVisible()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("current-level-visible");
  }
}

class DataQueueGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gstbase.data_queue.DataQueue]
final class DataQueueGidBuilder : DataQueueGidBuilderImpl!DataQueueGidBuilder
{
  DataQueue build()
  {
    return new DataQueue(cast(void*)createGObject(DataQueue._getGType), Yes.Take);
  }
}
