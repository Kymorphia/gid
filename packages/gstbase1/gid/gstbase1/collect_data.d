/// Module for [CollectData] class
module gid.gstbase1.collect_data;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.buffer;
import gid.gst1.pad;
import gid.gst1.segment;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.collect_pads;
import gid.gstbase1.types;

/**
    Structure used by the collect_pads.
*/
@gidGir("CollectData")
class CollectData : StructWrap!(GstCollectData)
{
  /**
      Create a `collect_data.CollectData` wrap type.
      Params:
        collect = owner #GstCollectPads
        pad = #GstPad managed by this data
        buffer = currently queued buffer.
        pos = position in the buffer
        segment = last segment received.
  */
  this(gid.gstbase1.collect_pads.CollectPads collect = gid.gstbase1.collect_pads.CollectPads.init, gid.gst1.pad.Pad pad = gid.gst1.pad.Pad.init, gid.gst1.buffer.Buffer buffer = gid.gst1.buffer.Buffer.init, uint pos = uint.init, gid.gst1.segment.Segment segment = gid.gst1.segment.Segment.init) nothrow
  {
    this.collect = collect;
    this.pad = pad;
    this.buffer = buffer;
    this.pos = pos;
    this.segment = segment;
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

  private gid.gstbase1.collect_pads.CollectPads _collectRef; // Keeps borrowed field value alive

  /**
      Get `collect` field.
      Returns: owner #GstCollectPads
  */
  @property gid.gstbase1.collect_pads.CollectPads collect() nothrow
  {
    return cToD!(gid.gstbase1.collect_pads.CollectPads)(cast(void*)(cast(GstCollectData*)this._cPtr).collect);
  }

  /**
      Set `collect` field.
      Params:
        propval = owner #GstCollectPads
  */
  @property void collect(gid.gstbase1.collect_pads.CollectPads propval) nothrow
  {
    if (_refuseBorrowedStore("collect"))
      return;

    _collectRef = propval;
    (cast(GstCollectData*)this._cPtr).collect = propval ? cast(GstCollectPads*)propval._cPtr(No.Dup) : null;
  }

  private gid.gst1.pad.Pad _padRef; // Keeps borrowed field value alive

  /**
      Get `pad` field.
      Returns: #GstPad managed by this data
  */
  @property gid.gst1.pad.Pad pad() nothrow
  {
    return cToD!(gid.gst1.pad.Pad)(cast(void*)(cast(GstCollectData*)this._cPtr).pad);
  }

  /**
      Set `pad` field.
      Params:
        propval = #GstPad managed by this data
  */
  @property void pad(gid.gst1.pad.Pad propval) nothrow
  {
    if (_refuseBorrowedStore("pad"))
      return;

    _padRef = propval;
    (cast(GstCollectData*)this._cPtr).pad = propval ? cast(GstPad*)propval._cPtr(No.Dup) : null;
  }

  private gid.gst1.buffer.Buffer _bufferRef; // Keeps borrowed field value alive

  /**
      Get `buffer` field.
      Returns: currently queued buffer.
  */
  @property gid.gst1.buffer.Buffer buffer() nothrow
  {
    return cToD!(gid.gst1.buffer.Buffer)(cast(void*)(cast(GstCollectData*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = currently queued buffer.
  */
  @property void buffer(gid.gst1.buffer.Buffer propval) nothrow
  {
    if (_refuseBorrowedStore("buffer"))
      return;

    _bufferRef = propval;
    (cast(GstCollectData*)this._cPtr).buffer = propval ? cast(GstBuffer*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `pos` field.
      Returns: position in the buffer
  */
  @property uint pos() nothrow
  {
    return (cast(GstCollectData*)this._cPtr).pos;
  }

  /**
      Set `pos` field.
      Params:
        propval = position in the buffer
  */
  @property void pos(uint propval) nothrow
  {
    (cast(GstCollectData*)this._cPtr).pos = propval;
  }

  /**
      Get `segment` field.
      Returns: last segment received.
  */
  @property gid.gst1.segment.Segment segment() nothrow
  {
    return cToD!(gid.gst1.segment.Segment)(cast(void*)&(cast(GstCollectData*)this._cPtr).segment);
  }

  /**
      Set `segment` field.
      Params:
        propval = last segment received.
  */
  @property void segment(gid.gst1.segment.Segment propval) nothrow
  {
    (cast(GstCollectData*)this._cPtr).segment = cast(GstSegment)propval;
  }
}
