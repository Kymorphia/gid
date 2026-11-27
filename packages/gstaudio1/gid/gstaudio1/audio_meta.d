/// Module for [AudioMeta] class
module gid.gstaudio1.audio_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstaudio1.audio_info;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/**
    #GstAudioDownmixMeta defines an audio downmix matrix to be send along with
    audio buffers. These functions in this module help to create and attach the
    meta as well as extracting it.
*/
@gidGir("AudioMeta")
class AudioMeta : StructWrap!(GstAudioMeta)
{
  /**
      Create a `audio_meta.AudioMeta` wrap type.
      Params:
        samples = the number of valid samples in the buffer
  */
  this(size_t samples = size_t.init) nothrow
  {
    this.samples = samples;
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
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstAudioMeta*)this._cPtr).meta, this);
  }

  /**
      Get `info` field.
      Returns: the audio properties of the buffer
  */
  @property gid.gstaudio1.audio_info.AudioInfo info() nothrow
  {
    return cToD!(gid.gstaudio1.audio_info.AudioInfo)(cast(void*)&(cast(GstAudioMeta*)this._cPtr).info);
  }

  /**
      Get `samples` field.
      Returns: the number of valid samples in the buffer
  */
  @property size_t samples() nothrow
  {
    return (cast(GstAudioMeta*)this._cPtr).samples;
  }

  /**
      Set `samples` field.
      Params:
        propval = the number of valid samples in the buffer
  */
  @property void samples(size_t propval) nothrow
  {
    (cast(GstAudioMeta*)this._cPtr).samples = propval;
  }

  /**
  Get `offsets` field.
  Returns: the offsets (in bytes) where each channel plane starts in the buffer, one for each channel of the
  audio info, or null if the buffer has interleaved layout
  */
  @property size_t[] offsets() nothrow
  {
    auto meta = cast(GstAudioMeta*)this._cPtr;

    if (!meta.offsets || meta.info.channels <= 0)
      return null;

    return meta.offsets[0 .. meta.info.channels].dup;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
