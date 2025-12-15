/// Module for [AudioCdSrc] class
module gstaudio.audio_cd_src;

import gid.gid;
import gobject.object;
import gst.urihandler;
import gst.urihandler_mixin;
import gstaudio.audio_cd_src_track;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;
import gstbase.push_src;

/**
    Provides a base class for CD digital audio (CDDA) sources, which handles
    things like seeking, querying, discid calculation, tags, and buffer
    timestamping.
    
    ## Using GstAudioCdSrc-based elements in applications
    
    GstAudioCdSrc registers two #GstFormat<!-- -->s of its own, namely
    the "track" format and the "sector" format. Applications will usually
    only find the "track" format interesting. You can retrieve that #GstFormat
    for use in seek events or queries with gst_format_get_by_nick("track").
    
    In order to query the number of tracks, for example, an application would
    set the CDDA source element to READY or PAUSED state and then query the
    the number of tracks via [gst.element.Element.queryDuration] using the track
    format acquired above. Applications can query the currently playing track
    in the same way.
    
    Alternatively, applications may retrieve the currently playing track and
    the total number of tracks from the taglist that will posted on the bus
    whenever the CD is opened or the currently playing track changes. The
    taglist will contain GST_TAG_TRACK_NUMBER and GST_TAG_TRACK_COUNT tags.
    
    Applications playing back CD audio using playbin and cdda://n URIs should
    issue a seek command in track format to change between tracks, rather than
    setting a new cdda://n+1 URI on playbin (as setting a new URI on playbin
    involves closing and re-opening the CD device, which is much much slower).
    
    ## Tags and meta-information
    
    CDDA sources will automatically emit a number of tags, details about which
    can be found in the libgsttag documentation. Those tags are:
    #GST_TAG_CDDA_CDDB_DISCID, #GST_TAG_CDDA_CDDB_DISCID_FULL,
    #GST_TAG_CDDA_MUSICBRAINZ_DISCID, #GST_TAG_CDDA_MUSICBRAINZ_DISCID_FULL,
    among others.
    
    ## Tracks and Table of Contents (TOC)
    
    Applications will be informed of the available tracks via a TOC message
    on the pipeline's #GstBus. The #GstToc will contain a #GstTocEntry for
    each track, with information about each track. The duration for each
    track can be retrieved via the #GST_TAG_DURATION tag from each entry's
    tag list, or calculated via [gst.toc_entry.TocEntry.getStartStopTimes].
    The track entries in the TOC will be sorted by track number.
*/
class AudioCdSrc : gstbase.push_src.PushSrc, gst.urihandler.URIHandler
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
    return cast(void function())gst_audio_cd_src_get_type != &gidSymbolNotFound ? gst_audio_cd_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioCdSrc self()
  {
    return this;
  }

  /** */
  @property string device()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("device");
  }

  /** */
  @property void device(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("device", propval);
  }

  /** */
  @property gstaudio.types.AudioCdSrcMode mode()
  {
    return gobject.object.ObjectWrap.getProperty!(gstaudio.types.AudioCdSrcMode)("mode");
  }

  /** */
  @property void mode(gstaudio.types.AudioCdSrcMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstaudio.types.AudioCdSrcMode)("mode", propval);
  }

  /** */
  @property uint track()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("track");
  }

  /** */
  @property void track(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("track", propval);
  }

  mixin URIHandlerT!();

  /**
      CDDA sources use this function from their start vfunc to announce the
      available data and audio tracks to the base source class. The caller
      should allocate track on the stack, the base source will do a shallow
      copy of the structure (and take ownership of the taglist if there is one).
  
      Params:
        track = address of #GstAudioCdSrcTrack to add
      Returns: FALSE on error, otherwise TRUE.
  */
  bool addTrack(gstaudio.audio_cd_src_track.AudioCdSrcTrack track)
  {
    bool _retval;
    _retval = cast(bool)gst_audio_cd_src_add_track(cast(GstAudioCdSrc*)this._cPtr, track ? cast(GstAudioCdSrcTrack*)track._cPtr : null);
    return _retval;
  }
}
