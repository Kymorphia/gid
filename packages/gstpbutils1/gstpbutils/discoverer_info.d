/// Module for [DiscovererInfo] class
module gstpbutils.discoverer_info;

import gid.gid;
import glib.variant;
import gobject.object;
import gobject.types;
import gst.structure;
import gst.tag_list;
import gst.toc;
import gst.types;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_audio_info;
import gstpbutils.discoverer_container_info;
import gstpbutils.discoverer_stream_info;
import gstpbutils.discoverer_subtitle_info;
import gstpbutils.discoverer_video_info;
import gstpbutils.types;

/**
    Structure containing the information of a URI analyzed by #GstDiscoverer.
*/
class DiscovererInfo : gobject.object.ObjectWrap
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
    return cast(void function())gst_discoverer_info_get_type != &gidSymbolNotFound ? gst_discoverer_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererInfo self()
  {
    return this;
  }

  /**
      Parses a #GVariant as produced by [gstpbutils.discoverer_info.DiscovererInfo.toVariant]
      back to a #GstDiscovererInfo.
  
      Params:
        variant = A #GVariant to deserialize into a #GstDiscovererInfo.
      Returns: A newly-allocated #GstDiscovererInfo.
  */
  static gstpbutils.discoverer_info.DiscovererInfo fromVariant(glib.variant.Variant variant)
  {
    GstDiscovererInfo* _cretval;
    _cretval = gst_discoverer_info_from_variant(variant ? cast(GVariant*)variant._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.discoverer_info.DiscovererInfo)(cast(GstDiscovererInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gstpbutils.discoverer_info.DiscovererInfo copy()
  {
    GstDiscovererInfo* _cretval;
    _cretval = gst_discoverer_info_copy(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.discoverer_info.DiscovererInfo)(cast(GstDiscovererInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finds all the #GstDiscovererAudioInfo contained in info
      Returns: A #GList of
        matching #GstDiscovererStreamInfo. The caller should free it with
        [gstpbutils.discoverer_stream_info.DiscovererStreamInfo.listFree].
  */
  gstpbutils.discoverer_audio_info.DiscovererAudioInfo[] getAudioStreams()
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_audio_streams(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gListToD!(gstpbutils.discoverer_audio_info.DiscovererAudioInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds all the #GstDiscovererContainerInfo contained in info
      Returns: A #GList of
        matching #GstDiscovererStreamInfo. The caller should free it with
        [gstpbutils.discoverer_stream_info.DiscovererStreamInfo.listFree].
  */
  gstpbutils.discoverer_container_info.DiscovererContainerInfo[] getContainerStreams()
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_container_streams(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gListToD!(gstpbutils.discoverer_container_info.DiscovererContainerInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  gst.types.ClockTime getDuration()
  {
    gst.types.ClockTime _retval;
    _retval = gst_discoverer_info_get_duration(cast(const(GstDiscovererInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  bool getLive()
  {
    bool _retval;
    _retval = cast(bool)gst_discoverer_info_get_live(cast(const(GstDiscovererInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  gst.structure.Structure getMisc()
  {
    const(GstStructure)* _cretval;
    _cretval = gst_discoverer_info_get_misc(cast(const(GstDiscovererInfo)*)this._cPtr);
    gst.structure.Structure _retval;
    if (_cretval)
      _retval = *cast(gst.structure.Structure*)_cretval;
    return _retval;
  }

  /**
      Get the installer details for missing elements
      Returns: An array of strings
        containing information about how to install the various missing elements
        for info to be usable. If you wish to use the strings after the life-time
        of info, you will need to copy them.
  */
  string[] getMissingElementsInstallerDetails()
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
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /** */
  gstpbutils.types.DiscovererResult getResult()
  {
    GstDiscovererResult _cretval;
    _cretval = gst_discoverer_info_get_result(cast(const(GstDiscovererInfo)*)this._cPtr);
    gstpbutils.types.DiscovererResult _retval = cast(gstpbutils.types.DiscovererResult)_cretval;
    return _retval;
  }

  /** */
  bool getSeekable()
  {
    bool _retval;
    _retval = cast(bool)gst_discoverer_info_get_seekable(cast(const(GstDiscovererInfo)*)this._cPtr);
    return _retval;
  }

  /** */
  gstpbutils.discoverer_stream_info.DiscovererStreamInfo getStreamInfo()
  {
    GstDiscovererStreamInfo* _cretval;
    _cretval = gst_discoverer_info_get_stream_info(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.discoverer_stream_info.DiscovererStreamInfo)(cast(GstDiscovererStreamInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gstpbutils.discoverer_stream_info.DiscovererStreamInfo[] getStreamList()
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_stream_list(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gListToD!(gstpbutils.discoverer_stream_info.DiscovererStreamInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds the #GstDiscovererStreamInfo contained in info that match the
      given streamtype.
  
      Params:
        streamtype = a #GType derived from #GstDiscovererStreamInfo
      Returns: A #GList of
        matching #GstDiscovererStreamInfo. The caller should free it with
        [gstpbutils.discoverer_stream_info.DiscovererStreamInfo.listFree].
  */
  gstpbutils.discoverer_stream_info.DiscovererStreamInfo[] getStreams(gobject.types.GType streamtype)
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_streams(cast(GstDiscovererInfo*)this._cPtr, streamtype);
    auto _retval = gListToD!(gstpbutils.discoverer_stream_info.DiscovererStreamInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Finds all the #GstDiscovererSubtitleInfo contained in info
      Returns: A #GList of
        matching #GstDiscovererStreamInfo. The caller should free it with
        [gstpbutils.discoverer_stream_info.DiscovererStreamInfo.listFree].
  */
  gstpbutils.discoverer_subtitle_info.DiscovererSubtitleInfo[] getSubtitleStreams()
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_subtitle_streams(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gListToD!(gstpbutils.discoverer_subtitle_info.DiscovererSubtitleInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  gst.tag_list.TagList getTags()
  {
    const(GstTagList)* _cretval;
    _cretval = gst_discoverer_info_get_tags(cast(const(GstDiscovererInfo)*)this._cPtr);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gst.toc.Toc getToc()
  {
    const(GstToc)* _cretval;
    _cretval = gst_discoverer_info_get_toc(cast(const(GstDiscovererInfo)*)this._cPtr);
    auto _retval = _cretval ? new gst.toc.Toc(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_info_get_uri(cast(const(GstDiscovererInfo)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Finds all the #GstDiscovererVideoInfo contained in info
      Returns: A #GList of
        matching #GstDiscovererStreamInfo. The caller should free it with
        [gstpbutils.discoverer_stream_info.DiscovererStreamInfo.listFree].
  */
  gstpbutils.discoverer_video_info.DiscovererVideoInfo[] getVideoStreams()
  {
    GList* _cretval;
    _cretval = gst_discoverer_info_get_video_streams(cast(GstDiscovererInfo*)this._cPtr);
    auto _retval = gListToD!(gstpbutils.discoverer_video_info.DiscovererVideoInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Serializes info to a #GVariant that can be parsed again
      through [gstpbutils.discoverer_info.DiscovererInfo.fromVariant].
      
      Note that any #GstToc (s) that might have been discovered will not be serialized
      for now.
  
      Params:
        flags = A combination of #GstDiscovererSerializeFlags to specify
          what needs to be serialized.
      Returns: A newly-allocated #GVariant representing info.
  */
  glib.variant.Variant toVariant(gstpbutils.types.DiscovererSerializeFlags flags)
  {
    GVariant* _cretval;
    _cretval = gst_discoverer_info_to_variant(cast(GstDiscovererInfo*)this._cPtr, flags);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
