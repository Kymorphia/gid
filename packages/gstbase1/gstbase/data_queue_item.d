/// Module for [DataQueueItem] class
module gstbase.data_queue_item;

import gid.gid;
import gst.mini_object;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    Structure used by #GstDataQueue. You can supply a different structure, as
    long as the top of the structure is identical to this structure.
*/
class DataQueueItem
{
  GstDataQueueItem _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstbase.data_queue_item.DataQueueItem");

    _cInstance = *cast(GstDataQueueItem*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `object` field.
      Returns: the #GstMiniObject to queue.
  */
  @property gst.mini_object.MiniObject object()
  {
    return cToD!(gst.mini_object.MiniObject)(cast(void*)(cast(GstDataQueueItem*)this._cPtr).object);
  }

  /**
      Set `object` field.
      Params:
        propval = the #GstMiniObject to queue.
  */
  @property void object(gst.mini_object.MiniObject propval)
  {
    cValueFree!(gst.mini_object.MiniObject)(cast(void*)(cast(GstDataQueueItem*)this._cPtr).object);
    dToC(propval, cast(void*)&(cast(GstDataQueueItem*)this._cPtr).object);
  }

  /**
      Get `size` field.
      Returns: the size in bytes of the miniobject.
  */
  @property uint size()
  {
    return (cast(GstDataQueueItem*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = the size in bytes of the miniobject.
  */
  @property void size(uint propval)
  {
    (cast(GstDataQueueItem*)this._cPtr).size = propval;
  }

  /**
      Get `duration` field.
      Returns: the duration in #GstClockTime of the miniobject. Can not be
        `GST_CLOCK_TIME_NONE`.
  */
  @property ulong duration()
  {
    return (cast(GstDataQueueItem*)this._cPtr).duration;
  }

  /**
      Set `duration` field.
      Params:
        propval = the duration in #GstClockTime of the miniobject. Can not be
          `GST_CLOCK_TIME_NONE`.
  */
  @property void duration(ulong propval)
  {
    (cast(GstDataQueueItem*)this._cPtr).duration = propval;
  }

  /**
      Get `visible` field.
      Returns: true if @object should be considered as a visible object.
  */
  @property bool visible()
  {
    return cast(bool)(cast(GstDataQueueItem*)this._cPtr).visible;
  }

  /**
      Set `visible` field.
      Params:
        propval = true if @object should be considered as a visible object.
  */
  @property void visible(bool propval)
  {
    (cast(GstDataQueueItem*)this._cPtr).visible = propval;
  }

  /**
      Get `destroy` field.
      Returns: The #GDestroyNotify function to use to free the #GstDataQueueItem.
        This function should also drop the reference to @object the owner of the
        #GstDataQueueItem is assumed to hold.
  */
  @property GDestroyNotify destroy()
  {
    return (cast(GstDataQueueItem*)this._cPtr).destroy;
  }

  /**
      Set `destroy` field.
      Params:
        propval = The #GDestroyNotify function to use to free the #GstDataQueueItem.
          This function should also drop the reference to @object the owner of the
          #GstDataQueueItem is assumed to hold.
  */

  @property void destroy(GDestroyNotify propval)
  {
    (cast(GstDataQueueItem*)this._cPtr).destroy = propval;
  }
}
