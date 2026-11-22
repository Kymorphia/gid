/// Module for [Video] class
module gid.gtk4.video;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.file;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.media_stream;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Shows a [gid.gtk4.media_stream.MediaStream] with media controls.
    
    <picture>
      <source srcset="video-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkVideo" src="video.png">
    </picture>
    
    The controls are available separately as [gid.gtk4.media_controls.MediaControls].
    If you just want to display a video without controls, you can treat it
    like any other paintable and for example put it into a [gid.gtk4.picture.Picture].
    
    [gid.gtk4.video.Video] aims to cover use cases such as previews, embedded animations,
    etc. It supports autoplay, looping, and simple media controls. It does
    not have support for video overlays, multichannel audio, device
    selection, or input. If you are writing a full-fledged video player,
    you may want to use the [gid.gdk4.paintable.Paintable] API and a media framework
    such as Gstreamer directly.
*/
class Video : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_video_get_type != &gidSymbolNotFound ? gtk_video_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkVideo";
  }

  /** Returns `this`, for use in `with` statements. */
  override Video self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.video.Video]
      Returns: New builder object
  */
  static VideoGidBuilder builder() nothrow
  {
    return new VideoGidBuilder;
  }

  /**
      Get `autoplay` property.
      Returns: If the video should automatically begin playing.
  */
  @property bool autoplay() nothrow
  {
    return getAutoplay();
  }

  /**
      Set `autoplay` property.
      Params:
        propval = If the video should automatically begin playing.
  */
  @property void autoplay(bool propval) nothrow
  {
    setAutoplay(propval);
  }

  /**
      Get `file` property.
      Returns: The file played by this video if the video is playing a file.
  */
  @property gid.gio2.file.File file() nothrow
  {
    return getFile();
  }

  /**
      Set `file` property.
      Params:
        propval = The file played by this video if the video is playing a file.
  */
  @property void file(gid.gio2.file.File propval) nothrow
  {
    setFile(propval);
  }

  /**
      Get `graphicsOffload` property.
      Returns: Whether to enable graphics offload.
  */
  @property gid.gtk4.types.GraphicsOffloadEnabled graphicsOffload() nothrow
  {
    return getGraphicsOffload();
  }

  /**
      Set `graphicsOffload` property.
      Params:
        propval = Whether to enable graphics offload.
  */
  @property void graphicsOffload(gid.gtk4.types.GraphicsOffloadEnabled propval) nothrow
  {
    setGraphicsOffload(propval);
  }

  /**
      Get `loop` property.
      Returns: If new media files should be set to loop.
  */
  @property bool loop() nothrow
  {
    return getLoop();
  }

  /**
      Set `loop` property.
      Params:
        propval = If new media files should be set to loop.
  */
  @property void loop(bool propval) nothrow
  {
    setLoop(propval);
  }

  /**
      Get `mediaStream` property.
      Returns: The media-stream played
  */
  @property gid.gtk4.media_stream.MediaStream mediaStream() nothrow
  {
    return getMediaStream();
  }

  /**
      Set `mediaStream` property.
      Params:
        propval = The media-stream played
  */
  @property void mediaStream(gid.gtk4.media_stream.MediaStream propval) nothrow
  {
    setMediaStream(propval);
  }

  /**
      Creates a new empty [gid.gtk4.video.Video].
      Returns: a new [gid.gtk4.video.Video]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_video_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a [gid.gtk4.video.Video] to play back the given file.
  
      Params:
        file = a [gid.gio2.file.File]
      Returns: a new [gid.gtk4.video.Video]
  */
  static gid.gtk4.video.Video newForFile(gid.gio2.file.File file = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_video_new_for_file(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.video.Video)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gid.gtk4.video.Video] to play back the given filename.
      
      This is a utility function that calls [gid.gtk4.video.Video.newForFile],
      See that function for details.
  
      Params:
        filename = filename to play back
      Returns: a new [gid.gtk4.video.Video]
  */
  static gid.gtk4.video.Video newForFilename(string filename = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_video_new_for_filename(_filename);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.video.Video)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gid.gtk4.video.Video] to play back the given stream.
  
      Params:
        stream = a [gid.gtk4.media_stream.MediaStream]
      Returns: a new [gid.gtk4.video.Video]
  */
  static gid.gtk4.video.Video newForMediaStream(gid.gtk4.media_stream.MediaStream stream = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_video_new_for_media_stream(stream ? cast(GtkMediaStream*)stream._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.video.Video)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gid.gtk4.video.Video] to play back the resource at the
      given resource_path.
      
      This is a utility function that calls [gid.gtk4.video.Video.newForFile].
  
      Params:
        resourcePath = resource path to play back
      Returns: a new [gid.gtk4.video.Video]
  */
  static gid.gtk4.video.Video newForResource(string resourcePath = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_video_new_for_resource(_resourcePath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.video.Video)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if videos have been set to loop.
      Returns: true if streams should autoplay
  */
  bool getAutoplay() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_video_get_autoplay(cast(GtkVideo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the file played by self or null if not playing back
      a file.
      Returns: The file played by self
  */
  gid.gio2.file.File getFile() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_video_get_file(cast(GtkVideo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether graphics offload is enabled.
      
      See [gid.gtk4.graphics_offload.GraphicsOffload] for more information on graphics offload.
      Returns: the graphics offload status
  */
  gid.gtk4.types.GraphicsOffloadEnabled getGraphicsOffload() nothrow
  {
    GtkGraphicsOffloadEnabled _cretval;
    _cretval = gtk_video_get_graphics_offload(cast(GtkVideo*)this._cPtr);
    gid.gtk4.types.GraphicsOffloadEnabled _retval = cast(gid.gtk4.types.GraphicsOffloadEnabled)_cretval;
    return _retval;
  }

  /**
      Returns true if videos have been set to loop.
      Returns: true if streams should loop
  */
  bool getLoop() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_video_get_loop(cast(GtkVideo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the media stream managed by self or null if none.
      Returns: The media stream managed by self
  */
  gid.gtk4.media_stream.MediaStream getMediaStream() nothrow
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_video_get_media_stream(cast(GtkVideo*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.media_stream.MediaStream)(cast(GtkMediaStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets whether self automatically starts playback when it
      becomes visible or when a new file gets loaded.
  
      Params:
        autoplay = whether media streams should autoplay
  */
  void setAutoplay(bool autoplay) nothrow
  {
    gtk_video_set_autoplay(cast(GtkVideo*)this._cPtr, autoplay);
  }

  /**
      Makes self play the given file.
  
      Params:
        file = the file to play
  */
  void setFile(gid.gio2.file.File file = null) nothrow
  {
    gtk_video_set_file(cast(GtkVideo*)this._cPtr, file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Makes self play the given filename.
      
      This is a utility function that calls [gid.gtk4.video.Video.setFile],
  
      Params:
        filename = the filename to play
  */
  void setFilename(string filename = null) nothrow
  {
    const(char)* _filename = filename.toCString!(No.Malloc, Yes.Nullable);
    gtk_video_set_filename(cast(GtkVideo*)this._cPtr, _filename);
  }

  /**
      Sets whether to enable graphics offload.
      
      See [gid.gtk4.graphics_offload.GraphicsOffload] for more information on graphics offload.
  
      Params:
        enabled = the new graphics offload status
  */
  void setGraphicsOffload(gid.gtk4.types.GraphicsOffloadEnabled enabled) nothrow
  {
    gtk_video_set_graphics_offload(cast(GtkVideo*)this._cPtr, enabled);
  }

  /**
      Sets whether new files loaded by self should be set to loop.
  
      Params:
        loop = whether media streams should loop
  */
  void setLoop(bool loop) nothrow
  {
    gtk_video_set_loop(cast(GtkVideo*)this._cPtr, loop);
  }

  /**
      Sets the media stream to be played back.
      
      self will take full control of managing the media stream. If you
      want to manage a media stream yourself, consider using a
      [gid.gtk4.picture.Picture] for display.
      
      If you want to display a file, consider using [gid.gtk4.video.Video.setFile]
      instead.
  
      Params:
        stream = The media stream to play or null to unset
  */
  void setMediaStream(gid.gtk4.media_stream.MediaStream stream = null) nothrow
  {
    gtk_video_set_media_stream(cast(GtkVideo*)this._cPtr, stream ? cast(GtkMediaStream*)stream._cPtr(No.Dup) : null);
  }

  /**
      Makes self play the resource at the given resource_path.
      
      This is a utility function that calls [gid.gtk4.video.Video.setFile].
  
      Params:
        resourcePath = the resource to set
  */
  void setResource(string resourcePath = null) nothrow
  {
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, Yes.Nullable);
    gtk_video_set_resource(cast(GtkVideo*)this._cPtr, _resourcePath);
  }
}

/// Fluent builder implementation template for [gid.gtk4.video.Video]
class VideoGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `autoplay` property.
      Params:
        propval = If the video should automatically begin playing.
      Returns: Builder instance for fluent chaining
  */
  T autoplay(bool propval) nothrow
  {
    return setProperty("autoplay", propval);
  }

  /**
      Set `file` property.
      Params:
        propval = The file played by this video if the video is playing a file.
      Returns: Builder instance for fluent chaining
  */
  T file(gid.gio2.file.File propval) nothrow
  {
    return setProperty("file", propval);
  }

  /**
      Set `graphicsOffload` property.
      Params:
        propval = Whether to enable graphics offload.
      Returns: Builder instance for fluent chaining
  */
  T graphicsOffload(gid.gtk4.types.GraphicsOffloadEnabled propval) nothrow
  {
    return setProperty("graphics-offload", propval);
  }

  /**
      Set `loop` property.
      Params:
        propval = If new media files should be set to loop.
      Returns: Builder instance for fluent chaining
  */
  T loop(bool propval) nothrow
  {
    return setProperty("loop", propval);
  }

  /**
      Set `mediaStream` property.
      Params:
        propval = The media-stream played
      Returns: Builder instance for fluent chaining
  */
  T mediaStream(gid.gtk4.media_stream.MediaStream propval) nothrow
  {
    return setProperty("media-stream", propval);
  }
}

/// Fluent builder for [gid.gtk4.video.Video]
final class VideoGidBuilder : VideoGidBuilderImpl!VideoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Video build() nothrow
  {
    return new Video(cast(void*)createGObject(Video._getGType), Yes.Take);
  }
}
