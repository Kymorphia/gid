/// Module for [AudioClippingMeta] class
module gstaudio.audio_clipping_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gst.types;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Extra buffer metadata describing how much audio has to be clipped from
    the start or end of a buffer. This is used for compressed formats, where
    the first frame usually has some additional samples due to encoder and
    decoder delays, and the last frame usually has some additional samples to
    be able to fill the complete last frame.
    
    This is used to ensure that decoded data in the end has the same amount of
    samples, and multiply decoded streams can be gaplessly concatenated.
    
    Note: If clipping of the start is done by adjusting the segment, this meta
    has to be dropped from buffers as otherwise clipping could happen twice.
*/
class AudioClippingMeta
{
  GstAudioClippingMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_clipping_meta.AudioClippingMeta");

    _cInstance = *cast(GstAudioClippingMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAudioClippingMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `format` field.
      Returns: GstFormat of @start and @stop, GST_FORMAT_DEFAULT is samples
  */
  @property gst.types.Format format()
  {
    return cast(gst.types.Format)(cast(GstAudioClippingMeta*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = GstFormat of @start and @stop, GST_FORMAT_DEFAULT is samples
  */
  @property void format(gst.types.Format propval)
  {
    (cast(GstAudioClippingMeta*)this._cPtr).format = cast(GstFormat)propval;
  }

  /**
      Get `start` field.
      Returns: Amount of audio to clip from start of buffer
  */
  @property ulong start()
  {
    return (cast(GstAudioClippingMeta*)this._cPtr).start;
  }

  /**
      Set `start` field.
      Params:
        propval = Amount of audio to clip from start of buffer
  */
  @property void start(ulong propval)
  {
    (cast(GstAudioClippingMeta*)this._cPtr).start = propval;
  }

  /**
      Get `end` field.
      Returns: Amount of  to clip from end of buffer
  */
  @property ulong end()
  {
    return (cast(GstAudioClippingMeta*)this._cPtr).end;
  }

  /**
      Set `end` field.
      Params:
        propval = Amount of  to clip from end of buffer
  */
  @property void end(ulong propval)
  {
    (cast(GstAudioClippingMeta*)this._cPtr).end = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_clipping_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
