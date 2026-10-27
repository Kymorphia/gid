/// Module for [CollectData] class
module gstbase.collect_data;

public import gid.basictypes;
import gid.gid;
import gst.buffer;
import gst.pad;
import gst.segment;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.collect_pads;
import gstbase.types;

/**
    Structure used by the collect_pads.
*/
class CollectData
{
  GstCollectData _cInstance;

  /**
      Create a `collect_data.CollectData` wrap type.
      Params:
        collect = owner #GstCollectPads
        pad = #GstPad managed by this data
        buffer = currently queued buffer.
        pos = position in the buffer
        segment = last segment received.
  */
  this(gstbase.collect_pads.CollectPads collect = gstbase.collect_pads.CollectPads.init, gst.pad.Pad pad = gst.pad.Pad.init, gst.buffer.Buffer buffer = gst.buffer.Buffer.init, uint pos = uint.init, gst.segment.Segment segment = gst.segment.Segment.init) nothrow
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
    _cInstance = *cast(GstCollectData*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  private gstbase.collect_pads.CollectPads _collectRef; // Keeps borrowed field value alive

  /**
      Get `collect` field.
      Returns: owner #GstCollectPads
  */
  @property gstbase.collect_pads.CollectPads collect() nothrow
  {
    return cToD!(gstbase.collect_pads.CollectPads)(cast(void*)(cast(GstCollectData*)this._cPtr).collect);
  }

  /**
      Set `collect` field.
      Params:
        propval = owner #GstCollectPads
  */
  @property void collect(gstbase.collect_pads.CollectPads propval) nothrow
  {
    _collectRef = propval;
    (cast(GstCollectData*)this._cPtr).collect = propval ? cast(GstCollectPads*)propval._cPtr(No.Dup) : null;
  }

  private gst.pad.Pad _padRef; // Keeps borrowed field value alive

  /**
      Get `pad` field.
      Returns: #GstPad managed by this data
  */
  @property gst.pad.Pad pad() nothrow
  {
    return cToD!(gst.pad.Pad)(cast(void*)(cast(GstCollectData*)this._cPtr).pad);
  }

  /**
      Set `pad` field.
      Params:
        propval = #GstPad managed by this data
  */
  @property void pad(gst.pad.Pad propval) nothrow
  {
    _padRef = propval;
    (cast(GstCollectData*)this._cPtr).pad = propval ? cast(GstPad*)propval._cPtr(No.Dup) : null;
  }

  private gst.buffer.Buffer _bufferRef; // Keeps borrowed field value alive

  /**
      Get `buffer` field.
      Returns: currently queued buffer.
  */
  @property gst.buffer.Buffer buffer() nothrow
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstCollectData*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = currently queued buffer.
  */
  @property void buffer(gst.buffer.Buffer propval) nothrow
  {
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
  @property gst.segment.Segment segment() nothrow
  {
    return cToD!(gst.segment.Segment)(cast(void*)&(cast(GstCollectData*)this._cPtr).segment);
  }

  /**
      Set `segment` field.
      Params:
        propval = last segment received.
  */
  @property void segment(gst.segment.Segment propval) nothrow
  {
    (cast(GstCollectData*)this._cPtr).segment = cast(GstSegment)propval;
  }
}
