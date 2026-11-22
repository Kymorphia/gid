/// Module for [MediaControls] class
module gid.gtk4.media_controls;

public import gid.core.basictypes;
import gid.core.utils;
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
    Shows controls for video playback.
    
    <picture>
      <source srcset="media-controls-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkMediaControls" src="media-controls.png">
    </picture>
    
    Usually, [gid.gtk4.media_controls.MediaControls] is used as part of [gid.gtk4.video.Video].
*/
class MediaControls : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_media_controls_get_type != &gidSymbolNotFound ? gtk_media_controls_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMediaControls";
  }

  /** Returns `this`, for use in `with` statements. */
  override MediaControls self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.media_controls.MediaControls]
      Returns: New builder object
  */
  static MediaControlsGidBuilder builder() nothrow
  {
    return new MediaControlsGidBuilder;
  }

  /**
      Get `mediaStream` property.
      Returns: The media-stream managed by this object or null if none.
  */
  @property gid.gtk4.media_stream.MediaStream mediaStream() nothrow
  {
    return getMediaStream();
  }

  /**
      Set `mediaStream` property.
      Params:
        propval = The media-stream managed by this object or null if none.
  */
  @property void mediaStream(gid.gtk4.media_stream.MediaStream propval) nothrow
  {
    setMediaStream(propval);
  }

  /**
      Creates a new [gid.gtk4.media_controls.MediaControls] managing the stream passed to it.
  
      Params:
        stream = a [gid.gtk4.media_stream.MediaStream] to manage
      Returns: a new [gid.gtk4.media_controls.MediaControls]
  */
  this(gid.gtk4.media_stream.MediaStream stream = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_media_controls_new(stream ? cast(GtkMediaStream*)stream._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Gets the media stream managed by controls or null if none.
      Returns: The media stream managed by controls
  */
  gid.gtk4.media_stream.MediaStream getMediaStream() nothrow
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_controls_get_media_stream(cast(GtkMediaControls*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.media_stream.MediaStream)(cast(GtkMediaStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the stream that is controlled by controls.
  
      Params:
        stream = a [gid.gtk4.media_stream.MediaStream]
  */
  void setMediaStream(gid.gtk4.media_stream.MediaStream stream = null) nothrow
  {
    gtk_media_controls_set_media_stream(cast(GtkMediaControls*)this._cPtr, stream ? cast(GtkMediaStream*)stream._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.media_controls.MediaControls]
class MediaControlsGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `mediaStream` property.
      Params:
        propval = The media-stream managed by this object or null if none.
      Returns: Builder instance for fluent chaining
  */
  T mediaStream(gid.gtk4.media_stream.MediaStream propval) nothrow
  {
    return setProperty("media-stream", propval);
  }
}

/// Fluent builder for [gid.gtk4.media_controls.MediaControls]
final class MediaControlsGidBuilder : MediaControlsGidBuilderImpl!MediaControlsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MediaControls build() nothrow
  {
    return new MediaControls(cast(void*)createGObject(MediaControls._getGType), Yes.Take);
  }
}
