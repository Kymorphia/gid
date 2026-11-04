/// Module for [AudioDownmixMeta] class
module gstaudio.audio_downmix_meta;

public import gid.basictypes;
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
class AudioDownmixMeta : StructWrap!(GstAudioDownmixMeta)
{
  /**
      Create a `audio_downmix_meta.AudioDownmixMeta` wrap type.
  */
  this() nothrow
  {
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
  @property gst.meta.Meta meta() nothrow
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstAudioDownmixMeta*)this._cPtr).meta, this);
  }

  /**
      Get `fromPosition` field.
      Returns: the channel positions of the source
  */
  @property gstaudio.types.AudioChannelPosition[] fromPosition() nothrow
  {
    if (!(cast(GstAudioDownmixMeta*)this._cPtr).fromPosition)
      return null;

    return (cast(GstAudioDownmixMeta*)this._cPtr).fromPosition[0 .. (cast(GstAudioDownmixMeta*)this._cPtr).fromChannels].dup;
  }

  /**
      Get `toPosition` field.
      Returns: the channel positions of the destination
  */
  @property gstaudio.types.AudioChannelPosition[] toPosition() nothrow
  {
    if (!(cast(GstAudioDownmixMeta*)this._cPtr).toPosition)
      return null;

    return (cast(GstAudioDownmixMeta*)this._cPtr).toPosition[0 .. (cast(GstAudioDownmixMeta*)this._cPtr).toChannels].dup;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_downmix_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
