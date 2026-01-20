/// Module for [AudioDownmixMeta] class
module gstaudio.audio_downmix_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/**
    Extra buffer metadata describing audio downmixing matrix. This metadata is
    attached to audio buffers and contains a matrix to downmix the buffer number
    of channels to @channels.
    
    @matrix is an two-dimensional array of @to_channels times @from_channels
    coefficients, i.e. the i-th output channels is constructed by multiplicating
    the input channels with the coefficients in @matrix[i] and taking the sum
    of the results.
*/
class AudioDownmixMeta
{
  GstAudioDownmixMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstaudio.audio_downmix_meta.AudioDownmixMeta");

    _cInstance = *cast(GstAudioDownmixMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAudioDownmixMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `fromChannels` field.
      Returns: the number of channels of the source
  */
  @property int fromChannels()
  {
    return (cast(GstAudioDownmixMeta*)this._cPtr).fromChannels;
  }

  /**
      Set `fromChannels` field.
      Params:
        propval = the number of channels of the source
  */
  @property void fromChannels(int propval)
  {
    (cast(GstAudioDownmixMeta*)this._cPtr).fromChannels = propval;
  }

  /**
      Get `toChannels` field.
      Returns: the number of channels of the destination
  */
  @property int toChannels()
  {
    return (cast(GstAudioDownmixMeta*)this._cPtr).toChannels;
  }

  /**
      Set `toChannels` field.
      Params:
        propval = the number of channels of the destination
  */
  @property void toChannels(int propval)
  {
    (cast(GstAudioDownmixMeta*)this._cPtr).toChannels = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_downmix_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
