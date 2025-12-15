/// C types for gstpbutils1 library
module gstpbutils.c.types;

public import gid.basictypes;
public import gst.c.types;
public import gstaudio.c.types;
public import gstbase.c.types;
public import gstvideo.c.types;

/** */
alias GstDiscovererAudioInfoClass = GObjectClass;

/** */
alias GstDiscovererContainerInfoClass = GObjectClass;

/** */
alias GstDiscovererInfoClass = GObjectClass;

/** */
alias GstDiscovererStreamInfoClass = GObjectClass;

/** */
alias GstDiscovererSubtitleInfoClass = GObjectClass;

/** */
alias GstDiscovererVideoInfoClass = GObjectClass;

/** */
alias GstEncodingTargetClass = GObjectClass;

/**
    Different types of supported background shading functions.
*/
enum GstAudioVisualizerShader
{
  /**
      no shading
  */
  None = 0,

  /**
      plain fading
  */
  Fade = 1,

  /**
      fade and move up
  */
  FadeAndMoveUp = 2,

  /**
      fade and move down
  */
  FadeAndMoveDown = 3,

  /**
      fade and move left
  */
  FadeAndMoveLeft = 4,

  /**
      fade and move right
  */
  FadeAndMoveRight = 5,

  /**
      fade and move horizontally out
  */
  FadeAndMoveHorizOut = 6,

  /**
      fade and move horizontally in
  */
  FadeAndMoveHorizIn = 7,

  /**
      fade and move vertically out
  */
  FadeAndMoveVertOut = 8,

  /**
      fade and move vertically in
  */
  FadeAndMoveVertIn = 9,
}

/**
    Result values for the discovery process.
*/
enum GstDiscovererResult
{
  /**
      The discovery was successful
  */
  Ok = 0,

  /**
      the URI is invalid
  */
  UriInvalid = 1,

  /**
      an error happened and the GError is set
  */
  Error = 2,

  /**
      the discovery timed-out
  */
  Timeout = 3,

  /**
      the discoverer was already discovering a file
  */
  Busy = 4,

  /**
      Some plugins are missing for full discovery
  */
  MissingPlugins = 5,
}

/**
    You can use these flags to control what is serialized by
    [gstpbutils.discoverer_info.DiscovererInfo.toVariant]
*/
enum GstDiscovererSerializeFlags : uint
{
  /**
      Serialize only basic information, excluding
      caps, tags and miscellaneous information
  */
  Basic = 0,

  /**
      Serialize the caps for each stream
  */
  Caps = 1,

  /**
      Serialize the tags for each stream
  */
  Tags = 2,

  /**
      Serialize miscellaneous information for each stream
  */
  Misc = 4,

  /**
      Serialize all the available info, including
      caps, tags and miscellaneous information
  */
  All = 7,
}

/**
    Result codes returned by [gstpbutils.global.installPluginsAsync] and
    [gstpbutils.global.installPluginsSync], and also the result code passed to the
    #GstInstallPluginsResultFunc specified with [gstpbutils.global.installPluginsAsync].
    
    These codes indicate success or failure of starting an external installer
    program and to what extent the requested plugins could be installed.
*/
enum GstInstallPluginsReturn
{
  /**
      all of the requested plugins could be
          installed
  */
  Success = 0,

  /**
      no appropriate installation candidate for
          any of the requested plugins could be found. Only return this if nothing
          has been installed. Return #GST_INSTALL_PLUGINS_PARTIAL_SUCCESS if
          some (but not all) of the requested plugins could be installed.
  */
  NotFound = 1,

  /**
      an error occurred during the installation. If
          this happens, the  user has already seen an error message and another
          one should not be displayed
  */
  Error = 2,

  /**
      some of the requested plugins could
          be installed, but not all
  */
  PartialSuccess = 3,

  /**
      the user has aborted the installation
  */
  UserAbort = 4,

  /**
      the installer had an unclean exit code
          (ie. death by signal)
  */
  Crashed = 100,

  /**
      the helper returned an invalid status code
  */
  Invalid = 101,

  /**
      returned by [gstpbutils.global.installPluginsAsync] to
          indicate that everything went fine so far and the provided callback
          will be called with the result of the installation later
  */
  StartedOk = 200,

  /**
      some internal failure has
          occurred when trying to start the installer
  */
  InternalFailure = 201,

  /**
      the helper script to call the
          actual installer is not installed
  */
  HelperMissing = 202,

  /**
      a previously-started plugin
          installation is still in progress, try again later
  */
  InstallInProgress = 203,
}

/**
    Flags that are returned by [gstpbutils.global.pbUtilsGetCapsDescriptionFlags] and
    describe the format of the caps.
*/
enum GstPbUtilsCapsDescriptionFlags : uint
{
  /**
      Caps describe a container format.
  */
  Container = 1,

  /**
      Caps describe an audio format, or a
          container format that can store audio.
  */
  Audio = 2,

  /**
      Caps describe an video format, or a
          container format that can store video.
  */
  Video = 4,

  /**
      Caps describe an image format, or a
          container format that can store image.
  */
  Image = 8,

  /**
      Caps describe an subtitle format, or a
          container format that can store subtitles.
  */
  Subtitle = 16,

