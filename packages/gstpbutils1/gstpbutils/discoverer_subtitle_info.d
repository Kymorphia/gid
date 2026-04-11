/// Module for [DiscovererSubtitleInfo] class
module gstpbutils.discoverer_subtitle_info;

import gid.gid;
import gobject.gid_builder;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_stream_info;
import gstpbutils.types;

/**
    #GstDiscovererStreamInfo specific to subtitle streams (this includes text and
    image based ones).
*/
class DiscovererSubtitleInfo : gstpbutils.discoverer_stream_info.DiscovererStreamInfo
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
    return cast(void function())gst_discoverer_subtitle_info_get_type != &gidSymbolNotFound ? gst_discoverer_subtitle_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererSubtitleInfo self()
  {
    return this;
  }

  /**
      Get builder for [gstpbutils.discoverer_subtitle_info.DiscovererSubtitleInfo]
      Returns: New builder object
  */
  static DiscovererSubtitleInfoGidBuilder builder()
  {
    return new DiscovererSubtitleInfoGidBuilder;
  }

  /** */
  string getLanguage()
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_subtitle_info_get_language(cast(const(GstDiscovererSubtitleInfo)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gstpbutils.discoverer_subtitle_info.DiscovererSubtitleInfo]
class DiscovererSubtitleInfoGidBuilderImpl(T) : gstpbutils.discoverer_stream_info.DiscovererStreamInfoGidBuilderImpl!T
{
}

/// Fluent builder for [gstpbutils.discoverer_subtitle_info.DiscovererSubtitleInfo]
final class DiscovererSubtitleInfoGidBuilder : DiscovererSubtitleInfoGidBuilderImpl!DiscovererSubtitleInfoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DiscovererSubtitleInfo build()
  {
    return new DiscovererSubtitleInfo(cast(void*)createGObject(DiscovererSubtitleInfo._getGType), No.Take);
  }
}
