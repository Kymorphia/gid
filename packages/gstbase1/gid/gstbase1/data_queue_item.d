/// Module for [DataQueueItem] class
module gid.gstbase1.data_queue_item;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.types;
import gid.gst1.mini_object;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;

/**
    Structure used by #GstDataQueue. You can supply a different structure, as
    long as the top of the structure is identical to this structure.
*/
class DataQueueItem : StructWrap!(GstDataQueueItem)
{
  /**
      Create a `data_queue_item.DataQueueItem` wrap type.
      Params:
        object = the #GstMiniObject to queue.
        size = the size in bytes of the miniobject.
        duration = the duration in #GstClockTime of the miniobject. Can not be
          [gid.gst1.types.CLOCK_TIME_NONE].
        visible = true if @object should be considered as a visible object.
        destroy = The #GDestroyNotify function to use to free the #GstDataQueueItem.
          This function should also drop the reference to @object the owner of the
          #GstDataQueueItem is assumed to hold.
  */
  this(gid.gst1.mini_object.MiniObject object = gid.gst1.mini_object.MiniObject.init, uint size = uint.init, ulong duration = ulong.init, bool visible = bool.init, GDestroyNotify destroy = GDestroyNotify.init) nothrow
  {
    this.object = object;
    this.size = size;
    this.duration = duration;
    this.visible = visible;
    this.destroy = destroy;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private gid.gst1.mini_object.MiniObject _objectRef; // Keeps borrowed field value alive

  /**
      Get `object` field.
      Returns: the #GstMiniObject to queue.
  */
  @property gid.gst1.mini_object.MiniObject object() nothrow
  {
    return cToD!(gid.gst1.mini_object.MiniObject)(cast(void*)(cast(GstDataQueueItem*)this._cPtr).object);
  }

  /**
      Set `object` field.
      Params:
        propval = the #GstMiniObject to queue.
  */
  @property void object(gid.gst1.mini_object.MiniObject propval) nothrow
  {
    if (_refuseBorrowedStore("object"))
      return;

    _objectRef = propval;
    (cast(GstDataQueueItem*)this._cPtr).object = propval ? cast(GstMiniObject*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `size` field.
      Returns: the size in bytes of the miniobject.
  */
  @property uint size() nothrow
  {
    return (cast(GstDataQueueItem*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = the size in bytes of the miniobject.
  */
  @property void size(uint propval) nothrow
  {
    (cast(GstDataQueueItem*)this._cPtr).size = propval;
  }

  /**
      Get `duration` field.
      Returns: the duration in #GstClockTime of the miniobject. Can not be
        [gid.gst1.types.CLOCK_TIME_NONE].
  */
  @property ulong duration() nothrow
  {
    return (cast(GstDataQueueItem*)this._cPtr).duration;
  }

  /**
      Set `duration` field.
      Params:
        propval = the duration in #GstClockTime of the miniobject. Can not be
          [gid.gst1.types.CLOCK_TIME_NONE].
  */
  @property void duration(ulong propval) nothrow
  {
    (cast(GstDataQueueItem*)this._cPtr).duration = propval;
  }

  /**
      Get `visible` field.
      Returns: true if @object should be considered as a visible object.
  */
  @property bool visible() nothrow
  {
    return cast(bool)(cast(GstDataQueueItem*)this._cPtr).visible;
  }

  /**
      Set `visible` field.
      Params:
        propval = true if @object should be considered as a visible object.
  */
  @property void visible(bool propval) nothrow
  {
    (cast(GstDataQueueItem*)this._cPtr).visible = propval;
  }

  /**
      Get `destroy` field.
      Returns: The #GDestroyNotify function to use to free the #GstDataQueueItem.
        This function should also drop the reference to @object the owner of the
        #GstDataQueueItem is assumed to hold.
  */
  @property GDestroyNotify destroy() nothrow
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

  @property void destroy(GDestroyNotify propval) nothrow
  {
    (cast(GstDataQueueItem*)this._cPtr).destroy = propval;
  }
}
