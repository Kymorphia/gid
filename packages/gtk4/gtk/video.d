/// Module for [Video] class
module gtk.video;

import gid.gid;
import gio.file;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.media_stream;
import gtk.types;
import gtk.widget;

/**
    [gtk.video.Video] is a widget to show a [gtk.media_stream.MediaStream] with media controls.
    
    ![An example GtkVideo](video.png)
    
    The controls are available separately as [gtk.media_controls.MediaControls].
    If you just want to display a video without controls, you can treat it
    like any other paintable and for example put it into a [gtk.picture.Picture].
    
    [gtk.video.Video] aims to cover use cases such as previews, embedded animations,
    etc. It supports autoplay, looping, and simple media controls. It does
    not have support for video overlays, multichannel audio, device
    selection, or input. If you are writing a full-fledged video player,
    you may want to use the [gdk.paintable.Paintable] API and a media framework
    such as Gstreamer directly.
*/
class Video : gtk.widget.Widget
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
    return cast(void function())gtk_video_get_type != &gidSymbolNotFound ? gtk_video_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Video self()
  {
    return this;
  }

  /**
      Get `autoplay` property.
      Returns: If the video should automatically begin playing.
  */
  @property bool autoplay()
  {
    return getAutoplay();
  }

  /**
      Set `autoplay` property.
      Params:
        propval = If the video should automatically begin playing.
  */
  @property void autoplay(bool propval)
  {
    return setAutoplay(propval);
  }

  /**
      Get `file` property.
      Returns: The file played by this video if the video is playing a file.
  */
  @property gio.file.File file()
  {
    return getFile();
  }

  /**
      Set `file` property.
      Params:
        propval = The file played by this video if the video is playing a file.
  */
  @property void file(gio.file.File propval)
  {
    return setFile(propval);
  }

  /**
      Get `graphicsOffload` property.
      Returns: Whether to enable graphics offload.
  */
  @property gtk.types.GraphicsOffloadEnabled graphicsOffload()
  {
    return getGraphicsOffload();
  }

  /**
      Set `graphicsOffload` property.
      Params:
        propval = Whether to enable graphics offload.
  */
  @property void graphicsOffload(gtk.types.GraphicsOffloadEnabled propval)
  {
    return setGraphicsOffload(propval);
  }

  /**
      Get `loop` property.
      Returns: If new media files should be set to loop.
  */
  @property bool loop()
  {
    return getLoop();
  }

  /**
      Set `loop` property.
      Params:
        propval = If new media files should be set to loop.
  */
  @property void loop(bool propval)
  {
    return setLoop(propval);
  }

  /**
      Get `mediaStream` property.
      Returns: The media-stream played
  */
  @property gtk.media_stream.MediaStream mediaStream()
  {
    return getMediaStream();
  }

  /**
      Set `mediaStream` property.
      Params:
        propval = The media-stream played
  */
  @property void mediaStream(gtk.media_stream.MediaStream propval)
  {
    return setMediaStream(propval);
  }

  /**
      Creates a new empty [gtk.video.Video].
      Returns: a new [gtk.video.Video]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_video_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a [gtk.video.Video] to play back the given file.
  
      Params:
        file = a [gio.file.File]
      Returns: a new [gtk.video.Video]
  */
  static gtk.video.Video newForFile(gio.file.File file = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_video_new_for_file(file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.video.Video)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gtk.video.Video] to play back the given filename.
      
      This is a utility function that calls [gtk.video.Video.newForFile],
      See that function for details.
  
      Params:
        filename = filename to play back
      Returns: a new [gtk.video.Video]
  */
  static gtk.video.Video newForFilename(string filename = null)
  {
    GtkWidget* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gtk_video_new_for_filename(_filename);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.video.Video)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gtk.video.Video] to play back the given stream.
  
      Params:
        stream = a [gtk.media_stream.MediaStream]
      Returns: a new [gtk.video.Video]
  */
  static gtk.video.Video newForMediaStream(gtk.media_stream.MediaStream stream = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_video_new_for_media_stream(stream ? cast(GtkMediaStream*)stream._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.video.Video)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gtk.video.Video] to play back the resource at the
      given resource_path.
      
      This is a utility function that calls [gtk.video.Video.newForFile].
  
      Params:
        resourcePath = resource path to play back
      Returns: a new [gtk.video.Video]
  */
  static gtk.video.Video newForResource(string resourcePath = null)
  {
    GtkWidget* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    _cretval = gtk_video_new_for_resource(_resourcePath);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.video.Video)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if videos have been set to loop.
      Returns: true if streams should autoplay
  */
  bool getAutoplay()
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
  gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_video_get_file(cast(GtkVideo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether graphics offload is enabled.
      
      See [gtk.graphics_offload.GraphicsOffload] for more information on graphics offload.
      Returns: the graphics offload status
  */
  gtk.types.GraphicsOffloadEnabled getGraphicsOffload()
  {
    GtkGraphicsOffloadEnabled _cretval;
    _cretval = gtk_video_get_graphics_offload(cast(GtkVideo*)this._cPtr);
    gtk.types.GraphicsOffloadEnabled _retval = cast(gtk.types.GraphicsOffloadEnabled)_cretval;
    return _retval;
  }

  /**
      Returns true if videos have been set to loop.
      Returns: true if streams should loop
  */
  bool getLoop()
  {
    bool _retval;
    _retval = cast(bool)gtk_video_get_loop(cast(GtkVideo*)this._cPtr);
    return _retval;
  }

  /**
      Gets the media stream managed by self or null if none.
      Returns: The media stream managed by self
  */
  gtk.media_stream.MediaStream getMediaStream()
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_video_get_media_stream(cast(GtkVideo*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.media_stream.MediaStream)(cast(GtkMediaStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets whether self automatically starts playback when it
      becomes visible or when a new file gets loaded.
  
      Params:
        autoplay = whether media streams should autoplay
  */
  void setAutoplay(bool autoplay)
  {
    gtk_video_set_autoplay(cast(GtkVideo*)this._cPtr, autoplay);
  }

  /**
      Makes self play the given file.
  
      Params:
        file = the file to play
  */
  void setFile(gio.file.File file = null)
  {
    gtk_video_set_file(cast(GtkVideo*)this._cPtr, file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
  }

  /**
      Makes self play the given filename.
      
      This is a utility function that calls [gtk.video.Video.setFile],
  
      Params:
        filename = the filename to play
  */
  void setFilename(string filename = null)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gtk_video_set_filename(cast(GtkVideo*)this._cPtr, _filename);
  }

  /**
      Sets whether to enable graphics offload.
      
      See [gtk.graphics_offload.GraphicsOffload] for more information on graphics offload.
  
      Params:
        enabled = the new graphics offload status
  */
  void setGraphicsOffload(gtk.types.GraphicsOffloadEnabled enabled)
  {
    gtk_video_set_graphics_offload(cast(GtkVideo*)this._cPtr, enabled);
  }

  /**
      Sets whether new files loaded by self should be set to loop.
  
      Params:
        loop = whether media streams should loop
  */
  void setLoop(bool loop)
  {
    gtk_video_set_loop(cast(GtkVideo*)this._cPtr, loop);
  }

  /**
      Sets the media stream to be played back.
      
      self will take full control of managing the media stream. If you
      want to manage a media stream yourself, consider using a
      [gtk.picture.Picture] for display.
      
      If you want to display a file, consider using [gtk.video.Video.setFile]
      instead.
  
      Params:
        stream = The media stream to play or null to unset
  */
  void setMediaStream(gtk.media_stream.MediaStream stream = null)
  {
    gtk_video_set_media_stream(cast(GtkVideo*)this._cPtr, stream ? cast(GtkMediaStream*)stream._cPtr(No.Dup) : null);
  }

  /**
      Makes self play the resource at the given resource_path.
      
      This is a utility function that calls [gtk.video.Video.setFile].
  
      Params:
        resourcePath = the resource to set
  */
  void setResource(string resourcePath = null)
  {
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    gtk_video_set_resource(cast(GtkVideo*)this._cPtr, _resourcePath);
  }
}