  /**
      Container format is a tags container.
  */
  Tag = 32,

  /**
      Container format can store any kind of
          stream type.
  */
  Generic = 64,

  /**
      Caps describe a metadata format, or a container format that can store
      metadata.
  */
  Metadata = 128,
}

/**
    A baseclass for scopes (visualizers). It takes care of re-fitting the
    audio-rate to video-rate and handles renegotiation (downstream video size
    changes).
    
    It also provides several background shading effects. These effects are
    applied to a previous picture before the `render()` implementation can draw a
    new frame.
*/
struct GstAudioVisualizer
{
  /** */
  GstElement parent;

  /** */
  uint reqSpf;

  /** */
  GstVideoInfo vinfo;

  /** */
  GstAudioInfo ainfo;

  /** */
  GstAudioVisualizerPrivate* priv;
}

/** */
struct GstAudioVisualizerClass
{
  /** */
  GstElementClass parentClass;

  /** */
  extern(C) gboolean function(GstAudioVisualizer* scope_) setup;

  /** */
  extern(C) gboolean function(GstAudioVisualizer* scope_, GstBuffer* audio, GstVideoFrame* video) render;

  /** */
  extern(C) gboolean function(GstAudioVisualizer* scope_, GstQuery* query) decideAllocation;
}

/** */
struct GstAudioVisualizerPrivate;

/**
    The #GstDiscoverer is a utility object which allows to get as much
    information as possible from one or many URIs.
    
    It provides two APIs, allowing usage in blocking or non-blocking mode.
    
    The blocking mode just requires calling [gstpbutils.discoverer.Discoverer.discoverUri]
    with the URI one wishes to discover.
    
    The non-blocking mode requires a running #GMainLoop iterating a
    #GMainContext, where one connects to the various signals, appends the
    URIs to be processed (through [gstpbutils.discoverer.Discoverer.discoverUriAsync]) and then
    asks for the discovery to begin (through [gstpbutils.discoverer.Discoverer.start]).
    By default this will use the GLib default main context unless you have
    set a custom context using [glib.main_context.MainContext.pushThreadDefault].
    
    All the information is returned in a #GstDiscovererInfo structure.
*/
struct GstDiscoverer
{
  /** */
  GObject parent;

  /** */
  GstDiscovererPrivate* priv;

  /** */
  void*[4] Reserved;
}

/**
    #GstDiscovererStreamInfo specific to audio streams.
*/
struct GstDiscovererAudioInfo;

/** */
struct GstDiscovererClass
{
  /** */
  GObjectClass parentclass;

  /** */
  extern(C) void function(GstDiscoverer* discoverer) finished;

  /** */
  extern(C) void function(GstDiscoverer* discoverer) starting;

  /** */
  extern(C) void function(GstDiscoverer* discoverer, GstDiscovererInfo* info, const(GError)* err) discovered;

  /** */
  extern(C) void function(GstDiscoverer* discoverer, GstElement* source) sourceSetup;

  /** */
  extern(C) GstDiscovererInfo* function(GstDiscoverer* dc, char* uri) loadSerializeInfo;

  /** */
  void*[3] Reserved;
}

/**
    #GstDiscovererStreamInfo specific to container streams.
*/
struct GstDiscovererContainerInfo;

/**
    Structure containing the information of a URI analyzed by #GstDiscoverer.
*/
struct GstDiscovererInfo;

/** */
struct GstDiscovererPrivate;

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
struct GstDiscovererStreamInfo;

/**
    #GstDiscovererStreamInfo specific to subtitle streams (this includes text and
    image based ones).
*/
struct GstDiscovererSubtitleInfo;

/**
    #GstDiscovererStreamInfo specific to video streams (this includes images).
*/
struct GstDiscovererVideoInfo;

/**
    Variant of #GstEncodingProfile for audio streams.
*/
struct GstEncodingAudioProfile;

/** */
struct GstEncodingAudioProfileClass;

/**
    Encoding profiles for containers. Keeps track of a list of #GstEncodingProfile
*/
struct GstEncodingContainerProfile;

/** */
struct GstEncodingContainerProfileClass;

/**
    The opaque base class object for all encoding profiles. This contains generic
    information like name, description, format and preset.
*/
struct GstEncodingProfile;

/** */
struct GstEncodingProfileClass;

/**
    Collection of #GstEncodingProfile for a specific target or use-case.
    
    When being stored/loaded, targets come from a specific category, like
    #GST_ENCODING_CATEGORY_DEVICE.
*/
struct GstEncodingTarget;

/**
    Variant of #GstEncodingProfile for video streams, allows specifying the @pass.
*/
struct GstEncodingVideoProfile;

/** */
struct GstEncodingVideoProfileClass;

/**
    Opaque context structure for the plugin installation. Use the provided
    API to set details on it.
*/
struct GstInstallPluginsContext;

alias extern(C) void function(GstAudioVisualizer* scope_, const(GstVideoFrame)* s, GstVideoFrame* d) GstAudioVisualizerShaderFunc;

alias extern(C) void function(GstInstallPluginsReturn result, void* userData) GstInstallPluginsResultFunc;

