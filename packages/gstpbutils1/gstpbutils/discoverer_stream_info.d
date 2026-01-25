/// Module for [DiscovererStreamInfo] class
module gstpbutils.discoverer_stream_info;

import gid.gid;
import gobject.object;
import gst.caps;
import gst.structure;
import gst.tag_list;
import gst.toc;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.types;

/**
    Base structure for information concerning a media stream. Depending on the
    stream type, one can find more media-specific information in
    #GstDiscovererAudioInfo, #GstDiscovererVideoInfo, and
    #GstDiscovererContainerInfo.
    
    The #GstDiscovererStreamInfo represents the topology of the stream. Siblings
    can be iterated over with [gstpbutils.discoverer_stream_info.DiscovererStreamInfo.getNext] and
    [gstpbutils.discoverer_stream_info.DiscovererStreamInfo.getPrevious]. Children (sub-streams) of a
    stream can be accessed using the #GstDiscovererContainerInfo API.
    
    As a simple example, if you run #GstDiscoverer on an AVI file with one audio
    and one video stream, you will get a #GstDiscovererContainerInfo
    corresponding to the AVI container, which in turn will have a
    #GstDiscovererAudioInfo sub-stream and a #GstDiscovererVideoInfo sub-stream
    for the audio and video streams respectively.
*/
class DiscovererStreamInfo : gobject.object.ObjectWrap
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
    return cast(void function())gst_discoverer_stream_info_get_type != &gidSymbolNotFound ? gst_discoverer_stream_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererStreamInfo self()
  {
    return this;
  }

  /**
      Decrements the reference count of all contained #GstDiscovererStreamInfo
      and fress the #GList.
  
      Params:
        infos = a #GList of #GstDiscovererStreamInfo
  */
  static void listFree(gstpbutils.discoverer_stream_info.DiscovererStreamInfo[] infos)
  {
    auto _infos = gListFromD!(gstpbutils.discoverer_stream_info.DiscovererStreamInfo)(infos);
    scope(exit) containerFree!(GList*, gstpbutils.discoverer_stream_info.DiscovererStreamInfo, GidOwnership.None)(_infos);
    gst_discoverer_stream_info_list_free(_infos);
  }

  /** */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_discoverer_stream_info_get_caps(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  gst.structure.Structure getMisc()
  {
    const(GstStructure)* _cretval;
    _cretval = gst_discoverer_stream_info_get_misc(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gstpbutils.discoverer_stream_info.DiscovererStreamInfo getNext()
  {
    GstDiscovererStreamInfo* _cretval;
    _cretval = gst_discoverer_stream_info_get_next(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.discoverer_stream_info.DiscovererStreamInfo)(cast(GstDiscovererStreamInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gstpbutils.discoverer_stream_info.DiscovererStreamInfo getPrevious()
  {
    GstDiscovererStreamInfo* _cretval;
    _cretval = gst_discoverer_stream_info_get_previous(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstpbutils.discoverer_stream_info.DiscovererStreamInfo)(cast(GstDiscovererStreamInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string getStreamId()
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_stream_info_get_stream_id(cast(GstDiscovererStreamInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  int getStreamNumber()
  {
    int _retval;
    _retval = gst_discoverer_stream_info_get_stream_number(cast(GstDiscovererStreamInfo*)this._cPtr);
    return _retval;
  }

  /** */
  string getStreamTypeNick()
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_stream_info_get_stream_type_nick(cast(GstDiscovererStreamInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  gst.tag_list.TagList getTags()
  {
    const(GstTagList)* _cretval;
    _cretval = gst_discoverer_stream_info_get_tags(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gst.toc.Toc getToc()
  {
    const(GstToc)* _cretval;
    _cretval = gst_discoverer_stream_info_get_toc(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = _cretval ? new gst.toc.Toc(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
