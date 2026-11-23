/// Module for [DiscovererStreamInfo] class
module gid.gstpbutils1.discoverer_stream_info;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.caps;
import gid.gst1.structure;
import gid.gst1.tag_list;
import gid.gst1.toc;
import gid.gstpbutils1.c.functions;
import gid.gstpbutils1.c.types;
import gid.gstpbutils1.types;

/**
    Base structure for information concerning a media stream. Depending on the
    stream type, one can find more media-specific information in
    #GstDiscovererAudioInfo, #GstDiscovererVideoInfo, and
    #GstDiscovererContainerInfo.
    
    The #GstDiscovererStreamInfo represents the topology of the stream. Siblings
    can be iterated over with [gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo.getNext] and
    [gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo.getPrevious]. Children (sub-streams) of a
    stream can be accessed using the #GstDiscovererContainerInfo API.
    
    As a simple example, if you run #GstDiscoverer on an AVI file with one audio
    and one video stream, you will get a #GstDiscovererContainerInfo
    corresponding to the AVI container, which in turn will have a
    #GstDiscovererAudioInfo sub-stream and a #GstDiscovererVideoInfo sub-stream
    for the audio and video streams respectively.
*/
class DiscovererStreamInfo : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gst_discoverer_stream_info_get_type != &gidSymbolNotFound ? gst_discoverer_stream_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDiscovererStreamInfo";
  }

  /** Returns `this`, for use in `with` statements. */
  override DiscovererStreamInfo self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo]
      Returns: New builder object
  */
  static DiscovererStreamInfoGidBuilder builder() nothrow
  {
    return new DiscovererStreamInfoGidBuilder;
  }

  /**
      Decrements the reference count of all contained #GstDiscovererStreamInfo
      and fress the #GList.
  
      Params:
        infos = a #GList of #GstDiscovererStreamInfo
  */
  static void listFree(gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo[] infos) nothrow
  {
    auto _infos = gListFromD!(gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo)(infos);
    gst_discoverer_stream_info_list_free(_infos);
  }

  /** */
  gid.gst1.caps.Caps getCaps() nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_discoverer_stream_info_get_caps(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  gid.gst1.structure.Structure getMisc() nothrow
  {
    const(GstStructure)* _cretval;
    _cretval = gst_discoverer_stream_info_get_misc(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo getNext() nothrow
  {
    GstDiscovererStreamInfo* _cretval;
    _cretval = gst_discoverer_stream_info_get_next(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo)(cast(GstDiscovererStreamInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo getPrevious() nothrow
  {
    GstDiscovererStreamInfo* _cretval;
    _cretval = gst_discoverer_stream_info_get_previous(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo)(cast(GstDiscovererStreamInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string getStreamId() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_stream_info_get_stream_id(cast(GstDiscovererStreamInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  int getStreamNumber() nothrow
  {
    int _retval;
    _retval = gst_discoverer_stream_info_get_stream_number(cast(GstDiscovererStreamInfo*)this._cPtr);
    return _retval;
  }

  /** */
  string getStreamTypeNick() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_discoverer_stream_info_get_stream_type_nick(cast(GstDiscovererStreamInfo*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  gid.gst1.tag_list.TagList getTags() nothrow
  {
    const(GstTagList)* _cretval;
    _cretval = gst_discoverer_stream_info_get_tags(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.tag_list.TagList(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gid.gst1.toc.Toc getToc() nothrow
  {
    const(GstToc)* _cretval;
    _cretval = gst_discoverer_stream_info_get_toc(cast(GstDiscovererStreamInfo*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.toc.Toc(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo]
class DiscovererStreamInfoGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstpbutils1.discoverer_stream_info.DiscovererStreamInfo]
final class DiscovererStreamInfoGidBuilder : DiscovererStreamInfoGidBuilderImpl!DiscovererStreamInfoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DiscovererStreamInfo build() nothrow
  {
    return new DiscovererStreamInfo(cast(void*)createGObject(DiscovererStreamInfo._getGType), Yes.Take);
  }
}
