/// Module for [DiscovererInfo] class
module gid.gstpbutils1.discoverer_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gst1.structure;
import gid.gst1.tag_list;
import gid.gst1.toc;
import gid.gst1.types;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.discoverer_audio_info;
import gid.gstpbutils1.discoverer_container_info;
import gid.gstpbutils1.discoverer_stream_info;
import gid.gstpbutils1.discoverer_subtitle_info;
import gid.gstpbutils1.discoverer_video_info;
import gid.gstpbutils1.types;

/**
    Structure containing the information of a URI analyzed by #GstDiscoverer.
*/
class DiscovererInfo : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gst_discoverer_info_get_type != &gidSymbolNotFound ? gst_discoverer_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDiscovererInfo";
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererInfo self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstpbutils1.discoverer_info.DiscovererInfo]
      Returns: New builder object
  */
  static DiscovererInfoGidBuilder builder() nothrow
  {
    return new DiscovererInfoGidBuilder;
  }

  /**
      Parses a #GVariant as produced by [gid.gstpbutils1.discoverer_info.DiscovererInfo.toVariant]
      back to a #GstDiscovererInfo.
  
      Params:
        variant = A #GVariant to deserialize into a #GstDiscovererInfo.
      Returns: A newly-allocated #GstDiscovererInfo.
  */
  static gid.gstpbutils1.discoverer_info.DiscovererInfo fromVariant(gid.glib2.variant.Variant variant) nothrow
  {
    GstDiscovererInfo* _cretval;
    _cretval = gst_discoverer_info_from_variant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstpbutils1.discoverer_info.DiscovererInfo)(cast(GstDiscovererInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gid.gstpbutils1.discoverer_info.DiscovererInfo copy() nothrow
  {
    GstDiscovererInfo* _cretval;
    _cretval = gst_discoverer_info_copy(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstpbutils1.discoverer_info.DiscovererInfo)(cast(GstDiscovererInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finds all the #GstDiscovererAudioInfo contained in info
      Returns: A #GList of
        matching #GstDiscovererStreamInfo. The caller should free it with
        [gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo.listFree].
  */
  gid.gstpbutils1.discoverer_audio_info.DiscovererAudioInfo[] getAudioStreams() nothrow
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_audio_streams(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gListToD!(gid.gstpbutils1.discoverer_audio_info.DiscovererAudioInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds all the #GstDiscovererContainerInfo contained in info
      Returns: A #GList of
        matching #GstDiscovererStreamInfo. The caller should free it with
        [gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo.listFree].
  */
  gid.gstpbutils1.discoverer_container_info.DiscovererContainerInfo[] getContainerStreams() nothrow
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_container_streams(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gListToD!(gid.gstpbutils1.discoverer_container_info.DiscovererContainerInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  gid.gst1.types.ClockTime getDuration() nothrow
  {
    gid.gst1.types.ClockTime _retval;
    _retval = gst_discoverer_info_get_duration(cast(const(GstDiscovererInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  bool getLive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_discoverer_info_get_live(cast(const(GstDiscovererInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gst1.structure.Structure getMisc() nothrow
  {
    const(GstStructure)* _cretval;
    _cretval = gst_discoverer_info_get_misc(cast(const(GstDiscovererInfo)*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the installer details for missing elements
      Returns: An array of strings
        containing information about how to install the various missing elements
        for info to be usable. If you wish to use the strings after the life-time
        of info, you will need to copy them.
  */
  string[] getMissingElementsInstallerDetails() nothrow
  {
    const(char*)* _cretval;
    _cretval = gst_discoverer_info_get_missing_elements_installer_details(cast(const(GstDiscovererInfo)*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /** */
  gid.gstpbutils1.types.DiscovererResult getResult() nothrow
  {
    GstDiscovererResult _cretval;
    _cretval = gst_discoverer_info_get_result(cast(const(GstDiscovererInfo)*)this._cPtr);
    gid.gstpbutils1.types.DiscovererResult _retval = cast(gid.gstpbutils1.types.DiscovererResult)_cretval;
    return _retval;
  }

  /** */
  bool getSeekable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_discoverer_info_get_seekable(cast(const(GstDiscovererInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo getStreamInfo() nothrow
  {
    GstDiscovererStreamInfo* _cretval;
    _cretval = gst_discoverer_info_get_stream_info(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo)(cast(GstDiscovererStreamInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo[] getStreamList() nothrow
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_stream_list(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gListToD!(gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds the #GstDiscovererStreamInfo contained in info that match the
      given streamtype.
  
      Params:
        streamtype = a #GType derived from #GstDiscovererStreamInfo
      Returns: A #GList of
        matching #GstDiscovererStreamInfo. The caller should free it with
        [gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo.listFree].
  */
  gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo[] getStreams(gid.gobject2.types.GType streamtype) nothrow
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_streams(cast(GstDiscovererInfo*)this._cPtr, streamtype);
    auto _retval = gListToD!(gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds all the #GstDiscovererSubtitleInfo contained in info
      Returns: A #GList of
        matching #GstDiscovererStreamInfo. The caller should free it with
        [gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo.listFree].
  */
  gid.gstpbutils1.discoverer_subtitle_info.DiscovererSubtitleInfo[] getSubtitleStreams() nothrow
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_subtitle_streams(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gListToD!(gid.gstpbutils1.discoverer_subtitle_info.DiscovererSubtitleInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  gid.gst1.tag_list.TagList getTags() nothrow
  {
    const(GstTagList)* _cretval;
    _cretval = gst_discoverer_info_get_tags(cast(const(GstDiscovererInfo)*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.tag_list.TagList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gid.gst1.toc.Toc getToc() nothrow
  {
    const(GstToc)* _cretval;
    _cretval = gst_discoverer_info_get_toc(cast(const(GstDiscovererInfo)*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.toc.Toc(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_info_get_uri(cast(const(GstDiscovererInfo)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Finds all the #GstDiscovererVideoInfo contained in info
      Returns: A #GList of
        matching #GstDiscovererStreamInfo. The caller should free it with
        [gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo.listFree].
  */
  gid.gstpbutils1.discoverer_video_info.DiscovererVideoInfo[] getVideoStreams() nothrow
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_video_streams(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gListToD!(gid.gstpbutils1.discoverer_video_info.DiscovererVideoInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Serializes info to a #GVariant that can be parsed again
      through [gid.gstpbutils1.discoverer_info.DiscovererInfo.fromVariant].
      
      Note that any #GstToc (s) that might have been discovered will not be serialized
      for now.
  
      Params:
        flags = A combination of #GstDiscovererSerializeFlags to specify
          what needs to be serialized.
      Returns: A newly-allocated #GVariant representing info.
  */
  gid.glib2.variant.Variant toVariant(gid.gstpbutils1.types.DiscovererSerializeFlags flags) nothrow
  {
    GVariant* _cretval;
    _cretval = gst_discoverer_info_to_variant(cast(GstDiscovererInfo*)this._cPtr, flags);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstpbutils1.discoverer_info.DiscovererInfo]
class DiscovererInfoGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstpbutils1.discoverer_info.DiscovererInfo]
final class DiscovererInfoGidBuilder : DiscovererInfoGidBuilderImpl!DiscovererInfoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DiscovererInfo build() nothrow
  {
    return new DiscovererInfo(cast(void*)createGObject(DiscovererInfo._getGType), Yes.Take);
  }
}
