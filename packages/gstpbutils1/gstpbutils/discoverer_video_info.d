/// Module for [DiscovererVideoInfo] class
module gstpbutils.discoverer_video_info;

import gid.gid;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_stream_info;
import gstpbutils.types;

/**
    #GstDiscovererStreamInfo specific to video streams (this includes images).
*/
class DiscovererVideoInfo : gstpbutils.discoverer_stream_info.DiscovererStreamInfo
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_discoverer_video_info_get_type != &gidSymbolNotFound ? gst_discoverer_video_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererVideoInfo self()
  {
    return this;
  }

  /** */
  uint getBitrate()
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_bitrate(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getDepth()
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_depth(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getFramerateDenom()
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_framerate_denom(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getFramerateNum()
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_framerate_num(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getHeight()
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_height(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getMaxBitrate()
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_max_bitrate(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getParDenom()
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_par_denom(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getParNum()
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_par_num(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  uint getWidth()
  {
    uint _retval;
    _retval = gst_discoverer_video_info_get_width(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  bool isImage()
  {
    bool _retval;
    _retval = cast(bool)gst_discoverer_video_info_is_image(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  bool isInterlaced()
  {
    bool _retval;
    _retval = cast(bool)gst_discoverer_video_info_is_interlaced(cast(const(GstDiscovererVideoInfo)*)this._cPtr);
    return _retval;
  }
}
