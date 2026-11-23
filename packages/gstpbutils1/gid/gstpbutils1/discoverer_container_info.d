/// Module for [DiscovererContainerInfo] class
module gid.gstpbutils1.discoverer_container_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.tag_list;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.discoverer_stream_info;
import gid.gstpbutils1.types;

/**
    #GstDiscovererStreamInfo specific to container streams.
*/
class DiscovererContainerInfo : gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_discoverer_container_info_get_type != &gidSymbolNotFound ? gst_discoverer_container_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDiscovererContainerInfo";
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererContainerInfo self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstpbutils1.discoverer_container_info.DiscovererContainerInfo]
      Returns: New builder object
  */
  static DiscovererContainerInfoGidBuilder builder() nothrow
  {
    return new DiscovererContainerInfoGidBuilder;
  }

  /** */
  gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo[] getStreams() nothrow
  {
    GList* _cretval;
    _cretval = gst_discoverer_container_info_get_streams(cast(GstDiscovererContainerInfo*)this._cPtr);
    auto _retval = gListToD!(gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  override gid.gst1.tag_list.TagList getTags() nothrow
  {
    const(GstTagList)* _cretval;
    _cretval = gst_discoverer_container_info_get_tags(cast(const(GstDiscovererContainerInfo)*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.tag_list.TagList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstpbutils1.discoverer_container_info.DiscovererContainerInfo]
class DiscovererContainerInfoGidBuilderImpl(T) : gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfoGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstpbutils1.discoverer_container_info.DiscovererContainerInfo]
final class DiscovererContainerInfoGidBuilder : DiscovererContainerInfoGidBuilderImpl!DiscovererContainerInfoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DiscovererContainerInfo build() nothrow
  {
    return new DiscovererContainerInfo(cast(void*)createGObject(DiscovererContainerInfo._getGType), Yes.Take);
  }
}
