/// Module for [PixbufAnimationIter] class
module gdkpixbuf.pixbuf_animation_iter;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.types;
import gid.gid;
import glib.time_val;
import gobject.object;

/**
    An opaque object representing an iterator which points to a
    certain position in an animation.
*/
class PixbufAnimationIter : gobject.object.ObjectWrap
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
    return cast(void function())gdk_pixbuf_animation_iter_get_type != &gidSymbolNotFound ? gdk_pixbuf_animation_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufAnimationIter self()
  {
    return this;
  }

  /**
      Possibly advances an animation to a new frame.
      
      Chooses the frame based on the start time passed to
      [gdkpixbuf.pixbuf_animation.PixbufAnimation.getIter].
      
      current_time would normally come from [glib.global.getCurrentTime], and
      must be greater than or equal to the time passed to
      [gdkpixbuf.pixbuf_animation.PixbufAnimation.getIter], and must increase or remain
      unchanged each time [gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter.getPixbuf] is
      called. That is, you can't go backward in time; animations only
      play forward.
      
      As a shortcut, pass `NULL` for the current time and [glib.global.getCurrentTime]
      will be invoked on your behalf. So you only need to explicitly pass
      current_time if you're doing something odd like playing the animation
      at double speed.
      
      If this function returns `FALSE`, there's no need to update the animation
      display, assuming the display had been rendered prior to advancing;
      if `TRUE`, you need to call [gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter.getPixbuf]
      and update the display with the new pixbuf.
  
      Params:
        currentTime = current time
      Returns: `TRUE` if the image may need updating
  */
  bool advance(glib.time_val.TimeVal currentTime = null)
  {
    bool _retval;
    _retval = cast(bool)gdk_pixbuf_animation_iter_advance(cast(GdkPixbufAnimationIter*)this._cPtr, currentTime ? cast(const(GTimeVal)*)currentTime._cPtr : null);
    return _retval;
  }

  /**
      Gets the number of milliseconds the current pixbuf should be displayed,
      or -1 if the current pixbuf should be displayed forever.
      
      The `[glib.global.timeoutAdd]` function conveniently takes a timeout in milliseconds,
      so you can use a timeout to schedule the next update.
      
      Note that some formats, like GIF, might clamp the timeout values in the
      image file to avoid updates that are just too quick. The minimum timeout
      for GIF images is currently 20 milliseconds.
      Returns: delay time in milliseconds (thousandths of a second)
  */
  int getDelayTime()
  {
    int _retval;
    _retval = gdk_pixbuf_animation_iter_get_delay_time(cast(GdkPixbufAnimationIter*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current pixbuf which should be displayed.
      
      The pixbuf might not be the same size as the animation itself
      ([gdkpixbuf.pixbuf_animation.PixbufAnimation.getWidth], [gdkpixbuf.pixbuf_animation.PixbufAnimation.getHeight]).
      
      This pixbuf should be displayed for [gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter.getDelayTime]
      milliseconds.
      
      The caller of this function does not own a reference to the returned
      pixbuf; the returned pixbuf will become invalid when the iterator
      advances to the next frame, which may happen anytime you call
      [gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter.advance].
      
      Copy the pixbuf to keep it (don't just add a reference), as it may get
      recycled as you advance the iterator.
      Returns: the pixbuf to be displayed
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_animation_iter_get_pixbuf(cast(GdkPixbufAnimationIter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Used to determine how to respond to the area_updated signal on
      #GdkPixbufLoader when loading an animation.
      
      The `::area_updated` signal is emitted for an area of the frame currently
      streaming in to the loader. So if you're on the currently loading frame,
      you will need to redraw the screen for the updated area.
      Returns: `TRUE` if the frame we're on is partially loaded, or the last frame
  */
  bool onCurrentlyLoadingFrame()
  {
    bool _retval;
    _retval = cast(bool)gdk_pixbuf_animation_iter_on_currently_loading_frame(cast(GdkPixbufAnimationIter*)this._cPtr);
    return _retval;
  }
}
