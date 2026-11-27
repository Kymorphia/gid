/// Module for [AudioClippingMeta] class
module gid.gstaudio1.audio_clipping_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gst1.types;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

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
@gidGir("AudioClippingMeta")
class AudioClippingMeta : StructWrap!(GstAudioClippingMeta)
{
  /**
      Create a `audio_clipping_meta.AudioClippingMeta` wrap type.
      Params:
        format = GstFormat of @start and @stop, GST_FORMAT_DEFAULT is samples
        start = Amount of audio to clip from start of buffer
        end = Amount of  to clip from end of buffer
  */
  this(gid.gst1.types.Format format = gid.gst1.types.Format.init, ulong start = ulong.init, ulong end = ulong.init) nothrow
  {
    this.format = format;
    this.start = start;
    this.end = end;
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

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gid.gst1.meta.Meta meta() nothrow
  {
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstAudioClippingMeta*)this._cPtr).meta, this);
  }

  /**
      Get `format` field.
      Returns: GstFormat of @start and @stop, GST_FORMAT_DEFAULT is samples
  */
  @property gid.gst1.types.Format format() nothrow
  {
    return cast(gid.gst1.types.Format)(cast(GstAudioClippingMeta*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = GstFormat of @start and @stop, GST_FORMAT_DEFAULT is samples
  */
  @property void format(gid.gst1.types.Format propval) nothrow
  {
    (cast(GstAudioClippingMeta*)this._cPtr).format = cast(GstFormat)propval;
  }

  /**
      Get `start` field.
      Returns: Amount of audio to clip from start of buffer
  */
  @property ulong start() nothrow
  {
    return (cast(GstAudioClippingMeta*)this._cPtr).start;
  }

  /**
      Set `start` field.
      Params:
        propval = Amount of audio to clip from start of buffer
  */
  @property void start(ulong propval) nothrow
  {
    (cast(GstAudioClippingMeta*)this._cPtr).start = propval;
  }

  /**
      Get `end` field.
      Returns: Amount of  to clip from end of buffer
  */
  @property ulong end() nothrow
  {
    return (cast(GstAudioClippingMeta*)this._cPtr).end;
  }

  /**
      Set `end` field.
      Params:
        propval = Amount of  to clip from end of buffer
  */
  @property void end(ulong propval) nothrow
  {
    (cast(GstAudioClippingMeta*)this._cPtr).end = propval;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_clipping_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
