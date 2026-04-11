/// Module for [MediaControls] class
module gtk.media_controls;

import gid.gid;
import gobject.gid_builder;
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
    [gtk.media_controls.MediaControls] is a widget to show controls for a video.
    
    ![An example GtkMediaControls](media-controls.png)
    
    Usually, [gtk.media_controls.MediaControls] is used as part of [gtk.video.Video].
*/
class MediaControls : gtk.widget.Widget
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
    return cast(void function())gtk_media_controls_get_type != &gidSymbolNotFound ? gtk_media_controls_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MediaControls self()
  {
    return this;
  }

  /**
      Get builder for [gtk.media_controls.MediaControls]
      Returns: New builder object
  */
  static MediaControlsGidBuilder builder()
  {
    return new MediaControlsGidBuilder;
  }

  /**
      Get `mediaStream` property.
      Returns: The media-stream managed by this object or null if none.
  */
  @property gtk.media_stream.MediaStream mediaStream()
  {
    return getMediaStream();
  }

  /**
      Set `mediaStream` property.
      Params:
        propval = The media-stream managed by this object or null if none.
  */
  @property void mediaStream(gtk.media_stream.MediaStream propval)
  {
    setMediaStream(propval);
  }

  /**
      Creates a new [gtk.media_controls.MediaControls] managing the stream passed to it.
  
      Params:
        stream = a [gtk.media_stream.MediaStream] to manage
      Returns: a new [gtk.media_controls.MediaControls]
  */
  this(gtk.media_stream.MediaStream stream = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_media_controls_new(stream ? cast(GtkMediaStream*)stream._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets the media stream managed by controls or null if none.
      Returns: The media stream managed by controls
  */
  gtk.media_stream.MediaStream getMediaStream()
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_controls_get_media_stream(cast(GtkMediaControls*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.media_stream.MediaStream)(cast(GtkMediaStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the stream that is controlled by controls.
  
      Params:
        stream = a [gtk.media_stream.MediaStream]
  */
  void setMediaStream(gtk.media_stream.MediaStream stream = null)
  {
    gtk_media_controls_set_media_stream(cast(GtkMediaControls*)this._cPtr, stream ? cast(GtkMediaStream*)stream._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.media_controls.MediaControls]
class MediaControlsGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `mediaStream` property.
      Params:
        propval = The media-stream managed by this object or null if none.
      Returns: Builder instance for fluent chaining
  */
  T mediaStream(gtk.media_stream.MediaStream propval)
  {
    return setProperty("media-stream", propval);
  }
}

/// Fluent builder for [gtk.media_controls.MediaControls]
final class MediaControlsGidBuilder : MediaControlsGidBuilderImpl!MediaControlsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MediaControls build()
  {
    return new MediaControls(cast(void*)createGObject(MediaControls._getGType), No.Take);
  }
}
