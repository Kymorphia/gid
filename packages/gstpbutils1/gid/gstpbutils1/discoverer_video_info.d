/// Module for [DiscovererVideoInfo] class
module gid.gstpbutils1.discoverer_video_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.discoverer_stream_info;
import gid.gstpbutils1.types;

/**
    #GstDiscovererStreamInfo specific to video streams (this includes images).
*/
class DiscovererVideoInfo : gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_discoverer_video_info_get_type != &gidSymbolNotFound ? gst_discoverer_video_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDiscovererVideoInfo";
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererVideoInfo self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstpbutils1.discoverer_video_info.DiscovererVideoInfo]
      Returns: New builder object
  */
  static DiscovererVideoInfoGidBuilder builder() nothrow
  {
    return new DiscovererVideoInfoGidBuilder;
  }

  /** */
  uint getBitrate() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_bitrate(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getDepth() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_depth(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getFramerateDenom() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_framerate_denom(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getFramerateNum() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_framerate_num(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getHeight() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_height(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getMaxBitrate() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_max_bitrate(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getParDenom() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_par_denom(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getParNum() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_par_num(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getWidth() nothrow
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_width(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  bool isImage() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_discoverer_video_info_is_image(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  bool isInterlaced() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_discoverer_video_info_is_interlaced(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstpbutils1.discoverer_video_info.DiscovererVideoInfo]
class DiscovererVideoInfoGidBuilderImpl(T) : gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfoGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstpbutils1.discoverer_video_info.DiscovererVideoInfo]
final class DiscovererVideoInfoGidBuilder : DiscovererVideoInfoGidBuilderImpl!DiscovererVideoInfoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DiscovererVideoInfo build() nothrow
  {
    return new DiscovererVideoInfo(cast(void*)createGObject(DiscovererVideoInfo._getGType), Yes.Take);
  }
}
