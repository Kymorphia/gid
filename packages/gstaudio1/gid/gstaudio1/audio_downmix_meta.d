/// Module for [AudioDownmixMeta] class
module gid.gstaudio1.audio_downmix_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

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
  @property gid.gst1.meta.Meta meta() nothrow
  {
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstAudioDownmixMeta*)this._cPtr).meta, this);
  }

  /**
      Get `fromPosition` field.
      Returns: the channel positions of the source
  */
  @property gid.gstaudio1.types.AudioChannelPosition[] fromPosition() nothrow
  {
    if (!(cast(GstAudioDownmixMeta*)this._cPtr).fromPosition)
      return null;

    return (cast(GstAudioDownmixMeta*)this._cPtr).fromPosition[0 .. (cast(GstAudioDownmixMeta*)this._cPtr).fromChannels].dup;
  }

  /**
      Get `toPosition` field.
      Returns: the channel positions of the destination
  */
  @property gid.gstaudio1.types.AudioChannelPosition[] toPosition() nothrow
  {
    if (!(cast(GstAudioDownmixMeta*)this._cPtr).toPosition)
      return null;

    return (cast(GstAudioDownmixMeta*)this._cPtr).toPosition[0 .. (cast(GstAudioDownmixMeta*)this._cPtr).toChannels].dup;
  }

  /**
  Get `matrix` field.
  Returns: the matrix coefficients (copied), one row for each destination channel with one coefficient for each
  source channel
  */
  @property float[][] matrix() nothrow
  {
    auto meta = cast(GstAudioDownmixMeta*)this._cPtr;

    if (!meta.matrix || meta.toChannels <= 0 || meta.fromChannels <= 0)
      return null;

    auto _retval = new float[][](meta.toChannels);

    foreach (i, ref row; _retval)
      row = meta.matrix[i] ? meta.matrix[i][0 .. meta.fromChannels].dup : new float[](meta.fromChannels);

    return _retval;
  }


  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_audio_downmix_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
