/// Module for [PixbufAnimation] class
module gid.gdkpixbuf2.pixbuf_animation;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdkpixbuf2.c.functions;
import gid.gdkpixbuf2.c.types;
import gid.gdkpixbuf2.pixbuf;
import gid.gdkpixbuf2.pixbuf_animation_iter;
import gid.gdkpixbuf2.types;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.input_stream;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.time_val;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    An opaque object representing an animation.
    
    The GdkPixBuf library provides a simple mechanism to load and
    represent animations. An animation is conceptually a series of
    frames to be displayed over time.
    
    The animation may not be represented as a series of frames
    internally; for example, it may be stored as a sprite and
    instructions for moving the sprite around a background.
    
    To display an animation you don't need to understand its
    representation, however; you just ask [gid.gdkpixbuf2.pixbuf.Pixbuf] what should
    be displayed at a given point in time.

    Deprecated: Use a different image loading library for animatable assets
*/
@gidGir("PixbufAnimation", "PixbufAnimationClass")
class PixbufAnimation : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_pixbuf_animation_get_type != &gidSymbolNotFound ? gdk_pixbuf_animation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkPixbufAnimation";
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufAnimation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation]
      Returns: New builder object
  */
  static PixbufAnimationGidBuilder builder() nothrow
  {
    return new PixbufAnimationGidBuilder;
  }

  /**
      Creates a new animation by loading it from a file.
      
      The file format is detected automatically.
      
      If the file's format does not support multi-frame images, then an animation
      with a single frame will be created.
      
      Possible errors are in the `GDK_PIXBUF_ERROR` and `G_FILE_ERROR` domains.
  
      Params:
        filename = Name of file to load, in the GLib file
            name encoding
      Returns: A newly-created animation
      Throws: [ErrorWrap]
  
      Deprecated: Use a different image loading library for animatable assets
  */
  static gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation newFromFile(string filename)
  {
    GdkPixbufAnimation* _cretval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = gdk_pixbuf_animation_new_from_file(_filename, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new pixbuf animation by loading an image from an resource.
      
      The file format is detected automatically. If `NULL` is returned, then
      error will be set.
  
      Params:
        resourcePath = the path of the resource file
      Returns: A newly-created animation
      Throws: [ErrorWrap]
  
      Deprecated: Use a different image loading library for animatable assets
  */
  static gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation newFromResource(string resourcePath)
  {
    GdkPixbufAnimation* _cretval;
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = gdk_pixbuf_animation_new_from_resource(_resourcePath, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new animation by loading it from an input stream.
      
      The file format is detected automatically.
      
      If `NULL` is returned, then error will be set.
      
      The cancellable can be used to abort the operation from another thread.
      If the operation was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be
      returned. Other possible errors are in the `GDK_PIXBUF_ERROR` and
      `G_IO_ERROR` domains.
      
      The stream is not closed.
  
      Params:
        stream = a [gid.gio2.input_stream.InputStream] to load the pixbuf from
        cancellable = optional [gid.gio2.cancellable.Cancellable] object
      Returns: A newly-created animation
      Throws: [ErrorWrap]
  
      Deprecated: Use a different image loading library for animatable assets
  */
  static gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation newFromStream(gid.gio2.input_stream.InputStream stream, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GdkPixbufAnimation* _cretval;
    GError *_err;
    _cretval = gdk_pixbuf_animation_new_from_stream(stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finishes an asynchronous pixbuf animation creation operation started with
      [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.newFromStreamAsync].
  
      Params:
        asyncResult = a #GAsyncResult
      Returns: the newly created animation
      Throws: [ErrorWrap]
  
      Deprecated: Use a different image loading library for animatable assets
  */
  static gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation newFromStreamFinish(gid.gio2.async_result.AsyncResult asyncResult)
  {
    GdkPixbufAnimation* _cretval;
    GError *_err;
    _cretval = gdk_pixbuf_animation_new_from_stream_finish(asyncResult ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)asyncResult)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new animation by asynchronously loading an image from an input stream.
      
      For more details see [gid.gdkpixbuf2.pixbuf.Pixbuf.newFromStream], which is the synchronous
      version of this function.
      
      When the operation is finished, `callback` will be called in the main thread.
      You can then call [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.newFromStreamFinish] to get the
      result of the operation.
  
      Params:
        stream = a #GInputStream from which to load the animation
        cancellable = optional #GCancellable object
        callback = a [gid.gio2.types.AsyncReadyCallback] to call when the pixbuf is loaded
  
      Deprecated: Use a different image loading library for animatable assets
  */
  static void newFromStreamAsync(gid.gio2.input_stream.InputStream stream, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_pixbuf_animation_new_from_stream_async(stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Get an iterator for displaying an animation.
      
      The iterator provides the frames that should be displayed at a
      given time.
      
      start_time would normally come from [gid.glib2.global.getCurrentTime], and marks
      the beginning of animation playback. After creating an iterator, you
      should immediately display the pixbuf returned by
      [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.getPixbuf]. Then, you should install
      a timeout (with [gid.glib2.global.timeoutAdd]) or by some other mechanism ensure
      that you'll update the image after
      [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.getDelayTime] milliseconds. Each time
      the image is updated, you should reinstall the timeout with the new,
      possibly-changed delay time.
      
      As a shortcut, if start_time is `NULL`, the result of
      [gid.glib2.global.getCurrentTime] will be used automatically.
      
      To update the image (i.e. possibly change the result of
      [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.getPixbuf] to a new frame of the animation),
      call [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.advance].
      
      If you're using #GdkPixbufLoader, in addition to updating the image
      after the delay time, you should also update it whenever you
      receive the area_updated signal and
      [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.onCurrentlyLoadingFrame] returns
      `TRUE`. In this case, the frame currently being fed into the loader
      has received new data, so needs to be refreshed. The delay time for
      a frame may also be modified after an area_updated signal, for
      example if the delay time for a frame is encoded in the data after
      the frame itself. So your timeout should be reinstalled after any
      area_updated signal.
      
      A delay time of -1 is possible, indicating "infinite".
  
      Params:
        startTime = time when the animation starts playing
      Returns: an iterator to move over the animation
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetIter` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use a different image loading library for animatable assets
  */
  protected gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter vfuncGetIter(gid.glib2.time_val.TimeVal* startTime = null)
  {
    auto _klass = cast(GdkPixbufAnimationClass*)_vfuncClass;
    if (!_klass.getIter)
      return typeof(return).init;

    GdkPixbufAnimationIter* _cretval;
    _cretval = _klass.getIter(cast(GdkPixbufAnimation*)this._cPtr, cast(const(GTimeVal)*)startTime);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter)(cast(GdkPixbufAnimationIter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves a static image for the animation.
      
      If an animation is really just a plain image (has only one frame),
      this function returns that image.
      
      If the animation is an animation, this function returns a reasonable
      image to use as a static unanimated image, which might be the first
      frame, or something more sophisticated depending on the file format.
      
      If an animation hasn't loaded any frames yet, this function will
      return `NULL`.
      Returns: unanimated image representing the animation
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetStaticImage` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use a different image loading library for animatable assets
  */
  protected gid.gdkpixbuf2.pixbuf.Pixbuf vfuncGetStaticImage()
  {
    auto _klass = cast(GdkPixbufAnimationClass*)_vfuncClass;
    if (!_klass.getStaticImage)
      return typeof(return).init;

    GdkPixbuf* _cretval;
    _cretval = _klass.getStaticImage(cast(GdkPixbufAnimation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether the animation is a static image.
      
      If you load a file with [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.newFromFile] and it
      turns out to be a plain, unanimated image, then this function will
      return `TRUE`. Use [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.getStaticImage] to retrieve
      the image.
      Returns: `TRUE` if the "animation" was really just an image
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsStaticImage` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use a different image loading library for animatable assets
  */
  protected bool vfuncIsStaticImage()
  {
    auto _klass = cast(GdkPixbufAnimationClass*)_vfuncClass;
    if (!_klass.isStaticImage)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isStaticImage(cast(GdkPixbufAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Queries the height of the bounding box of a pixbuf animation.
      Returns: Height of the bounding box of the animation.
  
      Deprecated: Use a different image loading library for animatable assets
  */
  int getHeight() nothrow
  {
    int _retval;
    _retval = gdk_pixbuf_animation_get_height(cast(GdkPixbufAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Get an iterator for displaying an animation.
      
      The iterator provides the frames that should be displayed at a
      given time.
      
      start_time would normally come from [gid.glib2.global.getCurrentTime], and marks
      the beginning of animation playback. After creating an iterator, you
      should immediately display the pixbuf returned by
      [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.getPixbuf]. Then, you should install
      a timeout (with [gid.glib2.global.timeoutAdd]) or by some other mechanism ensure
      that you'll update the image after
      [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.getDelayTime] milliseconds. Each time
      the image is updated, you should reinstall the timeout with the new,
      possibly-changed delay time.
      
      As a shortcut, if start_time is `NULL`, the result of
      [gid.glib2.global.getCurrentTime] will be used automatically.
      
      To update the image (i.e. possibly change the result of
      [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.getPixbuf] to a new frame of the animation),
      call [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.advance].
      
      If you're using #GdkPixbufLoader, in addition to updating the image
      after the delay time, you should also update it whenever you
      receive the area_updated signal and
      [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter.onCurrentlyLoadingFrame] returns
      `TRUE`. In this case, the frame currently being fed into the loader
      has received new data, so needs to be refreshed. The delay time for
      a frame may also be modified after an area_updated signal, for
      example if the delay time for a frame is encoded in the data after
      the frame itself. So your timeout should be reinstalled after any
      area_updated signal.
      
      A delay time of -1 is possible, indicating "infinite".
  
      Params:
        startTime = time when the animation starts playing
      Returns: an iterator to move over the animation
  
      Deprecated: Use a different image loading library for animatable assets
  */
  gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter getIter(gid.glib2.time_val.TimeVal* startTime = null) nothrow
  {
    GdkPixbufAnimationIter* _cretval;
    _cretval = gdk_pixbuf_animation_get_iter(cast(GdkPixbufAnimation*)this._cPtr, cast(const(GTimeVal)*)startTime);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter)(cast(GdkPixbufAnimationIter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves a static image for the animation.
      
      If an animation is really just a plain image (has only one frame),
      this function returns that image.
      
      If the animation is an animation, this function returns a reasonable
      image to use as a static unanimated image, which might be the first
      frame, or something more sophisticated depending on the file format.
      
      If an animation hasn't loaded any frames yet, this function will
      return `NULL`.
      Returns: unanimated image representing the animation
  
      Deprecated: Use a different image loading library for animatable assets
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getStaticImage() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_animation_get_static_image(cast(GdkPixbufAnimation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries the width of the bounding box of a pixbuf animation.
      Returns: Width of the bounding box of the animation.
  
      Deprecated: Use a different image loading library for animatable assets
  */
  int getWidth() nothrow
  {
    int _retval;
    _retval = gdk_pixbuf_animation_get_width(cast(GdkPixbufAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the animation is a static image.
      
      If you load a file with [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.newFromFile] and it
      turns out to be a plain, unanimated image, then this function will
      return `TRUE`. Use [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.getStaticImage] to retrieve
      the image.
      Returns: `TRUE` if the "animation" was really just an image
  
      Deprecated: Use a different image loading library for animatable assets
  */
  bool isStaticImage() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_pixbuf_animation_is_static_image(cast(GdkPixbufAnimation*)this._cPtr);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from PixbufAnimation
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation), T.stringof ~ " is not derived from gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetIter", true)[0]) == gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation))
      _installVfunc(klass, "get_iter");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetStaticImage", true)[0]) == gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation))
      _installVfunc(klass, "get_static_image");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsStaticImage", true)[0]) == gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation))
      _installVfunc(klass, "is_static_image");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GdkPixbufAnimationClass*)klass;

    switch (vfunc)
    {
      case "get_iter":
      {
        static extern(C) GdkPixbufAnimationIter* _vfuncGetIterTramp(GdkPixbufAnimation* animation, const(GTimeVal)* startTime) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)(cast(void*)animation);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufAnimationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)animation);
            if (_klass.getIter)
              return (cast(typeof(&_vfuncGetIterTramp))_klass.getIter)(animation, startTime);
            return typeof(return).init;
          }

          gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter _dretval;

          try
          {
            _dretval = _obj.vfuncGetIter(cast(gid.glib2.time_val.TimeVal*)startTime);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.vfuncGetIter");
          }
          auto _retval = _dretval ? cast(GdkPixbufAnimationIter*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getIter = cast(typeof(_klass.getIter))&_vfuncGetIterTramp;
        break;
      }
      case "get_static_image":
      {
        static extern(C) GdkPixbuf* _vfuncGetStaticImageTramp(GdkPixbufAnimation* animation) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)(cast(void*)animation);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufAnimationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)animation);
            if (_klass.getStaticImage)
              return (cast(typeof(&_vfuncGetStaticImageTramp))_klass.getStaticImage)(animation);
            return typeof(return).init;
          }

          gid.gdkpixbuf2.pixbuf.Pixbuf _dretval;

          try
          {
            _dretval = _obj.vfuncGetStaticImage();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.vfuncGetStaticImage");
          }
          auto _retval = _dretval ? cast(GdkPixbuf*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getStaticImage = cast(typeof(_klass.getStaticImage))&_vfuncGetStaticImageTramp;
        break;
      }
      case "is_static_image":
      {
        static extern(C) gboolean _vfuncIsStaticImageTramp(GdkPixbufAnimation* animation) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)(cast(void*)animation);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufAnimationClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)animation);
            if (_klass.isStaticImage)
              return (cast(typeof(&_vfuncIsStaticImageTramp))_klass.isStaticImage)(animation);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsStaticImage();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.vfuncIsStaticImage");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isStaticImage = cast(typeof(_klass.isStaticImage))&_vfuncIsStaticImageTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation]
class PixbufAnimationGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation]
final class PixbufAnimationGidBuilder : PixbufAnimationGidBuilderImpl!PixbufAnimationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PixbufAnimation build() nothrow
  {
    return new PixbufAnimation(cast(void*)createGObject(PixbufAnimation._getGType), Yes.Take);
  }
}
