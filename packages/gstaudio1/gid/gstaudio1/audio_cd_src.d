/// Module for [AudioCdSrc] class
module gid.gstaudio1.audio_cd_src;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.urihandler;
import gid.gst1.urihandler_mixin;
import gid.gstaudio1.audio_cd_src_track;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;
import gid.gstbase1.push_src;

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
    the number of tracks via [gid.gst1.element.Element.queryDuration] using the track
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
    tag list, or calculated via [gid.gst1.toc_entry.TocEntry.getStartStopTimes].
    The track entries in the TOC will be sorted by track number.
*/
@gidGir("AudioCdSrc", "AudioCdSrcClass")
class AudioCdSrc : gid.gstbase1.push_src.PushSrc, gid.gst1.urihandler.URIHandler
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_audio_cd_src_get_type != &gidSymbolNotFound ? gst_audio_cd_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstAudioCdSrc";
  }

  /** Returns `this`, for use in `with` statements. */
  override AudioCdSrc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstaudio1.audio_cd_src.AudioCdSrc]
      Returns: New builder object
  */
  static AudioCdSrcGidBuilder builder() nothrow
  {
    return new AudioCdSrcGidBuilder;
  }

  /** */
  @property string device() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("device");
  }

  /** */
  @property void device(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("device", propval);
  }

  /** */
  @property gid.gstaudio1.types.AudioCdSrcMode mode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstaudio1.types.AudioCdSrcMode)("mode");
  }

  /** */
  @property void mode(gid.gstaudio1.types.AudioCdSrcMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstaudio1.types.AudioCdSrcMode)("mode", propval);
  }

  /** */
  @property uint track() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("track");
  }

  /** */
  @property void track(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("track", propval);
  }

  mixin URIHandlerT!();

  /**
      closing the device
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClose` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncClose()
  {
    auto _klass = cast(GstAudioCdSrcClass*)_vfuncClass;
    if (!_klass.close)
      return;

    _klass.close(cast(GstAudioCdSrc*)this._cPtr);
  }

  /**
      opening the device
  
      Params:
        device = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncOpen` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncOpen(string device)
  {
    auto _klass = cast(GstAudioCdSrcClass*)_vfuncClass;
    if (!_klass.open)
      return typeof(return).init;

    bool _retval;
    const(char)* _device = device.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.open(cast(GstAudioCdSrc*)this._cPtr, _device);
    return _retval;
  }

  /**
      reading a sector
  
      Params:
        sector = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReadSector` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.buffer.Buffer vfuncReadSector(int sector)
  {
    auto _klass = cast(GstAudioCdSrcClass*)_vfuncClass;
    if (!_klass.readSector)
      return typeof(return).init;

    GstBuffer* _cretval;
    _cretval = _klass.readSector(cast(GstAudioCdSrc*)this._cPtr, sector);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      CDDA sources use this function from their start vfunc to announce the
      available data and audio tracks to the base source class. The caller
      should allocate track on the stack, the base source will do a shallow
      copy of the structure (and take ownership of the taglist if there is one).
  
      Params:
        track = address of #GstAudioCdSrcTrack to add
      Returns: FALSE on error, otherwise TRUE.
  */
  bool addTrack(gid.gstaudio1.audio_cd_src_track.AudioCdSrcTrack track) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_audio_cd_src_add_track(cast(GstAudioCdSrc*)this._cPtr, track ? cast(GstAudioCdSrcTrack*)track._cPtr : null);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AudioCdSrc
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstaudio1.audio_cd_src.AudioCdSrc), T.stringof ~ " is not derived from gid.gstaudio1.audio_cd_src.AudioCdSrc");

    gid.gstbase1.push_src.PushSrc._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClose", true)[0]) == gid.gstaudio1.audio_cd_src.AudioCdSrc))
      _installVfunc(klass, "close");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOpen", true)[0]) == gid.gstaudio1.audio_cd_src.AudioCdSrc))
      _installVfunc(klass, "open");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReadSector", true)[0]) == gid.gstaudio1.audio_cd_src.AudioCdSrc))
      _installVfunc(klass, "read_sector");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstAudioCdSrcClass*)klass;

    switch (vfunc)
    {
      case "close":
      {
        static extern(C) void _vfuncCloseTramp(GstAudioCdSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_cd_src.AudioCdSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioCdSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.close)
              return (cast(typeof(&_vfuncCloseTramp))_klass.close)(src);
            return;
          }

          try
          {
            _obj.vfuncClose();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_cd_src.AudioCdSrc.vfuncClose");
          }
        }

        _klass.close = cast(typeof(_klass.close))&_vfuncCloseTramp;
        break;
      }
      case "open":
      {
        static extern(C) gboolean _vfuncOpenTramp(GstAudioCdSrc* src, const(char)* device) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_cd_src.AudioCdSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioCdSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.open)
              return (cast(typeof(&_vfuncOpenTramp))_klass.open)(src, device);
            return typeof(return).init;
          }

          bool _dretval;
          string _device = device.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncOpen(_device);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_cd_src.AudioCdSrc.vfuncOpen");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.open = cast(typeof(_klass.open))&_vfuncOpenTramp;
        break;
      }
      case "read_sector":
      {
        static extern(C) GstBuffer* _vfuncReadSectorTramp(GstAudioCdSrc* src, int sector) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstaudio1.audio_cd_src.AudioCdSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstAudioCdSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.readSector)
              return (cast(typeof(&_vfuncReadSectorTramp))_klass.readSector)(src, sector);
            return typeof(return).init;
          }

          gid.gst1.buffer.Buffer _dretval;

          try
          {
            _dretval = _obj.vfuncReadSector(sector);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstaudio1.audio_cd_src.AudioCdSrc.vfuncReadSector");
          }
          auto _retval = _dretval ? cast(GstBuffer*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.readSector = cast(typeof(_klass.readSector))&_vfuncReadSectorTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstaudio1.audio_cd_src.AudioCdSrc]
class AudioCdSrcGidBuilderImpl(T) : gid.gstbase1.push_src.PushSrcGidBuilderImpl!T, gid.gst1.urihandler.URIHandlerGidBuilderImpl!T
{

  mixin URIHandlerGidBuilderT!();

  /** */
  T device(string propval) nothrow
  {
    return setProperty("device", propval);
  }

  /** */
  T mode(gid.gstaudio1.types.AudioCdSrcMode propval) nothrow
  {
    return setProperty("mode", propval);
  }

  /** */
  T track(uint propval) nothrow
  {
    return setProperty("track", propval);
  }
}

/// Fluent builder for [gid.gstaudio1.audio_cd_src.AudioCdSrc]
final class AudioCdSrcGidBuilder : AudioCdSrcGidBuilderImpl!AudioCdSrcGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AudioCdSrc build() nothrow
  {
    return new AudioCdSrc(cast(void*)createGObject(AudioCdSrc._getGType), Yes.Take);
  }
}
