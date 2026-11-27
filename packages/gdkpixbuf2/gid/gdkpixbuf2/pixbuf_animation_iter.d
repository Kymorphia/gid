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
@gidGir("PixbufAnimationIter", "PixbufAnimationIterClass")
class PixbufAnimationIter : gid.gobject2.object.ObjectWrap
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAdvance` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use a different image loading library for animatable assets
  */
  protected bool vfuncAdvance(gid.glib2.time_val.TimeVal* currentTime = null)
  {
    auto _klass = cast(GdkPixbufAnimationIterClass*)_vfuncClass;
    if (!_klass.advance)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.advance(cast(GdkPixbufAnimationIter*)this._cPtr, cast(const(GTimeVal)*)currentTime);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetDelayTime` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use a different image loading library for animatable assets
  */
  protected int vfuncGetDelayTime()
  {
    auto _klass = cast(GdkPixbufAnimationIterClass*)_vfuncClass;
    if (!_klass.getDelayTime)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getDelayTime(cast(GdkPixbufAnimationIter*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPixbuf` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use a different image loading library for animatable assets
  */
  protected gid.gdkpixbuf2.pixbuf.Pixbuf vfuncGetPixbuf()
  {
    auto _klass = cast(GdkPixbufAnimationIterClass*)_vfuncClass;
    if (!_klass.getPixbuf)
      return typeof(return).init;

    GdkPixbuf* _cretval;
    _cretval = _klass.getPixbuf(cast(GdkPixbufAnimationIter*)this._cPtr);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncOnCurrentlyLoadingFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use a different image loading library for animatable assets
  */
  protected bool vfuncOnCurrentlyLoadingFrame()
  {
    auto _klass = cast(GdkPixbufAnimationIterClass*)_vfuncClass;
    if (!_klass.onCurrentlyLoadingFrame)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.onCurrentlyLoadingFrame(cast(GdkPixbufAnimationIter*)this._cPtr);
    return _retval;
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from PixbufAnimationIter
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter), T.stringof ~ " is not derived from gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAdvance", true)[0]) == gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter))
      _installVfunc(klass, "advance");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetDelayTime", true)[0]) == gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter))
      _installVfunc(klass, "get_delay_time");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPixbuf", true)[0]) == gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter))
      _installVfunc(klass, "get_pixbuf");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncOnCurrentlyLoadingFrame", true)[0]) == gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter))
      _installVfunc(klass, "on_currently_loading_frame");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GdkPixbufAnimationIterClass*)klass;

    switch (vfunc)
    {
      case "advance":
      {
        static extern(C) gboolean _vfuncAdvanceTramp(GdkPixbufAnimationIter* iter, const(GTimeVal)* currentTime) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter)(cast(void*)iter);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufAnimationIterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iter);
            if (_klass.advance)
              return (cast(typeof(&_vfuncAdvanceTramp))_klass.advance)(iter, currentTime);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncAdvance(cast(gid.glib2.time_val.TimeVal*)currentTime);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.vfuncAdvance");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.advance = cast(typeof(_klass.advance))&_vfuncAdvanceTramp;
        break;
      }
      case "get_delay_time":
      {
        static extern(C) int _vfuncGetDelayTimeTramp(GdkPixbufAnimationIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter)(cast(void*)iter);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufAnimationIterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iter);
            if (_klass.getDelayTime)
              return (cast(typeof(&_vfuncGetDelayTimeTramp))_klass.getDelayTime)(iter);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetDelayTime();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.vfuncGetDelayTime");
          }
          return _retval;
        }

        _klass.getDelayTime = cast(typeof(_klass.getDelayTime))&_vfuncGetDelayTimeTramp;
        break;
      }
      case "get_pixbuf":
      {
        static extern(C) GdkPixbuf* _vfuncGetPixbufTramp(GdkPixbufAnimationIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter)(cast(void*)iter);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufAnimationIterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iter);
            if (_klass.getPixbuf)
              return (cast(typeof(&_vfuncGetPixbufTramp))_klass.getPixbuf)(iter);
            return typeof(return).init;
          }

          gid.gdkpixbuf2.pixbuf.Pixbuf _dretval;

          try
          {
            _dretval = _obj.vfuncGetPixbuf();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.vfuncGetPixbuf");
          }
          auto _retval = _dretval ? cast(GdkPixbuf*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getPixbuf = cast(typeof(_klass.getPixbuf))&_vfuncGetPixbufTramp;
        break;
      }
      case "on_currently_loading_frame":
      {
        static extern(C) gboolean _vfuncOnCurrentlyLoadingFrameTramp(GdkPixbufAnimationIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter)(cast(void*)iter);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufAnimationIterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iter);
            if (_klass.onCurrentlyLoadingFrame)
              return (cast(typeof(&_vfuncOnCurrentlyLoadingFrameTramp))_klass.onCurrentlyLoadingFrame)(iter);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncOnCurrentlyLoadingFrame();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.vfuncOnCurrentlyLoadingFrame");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.onCurrentlyLoadingFrame = cast(typeof(_klass.onCurrentlyLoadingFrame))&_vfuncOnCurrentlyLoadingFrameTramp;
        break;
      }
      default:
      break;
    }
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
