/// Module for [AudioMeta] class
module gstaudio.audio_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstaudio.audio_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    #GstAudioDownmixMeta defines an audio downmix matrix to be send along with
    audio buffers. These functions in this module help to create and attach the
    meta as well as extracting it.
*/
class AudioMeta
{
  GstAudioMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_meta.AudioMeta");

    _cInstance = *cast(GstAudioMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAudioMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `info` field.
      Returns: the audio properties of the buffer
  */
  @property gstaudio.audio_info.AudioInfo info()
  {
    return cToD!(gstaudio.audio_info.AudioInfo)(cast(void*)&(cast(GstAudioMeta*)this._cPtr).info);
  }

  /**
      Get `samples` field.
      Returns: the number of valid samples in the buffer
  */
  @property size_t samples()
  {
    return (cast(GstAudioMeta*)this._cPtr).samples;
  }

  /**
      Set `samples` field.
      Params:
        propval = the number of valid samples in the buffer
  */
  @property void samples(size_t propval)
  {
    (cast(GstAudioMeta*)this._cPtr).samples = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
