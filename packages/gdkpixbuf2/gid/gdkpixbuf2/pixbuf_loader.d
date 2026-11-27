/// Module for [PixbufLoader] class
module gid.gdkpixbuf2.pixbuf_loader;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdkpixbuf2.c.functions;
import gid.gdkpixbuf2.c.types;
import gid.gdkpixbuf2.pixbuf;
import gid.gdkpixbuf2.pixbuf_animation;
import gid.gdkpixbuf2.pixbuf_format;
import gid.gdkpixbuf2.types;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Incremental image loader.
    
    [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader] provides a way for applications to drive the
    process of loading an image, by letting them send the image data
    directly to the loader instead of having the loader read the data
    from a file. Applications can use this functionality instead of
    `[gid.gdkpixbuf2.pixbuf.Pixbuf.newFromFile]` or `[gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.newFromFile]`
    when they need to parse image data in small chunks. For example,
    it should be used when reading an image from a (potentially) slow
    network connection, or when loading an extremely large file.
    
    To use [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader] to load an image, create a new instance,
    and call [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.write] to send the data
    to it. When done, [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.close] should be
    called to end the stream and finalize everything.
    
    The loader will emit three important signals throughout the process:
    
     - [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.sizePrepared] will be emitted as
       soon as the image has enough information to determine the size of
       the image to be used. If you want to scale the image while loading
       it, you can call [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.setSize] in
       response to this signal.
     - [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.areaPrepared] will be emitted as
       soon as the pixbuf of the desired has been allocated. You can obtain
       the [gid.gdkpixbuf2.pixbuf.Pixbuf] instance by calling [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.getPixbuf].
       If you want to use it, simply acquire a reference to it. You can
       also call `[gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.getPixbuf]` later to get the same
       pixbuf.
     - [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.areaUpdated] will be emitted every
       time a region is updated. This way you can update a partially
       completed image. Note that you do not know anything about the
       completeness of an image from the updated area. For example, in an
       interlaced image you will need to make several passes before the
       image is done loading.
    
    ## Loading an animation
    
    Loading an animation is almost as easy as loading an image. Once the
    first [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.areaPrepared] signal has been
    emitted, you can call [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.getAnimation] to
    get the [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation] instance, and then call
    and [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.getIter] to get a
    [gid.gdkpixbuf2.pixbuf_animation_iter.PixbufAnimationIter] to retrieve the pixbuf for the
    desired time stamp.
