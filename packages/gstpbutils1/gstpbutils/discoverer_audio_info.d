/// Module for [DiscovererAudioInfo] class
module gstpbutils.discoverer_audio_info;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_stream_info;
import gstpbutils.types;

/**
    #GstDiscovererStreamInfo specific to audio streams.
*/
class DiscovererAudioInfo : gstpbutils.discoverer_stream_info.DiscovererStreamInfo
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_discoverer_audio_info_get_type != &gidSymbolNotFound ? gst_discoverer_audio_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererAudioInfo self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gstpbutils.discoverer_audio_info.DiscovererAudioInfo]
      Returns: New builder object
  */
  static DiscovererAudioInfoGidBuilder builder() nothrow
  {
    return new DiscovererAudioInfoGidBuilder;
  }

  /** */
  uint getBitrate() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_audio_info_get_bitrate(cast(const(GstDiscovererAudioInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  ulong getChannelMask() nothrow
  {
    ulong _retval;
    _retval = gst_discoverer_audio_info_get_channel_mask(cast(const(GstDiscovererAudioInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getChannels() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_audio_info_get_channels(cast(const(GstDiscovererAudioInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getDepth() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_audio_info_get_depth(cast(const(GstDiscovererAudioInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  string getLanguage() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_audio_info_get_language(cast(const(GstDiscovererAudioInfo)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  uint getMaxBitrate() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_audio_info_get_max_bitrate(cast(const(GstDiscovererAudioInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getSampleRate() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_audio_info_get_sample_rate(cast(const(GstDiscovererAudioInfo)*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gstpbutils.discoverer_audio_info.DiscovererAudioInfo]
class DiscovererAudioInfoGidBuilderImpl(T) : gstpbutils.discoverer_stream_info.DiscovererStreamInfoGidBuilderImpl!T
{
}

/// Fluent builder for [gstpbutils.discoverer_audio_info.DiscovererAudioInfo]
final class DiscovererAudioInfoGidBuilder : DiscovererAudioInfoGidBuilderImpl!DiscovererAudioInfoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DiscovererAudioInfo build() nothrow
  {
    return new DiscovererAudioInfo(cast(void*)createGObject(DiscovererAudioInfo._getGType), No.Take);
  }
}
