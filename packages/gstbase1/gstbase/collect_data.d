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

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstCollectData*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

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
    cValueFree!(gstbase.collect_pads.CollectPads)(cast(void*)(cast(GstCollectData*)this._cPtr).collect);
    dToC(propval, cast(void*)&(cast(GstCollectData*)this._cPtr).collect);
  }

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
    cValueFree!(gst.pad.Pad)(cast(void*)(cast(GstCollectData*)this._cPtr).pad);
    dToC(propval, cast(void*)&(cast(GstCollectData*)this._cPtr).pad);
  }

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
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstCollectData*)this._cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstCollectData*)this._cPtr).buffer);
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