*/
@gidGir("PixbufLoader", "PixbufLoaderClass")
class PixbufLoader : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_pixbuf_loader_get_type != &gidSymbolNotFound ? gdk_pixbuf_loader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkPixbufLoader";
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufLoader self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader]
      Returns: New builder object
  */
  static PixbufLoaderGidBuilder builder() nothrow
  {
    return new PixbufLoaderGidBuilder;
  }

  /**
      Creates a new pixbuf loader object.
      Returns: A newly-created pixbuf loader.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GdkPixbufLoader* _cretval;
      _cretval = gdk_pixbuf_loader_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new pixbuf loader object that always attempts to parse
      image data as if it were an image of MIME type mime_type, instead of
      identifying the type automatically.
      
      This function is useful if you want an error if the image isn't the
      expected MIME type; for loading image formats that can't be reliably
      identified by looking at the data; or if the user manually forces a
      specific MIME type.
      
      The list of supported mime types depends on what image loaders
      are installed, but typically "image/png", "image/jpeg", "image/gif",
      "image/tiff" and "image/x-xpixmap" are among the supported mime types.
      To obtain the full list of supported mime types, call
      [gid.gdkpixbuf2.pixbuf_format.PixbufFormat.getMimeTypes] on each of the #GdkPixbufFormat
      structs returned by [gid.gdkpixbuf2.pixbuf.Pixbuf.getFormats].
  
      Params:
        mimeType = the mime type to be loaded
      Returns: A newly-created pixbuf loader.
      Throws: [ErrorWrap]
  */
  static gid.gdkpixbuf2.pixbuf_loader.PixbufLoader newWithMimeType(string mimeType)
  {
    GdkPixbufLoader* _cretval;
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = gdk_pixbuf_loader_new_with_mime_type(_mimeType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf_loader.PixbufLoader)(cast(GdkPixbufLoader*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new pixbuf loader object that always attempts to parse
      image data as if it were an image of type image_type, instead of
      identifying the type automatically.
      
      This function is useful if you want an error if the image isn't the
      expected type; for loading image formats that can't be reliably
      identified by looking at the data; or if the user manually forces
      a specific type.
      
      The list of supported image formats depends on what image loaders
      are installed, but typically "png", "jpeg", "gif", "tiff" and
      "xpm" are among the supported formats. To obtain the full list of
      supported image formats, call [gid.gdkpixbuf2.pixbuf_format.PixbufFormat.getName] on each
      of the #GdkPixbufFormat structs returned by [gid.gdkpixbuf2.pixbuf.Pixbuf.getFormats].
  
      Params:
        imageType = name of the image format to be loaded with the image
      Returns: A newly-created pixbuf loader.
      Throws: [ErrorWrap]
  */
  static gid.gdkpixbuf2.pixbuf_loader.PixbufLoader newWithType(string imageType)
  {
    GdkPixbufLoader* _cretval;
    const(char)* _imageType = imageType.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = gdk_pixbuf_loader_new_with_type(_imageType, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf_loader.PixbufLoader)(cast(GdkPixbufLoader*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  protected void vfuncAreaPrepared()
  {
    auto _klass = cast(GdkPixbufLoaderClass*)_vfuncClass;
    if (!_klass.areaPrepared)
      return;

    _klass.areaPrepared(cast(GdkPixbufLoader*)this._cPtr);
  }

  /** */
  protected void vfuncAreaUpdated(int x, int y, int width, int height)
  {
    auto _klass = cast(GdkPixbufLoaderClass*)_vfuncClass;
    if (!_klass.areaUpdated)
      return;

    _klass.areaUpdated(cast(GdkPixbufLoader*)this._cPtr, x, y, width, height);
  }

  /** */
  protected void vfuncClosed()
  {
    auto _klass = cast(GdkPixbufLoaderClass*)_vfuncClass;
    if (!_klass.closed)
      return;

    _klass.closed(cast(GdkPixbufLoader*)this._cPtr);
  }

  /** */
  protected void vfuncSizePrepared(int width, int height)
  {
    auto _klass = cast(GdkPixbufLoaderClass*)_vfuncClass;
    if (!_klass.sizePrepared)
      return;

    _klass.sizePrepared(cast(GdkPixbufLoader*)this._cPtr, width, height);
  }

  /**
      Informs a pixbuf loader that no further writes with
      [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.write] will occur, so that it can free its
      internal loading structures.
      
      This function also tries to parse any data that hasn't yet been parsed;
      if the remaining data is partial or corrupt, an error will be returned.
      
      If `FALSE` is returned, `error` will be set to an error from the
      `GDK_PIXBUF_ERROR` or `G_FILE_ERROR` domains.
      
      If you're just cancelling a load rather than expecting it to be finished,
      passing `NULL` for `error` to ignore it is reasonable.
      
      Remember that this function does not release a reference on the loader, so
      you will need to explicitly release any reference you hold.
      Returns: `TRUE` if all image data written so far was successfully
          passed out via the update_area signal
      Throws: [ErrorWrap]
  */
  bool close()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gdk_pixbuf_loader_close(cast(GdkPixbufLoader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Queries the #GdkPixbufAnimation that a pixbuf loader is currently creating.
      
      In general it only makes sense to call this function after the
      [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.areaPrepared] signal has been emitted by
      the loader.
      
      If the loader doesn't have enough bytes yet, and hasn't emitted the `area-prepared`
      signal, this function will return `NULL`.
      Returns: The animation that the loader is
          currently loading
  */
  gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation getAnimation() nothrow
  {
    GdkPixbufAnimation* _cretval;
    _cretval = gdk_pixbuf_loader_get_animation(cast(GdkPixbufLoader*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the available information about the format of the
      currently loading image file.
      Returns: A #GdkPixbufFormat
  */
  gid.gdkpixbuf2.pixbuf_format.PixbufFormat getFormat() nothrow
  {
    GdkPixbufFormat* _cretval;
    _cretval = gdk_pixbuf_loader_get_format(cast(GdkPixbufLoader*)this._cPtr);
    auto _retval = _cretval ? new gid.gdkpixbuf2.pixbuf_format.PixbufFormat(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Queries the #GdkPixbuf that a pixbuf loader is currently creating.
      
      In general it only makes sense to call this function after the
      [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.areaPrepared] signal has been
      emitted by the loader; this means that enough data has been read
      to know the size of the image that will be allocated.
      
      If the loader has not received enough data via [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.write],
      then this function returns `NULL`.
      
      The returned pixbuf will be the same in all future calls to the loader,
      so if you want to keep using it, you should acquire a reference to it.
      
      Additionally, if the loader is an animation, it will return the "static
      image" of the animation (see [gid.gdkpixbuf2.pixbuf_animation.PixbufAnimation.getStaticImage]).
      Returns: The pixbuf that the loader is
          creating
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getPixbuf() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_loader_get_pixbuf(cast(GdkPixbufLoader*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Causes the image to be scaled while it is loaded.
      
      The desired image size can be determined relative to the original
      size of the image by calling [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.setSize] from a
      signal handler for the ::size-prepared signal.
      
      Attempts to set the desired image size  are ignored after the
      emission of the ::size-prepared signal.
  
      Params:
        width = The desired width of the image being loaded.
        height = The desired height of the image being loaded.
  */
  void setSize(int width, int height) nothrow
  {
    gdk_pixbuf_loader_set_size(cast(GdkPixbufLoader*)this._cPtr, width, height);
  }

  /**
      Parses the next `count` bytes in the given image buffer.
  
      Params:
        buf = Pointer to image data.
      Returns: `TRUE` if the write was successful, or
          `FALSE` if the loader cannot parse the buffer
      Throws: [ErrorWrap]
  */
  bool write(ubyte[] buf)
  {
    bool _retval;
    size_t _count;
    if (buf)
      _count = cast(size_t)buf.length;

    auto _buf = cast(ubyte*)buf.ptr;
    GError *_err;
    _retval = cast(bool)gdk_pixbuf_loader_write(cast(GdkPixbufLoader*)this._cPtr, _buf, _count, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Parses the next contents of the given image buffer.
  
      Params:
        buffer = The image data as a [gid.glib2.bytes.Bytes] buffer.
      Returns: `TRUE` if the write was successful, or `FALSE` if
          the loader cannot parse the buffer
      Throws: [ErrorWrap]
  */
  bool writeBytes(gid.glib2.bytes.Bytes buffer)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gdk_pixbuf_loader_write_bytes(cast(GdkPixbufLoader*)this._cPtr, buffer ? cast(GBytes*)buffer._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Connect to `AreaPrepared` signal.
  
      This signal is emitted when the pixbuf loader has allocated the
        pixbuf in the desired size.
        
        After this signal is emitted, applications can call
        [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.getPixbuf] to fetch the partially-loaded
        pixbuf.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdkpixbuf2.pixbuf_loader.PixbufLoader pixbufLoader)`
  
          `pixbufLoader` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAreaPrepared(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdkpixbuf2.pixbuf_loader.PixbufLoader)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.areaPrepared");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("area-prepared", closure, after);
  }

  /**
      Connect to `AreaUpdated` signal.
  
      This signal is emitted when a significant area of the image being
        loaded has been updated.
        
        Normally it means that a complete scanline has been read in, but
        it could be a different area as well.
        
        Applications can use this signal to know when to repaint
        areas of an image that is being loaded.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int x, int y, int width, int height, gid.gdkpixbuf2.pixbuf_loader.PixbufLoader pixbufLoader)`
  
          `x` X offset of upper-left corner of the updated area. (optional)
  
          `y` Y offset of upper-left corner of the updated area. (optional)
  
          `width` Width of updated area. (optional)
  
          `height` Height of updated area. (optional)
  
          `pixbufLoader` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAreaUpdated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == int)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gdkpixbuf2.pixbuf_loader.PixbufLoader)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.areaUpdated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("area-updated", closure, after);
  }

  /**
      Connect to `Closed` signal.
  
      This signal is emitted when [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.close] is called.
        
        It can be used by different parts of an application to receive
        notification when an image loader is closed by the code that
        drives it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdkpixbuf2.pixbuf_loader.PixbufLoader pixbufLoader)`
  
          `pixbufLoader` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClosed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdkpixbuf2.pixbuf_loader.PixbufLoader)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.closed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }

  /**
      Connect to `SizePrepared` signal.
  
      This signal is emitted when the pixbuf loader has been fed the
        initial amount of data that is required to figure out the size
        of the image that it will create.
        
        Applications can call [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.setSize] in response
        to this signal to set the desired size to which the image
        should be scaled.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int width, int height, gid.gdkpixbuf2.pixbuf_loader.PixbufLoader pixbufLoader)`
  
          `width` the original width of the image (optional)
  
          `height` the original height of the image (optional)
  
          `pixbufLoader` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSizePrepared(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gdkpixbuf2.pixbuf_loader.PixbufLoader)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.sizePrepared");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("size-prepared", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from PixbufLoader
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gdkpixbuf2.pixbuf_loader.PixbufLoader), T.stringof ~ " is not derived from gid.gdkpixbuf2.pixbuf_loader.PixbufLoader");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAreaPrepared", true)[0]) == gid.gdkpixbuf2.pixbuf_loader.PixbufLoader))
      _installVfunc(klass, "area_prepared");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAreaUpdated", true)[0]) == gid.gdkpixbuf2.pixbuf_loader.PixbufLoader))
      _installVfunc(klass, "area_updated");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClosed", true)[0]) == gid.gdkpixbuf2.pixbuf_loader.PixbufLoader))
      _installVfunc(klass, "closed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSizePrepared", true)[0]) == gid.gdkpixbuf2.pixbuf_loader.PixbufLoader))
      _installVfunc(klass, "size_prepared");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GdkPixbufLoaderClass*)klass;

    switch (vfunc)
    {
      case "area_prepared":
      {
        static extern(C) void _vfuncAreaPreparedTramp(GdkPixbufLoader* loader) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdkpixbuf2.pixbuf_loader.PixbufLoader)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)loader);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufLoaderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)loader);
            if (_klass.areaPrepared)
              return (cast(typeof(&_vfuncAreaPreparedTramp))_klass.areaPrepared)(loader);
            return;
          }

          try
          {
            _obj.vfuncAreaPrepared();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.vfuncAreaPrepared");
          }
        }

        _klass.areaPrepared = cast(typeof(_klass.areaPrepared))&_vfuncAreaPreparedTramp;
        break;
      }
      case "area_updated":
      {
        static extern(C) void _vfuncAreaUpdatedTramp(GdkPixbufLoader* loader, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdkpixbuf2.pixbuf_loader.PixbufLoader)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)loader);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufLoaderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)loader);
            if (_klass.areaUpdated)
              return (cast(typeof(&_vfuncAreaUpdatedTramp))_klass.areaUpdated)(loader, x, y, width, height);
            return;
          }

          try
          {
            _obj.vfuncAreaUpdated(x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.vfuncAreaUpdated");
          }
        }

        _klass.areaUpdated = cast(typeof(_klass.areaUpdated))&_vfuncAreaUpdatedTramp;
        break;
      }
      case "closed":
      {
        static extern(C) void _vfuncClosedTramp(GdkPixbufLoader* loader) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdkpixbuf2.pixbuf_loader.PixbufLoader)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)loader);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufLoaderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)loader);
            if (_klass.closed)
              return (cast(typeof(&_vfuncClosedTramp))_klass.closed)(loader);
            return;
          }

          try
          {
            _obj.vfuncClosed();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.vfuncClosed");
          }
        }

        _klass.closed = cast(typeof(_klass.closed))&_vfuncClosedTramp;
        break;
      }
      case "size_prepared":
      {
        static extern(C) void _vfuncSizePreparedTramp(GdkPixbufLoader* loader, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gdkpixbuf2.pixbuf_loader.PixbufLoader)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)loader);
          if (!_obj)
          {
            auto _klass = cast(GdkPixbufLoaderClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)loader);
            if (_klass.sizePrepared)
              return (cast(typeof(&_vfuncSizePreparedTramp))_klass.sizePrepared)(loader, width, height);
            return;
          }

          try
          {
            _obj.vfuncSizePrepared(width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdkpixbuf2.pixbuf_loader.PixbufLoader.vfuncSizePrepared");
          }
        }

        _klass.sizePrepared = cast(typeof(_klass.sizePrepared))&_vfuncSizePreparedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader]
class PixbufLoaderGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gdkpixbuf2.pixbuf_loader.PixbufLoader]
final class PixbufLoaderGidBuilder : PixbufLoaderGidBuilderImpl!PixbufLoaderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PixbufLoader build() nothrow
  {
    return new PixbufLoader(cast(void*)createGObject(PixbufLoader._getGType), Yes.Take);
  }
}
