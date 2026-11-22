/// Module for [PixbufAnimationIter] class
module gid.gdkpixbuf2.pixbuf_animation_iter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdkpixbuf2.c.functions;
import gid.gdkpixbuf2.c.types;
import gid.gdkpixbuf2.pixbuf;
import gid.gdkpixbuf2.types;
import gid.glib2.time_val;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    An opaque object representing an iterator which points to a
    certain position in an animation.

    Deprecated: Use a different image loading library for animatable assets
*/
class PixbufAnimationIter : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_pixbuf_animation_iter_get_type != &gidSymbolNotFound ? gdk_pixbuf_animation_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkPixbufAnimationIter";
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufAnimationIter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter]
      Returns: New builder object
  */
  static PixbufAnimationIterGidBuilder builder() nothrow
  {
    return new PixbufAnimationIterGidBuilder;
  }

  /**
      Possibly advances an animation to a new frame.
      
      Chooses the frame based on the start time passed to
      [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.getIter].
      
      current_time would normally come from [gid.glib2.global.getCurrentTime], and
      must be greater than or equal to the time passed to
      [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.getIter], and must increase or remain
      unchanged each time [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.getPixbuf] is
      called. That is, you can't go backward in time; animations only
      play forward.
      
      As a shortcut, pass `NULL` for the current time and [gid.glib2.global.getCurrentTime]
      will be invoked on your behalf. So you only need to explicitly pass
      current_time if you're doing something odd like playing the animation
      at double speed.
      
      If this function returns `FALSE`, there's no need to update the animation
      display, assuming the display had been rendered prior to advancing;
      if `TRUE`, you need to call [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.getPixbuf]
      and update the display with the new pixbuf.
  
      Params:
        currentTime = current time
      Returns: `TRUE` if the image may need updating
  
      Deprecated: Use a different image loading library for animatable assets
  */
  bool advance(gid.glib2.time_val.TimeVal* currentTime = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_pixbuf_animation_iter_advance(cast(GdkPixbufAnimationIter*)this._cPtr, cast(const(GTimeVal)*)currentTime);
    return _retval;
  }

  /**
      Gets the number of milliseconds the current pixbuf should be displayed,
      or -1 if the current pixbuf should be displayed forever.
      
      The `[gid.glib2.global.timeoutAdd]` function conveniently takes a timeout in milliseconds,
      so you can use a timeout to schedule the next update.
      
      Note that some formats, like GIF, might clamp the timeout values in the
      image file to avoid updates that are just too quick. The minimum timeout
      for GIF images is currently 20 milliseconds.
      Returns: delay time in milliseconds (thousandths of a second)
  
      Deprecated: Use a different image loading library for animatable assets
  */
  int getDelayTime() nothrow
  {
    int _retval;
    _retval = gdk_pixbuf_animation_iter_get_delay_time(cast(GdkPixbufAnimationIter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current pixbuf which should be displayed.
      
      The pixbuf might not be the same size as the animation itself
      ([gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.getWidth], [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.getHeight]).
      
      This pixbuf should be displayed for [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.getDelayTime]
      milliseconds.
      
      The caller of this function does not own a reference to the returned
      pixbuf; the returned pixbuf will become invalid when the iterator
      advances to the next frame, which may happen anytime you call
      [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.advance].
      
      Copy the pixbuf to keep it (don't just add a reference), as it may get
      recycled as you advance the iterator.
      Returns: the pixbuf to be displayed
  
      Deprecated: Use a different image loading library for animatable assets
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getPixbuf() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_animation_iter_get_pixbuf(cast(GdkPixbufAnimationIter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Used to determine how to respond to the area_updated signal on
      #GdkPixbufLoader when loading an animation.
      
      The `::area_updated` signal is emitted for an area of the frame currently
      streaming in to the loader. So if you're on the currently loading frame,
      you will need to redraw the screen for the updated area.
      Returns: `TRUE` if the frame we're on is partially loaded, or the last frame
  
      Deprecated: Use a different image loading library for animatable assets
  */
  bool onCurrentlyLoadingFrame() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_pixbuf_animation_iter_on_currently_loading_frame(cast(GdkPixbufAnimationIter*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter]
class PixbufAnimationIterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter]
final class PixbufAnimationIterGidBuilder : PixbufAnimationIterGidBuilderImpl!PixbufAnimationIterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PixbufAnimationIter build() nothrow
  {
    return new PixbufAnimationIter(cast(void*)createGObject(PixbufAnimationIter._getGType), Yes.Take);
  }
}
