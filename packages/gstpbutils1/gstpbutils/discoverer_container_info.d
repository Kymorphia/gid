/// Module for [DiscovererContainerInfo] class
module gstpbutils.discoverer_container_info;

import gid.gid;
import gobject.gid_builder;
import gst.tag_list;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_stream_info;
import gstpbutils.types;

/**
    #GstDiscovererStreamInfo specific to container streams.
*/
class DiscovererContainerInfo : gstpbutils.discoverer_stream_info.DiscovererStreamInfo
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
    return cast(void function())gst_discoverer_container_info_get_type != &gidSymbolNotFound ? gst_discoverer_container_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererContainerInfo self()
  {
    return this;
  }

  /**
  Get builder for [gstpbutils.discoverer_container_info.DiscovererContainerInfo]
  Returns: New builder object
  */
  static DiscovererContainerInfoGidBuilder builder()
  {
    return new DiscovererContainerInfoGidBuilder;
  }

  /** */
  gstpbutils.discoverer_stream_info.DiscovererStreamInfo[] getStreams()
  {
    GList* _cretval;
    _cretval = gst_discoverer_container_info_get_streams(cast(GstDiscovererContainerInfo*)this._cPtr);
    auto _retval = gListToD!(gstpbutils.discoverer_stream_info.DiscovererStreamInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  override gst.tag_list.TagList getTags()
  {
    const(GstTagList)* _cretval;
    _cretval = gst_discoverer_container_info_get_tags(cast(const(GstDiscovererContainerInfo)*)this._cPtr);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}

class DiscovererContainerInfoGidBuilderImpl(T) : gstpbutils.discoverer_stream_info.DiscovererStreamInfoGidBuilderImpl!T
{
}

/// Fluent builder for [gstpbutils.discoverer_container_info.DiscovererContainerInfo]
final class DiscovererContainerInfoGidBuilder : DiscovererContainerInfoGidBuilderImpl!DiscovererContainerInfoGidBuilder
{
  DiscovererContainerInfo build()
  {
    return new DiscovererContainerInfo(cast(void*)createGObject(DiscovererContainerInfo._getGType), No.Take);
  }
}
