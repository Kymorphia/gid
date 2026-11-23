/// Module for [DiscovererSubtitleInfo] class
module gid.gstpbutils1.discoverer_subtitle_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.discoverer_stream_info;
import gid.gstpbutils1.types;

/**
    #GstDiscovererStreamInfo specific to subtitle streams (this includes text and
    image based ones).
*/
class DiscovererSubtitleInfo : gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo
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
    return cast(void function())gst_discoverer_subtitle_info_get_type != &gidSymbolNotFound ? gst_discoverer_subtitle_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDiscovererSubtitleInfo";
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererSubtitleInfo self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstpbutils1.discoverer_subtitle_info.DiscovererSubtitleInfo]
      Returns: New builder object
  */
  static DiscovererSubtitleInfoGidBuilder builder() nothrow
  {
    return new DiscovererSubtitleInfoGidBuilder;
  }

  /** */
  string getLanguage() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_subtitle_info_get_language(cast(const(GstDiscovererSubtitleInfo)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstpbutils1.discoverer_subtitle_info.DiscovererSubtitleInfo]
class DiscovererSubtitleInfoGidBuilderImpl(T) : gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfoGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstpbutils1.discoverer_subtitle_info.DiscovererSubtitleInfo]
final class DiscovererSubtitleInfoGidBuilder : DiscovererSubtitleInfoGidBuilderImpl!DiscovererSubtitleInfoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DiscovererSubtitleInfo build() nothrow
  {
    return new DiscovererSubtitleInfo(cast(void*)createGObject(DiscovererSubtitleInfo._getGType), Yes.Take);
  }
}
