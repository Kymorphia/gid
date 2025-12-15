/// Module for [PixbufLoader] class
module gdkpixbuf.pixbuf_loader;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.pixbuf_animation;
import gdkpixbuf.pixbuf_format;
import gdkpixbuf.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
    Incremental image loader.
    
    [gdkpixbuf.pixbuf_loader.PixbufLoader] provides a way for applications to drive the
    process of loading an image, by letting them send the image data
    directly to the loader instead of having the loader read the data
    from a file. Applications can use this functionality instead of
    `[gdkpixbuf.pixbuf.Pixbuf.newFromFile]` or `[gdkpixbuf.pixbuf_animation.PixbufAnimation.newFromFile]`
    when they need to parse image data in small chunks. For example,
    it should be used when reading an image from a (potentially) slow
    network connection, or when loading an extremely large file.
    
    To use [gdkpixbuf.pixbuf_loader.PixbufLoader] to load an image, create a new instance,
    and call [gdkpixbuf.pixbuf_loader.PixbufLoader.write] to send the data
    to it. When done, [gdkpixbuf.pixbuf_loader.PixbufLoader.close] should be
    called to end the stream and finalize everything.
    
    The loader will emit three important signals throughout the process:
    
     $(LIST
        * `signal@GdkPixbuf.PixbufLoader::size-prepared` will be emitted as
          soon as the image has enough information to determine the size of
          the image to be used. If you want to scale the image while loading
          it, you can call [gdkpixbuf.pixbuf_loader.PixbufLoader.setSize] in
          response to this signal.
        * `signal@GdkPixbuf.PixbufLoader::area-prepared` will be emitted as
          soon as the pixbuf of the desired has been allocated. You can obtain
          the [gdkpixbuf.pixbuf.Pixbuf] instance by calling [gdkpixbuf.pixbuf_loader.PixbufLoader.getPixbuf].
          If you want to use it, simply acquire a reference to it. You can
          also call `[gdkpixbuf.pixbuf_loader.PixbufLoader.getPixbuf]` later to get the same
          pixbuf.
        * `signal@GdkPixbuf.PixbufLoader::area-updated` will be emitted every
          time a region is updated. This way you can update a partially
          completed image. Note that you do not know anything about the
          completeness of an image from the updated area. For example, in an
          interlaced image you will need to make several passes before the
          image is done loading.
     )
       
    ## Loading an animation
    
    Loading an animation is almost as easy as loading an image. Once the
    first `signal@GdkPixbuf.PixbufLoader::area-prepared` signal has been
    emitted, you can call [gdkpixbuf.pixbuf_loader.PixbufLoader.getAnimation] to
    get the [gdkpixbuf.pixbuf_animation.PixbufAnimation] instance, and then call
    and [gdkpixbuf.pixbuf_animation.PixbufAnimation.getIter] to get a
    [gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter] to retrieve the pixbuf for the
    desired time stamp.
*/
class PixbufLoader : gobject.object.ObjectWrap
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
    return cast(void function())gdk_pixbuf_loader_get_type != &gidSymbolNotFound ? gdk_pixbuf_loader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PixbufLoader self()
  {
    return this;
  }

  /**
      Creates a new pixbuf loader object.
      Returns: A newly-created pixbuf loader.
  */
  this()
  {
    GdkPixbufLoader* _cretval;
    _cretval = gdk_pixbuf_loader_new();
    this(_cretval, Yes.Take);
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
      [gdkpixbuf.pixbuf_format.PixbufFormat.getMimeTypes] on each of the #GdkPixbufFormat
      structs returned by [gdkpixbuf.pixbuf.Pixbuf.getFormats].
  
      Params:
        mimeType = the mime type to be loaded
      Returns: A newly-created pixbuf loader.
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf_loader.PixbufLoader newWithMimeType(string mimeType)
  {
    GdkPixbufLoader* _cretval;
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    GError *_err;
    _cretval = gdk_pixbuf_loader_new_with_mime_type(_mimeType, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf_loader.PixbufLoader)(cast(GdkPixbufLoader*)_cretval, Yes.Take);
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
      supported image formats, call [gdkpixbuf.pixbuf_format.PixbufFormat.getName] on each
      of the #GdkPixbufFormat structs returned by [gdkpixbuf.pixbuf.Pixbuf.getFormats].
  
      Params:
        imageType = name of the image format to be loaded with the image
      Returns: A newly-created pixbuf loader.
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf_loader.PixbufLoader newWithType(string imageType)
  {
    GdkPixbufLoader* _cretval;
    const(char)* _imageType = imageType.toCString(No.Alloc);
    GError *_err;
    _cretval = gdk_pixbuf_loader_new_with_type(_imageType, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf_loader.PixbufLoader)(cast(GdkPixbufLoader*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Informs a pixbuf loader that no further writes with
      [gdkpixbuf.pixbuf_loader.PixbufLoader.write] will occur, so that it can free its
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
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Queries the #GdkPixbufAnimation that a pixbuf loader is currently creating.
      
      In general it only makes sense to call this function after the
      `signalGdkPixbuf.PixbufLoader::area-prepared` signal has been emitted by
      the loader.
      
      If the loader doesn't have enough bytes yet, and hasn't emitted the `area-prepared`
      signal, this function will return `NULL`.
      Returns: The animation that the loader is
          currently loading
  */
  gdkpixbuf.pixbuf_animation.PixbufAnimation getAnimation()
  {
    GdkPixbufAnimation* _cretval;
    _cretval = gdk_pixbuf_loader_get_animation(cast(GdkPixbufLoader*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf_animation.PixbufAnimation)(cast(GdkPixbufAnimation*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the available information about the format of the
      currently loading image file.
      Returns: A #GdkPixbufFormat
  */
  gdkpixbuf.pixbuf_format.PixbufFormat getFormat()
  {
    GdkPixbufFormat* _cretval;
    _cretval = gdk_pixbuf_loader_get_format(cast(GdkPixbufLoader*)this._cPtr);
    auto _retval = _cretval ? new gdkpixbuf.pixbuf_format.PixbufFormat(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Queries the #GdkPixbuf that a pixbuf loader is currently creating.
      
      In general it only makes sense to call this function after the
      `signalGdkPixbuf.PixbufLoader::area-prepared` signal has been
      emitted by the loader; this means that enough data has been read
      to know the size of the image that will be allocated.
      
      If the loader has not received enough data via [gdkpixbuf.pixbuf_loader.PixbufLoader.write],
      then this function returns `NULL`.
      
      The returned pixbuf will be the same in all future calls to the loader,
      so if you want to keep using it, you should acquire a reference to it.
      
      Additionally, if the loader is an animation, it will return the "static
      image" of the animation (see [gdkpixbuf.pixbuf_animation.PixbufAnimation.getStaticImage]).
      Returns: The pixbuf that the loader is
          creating
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_loader_get_pixbuf(cast(GdkPixbufLoader*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Causes the image to be scaled while it is loaded.
      
      The desired image size can be determined relative to the original
      size of the image by calling [gdkpixbuf.pixbuf_loader.PixbufLoader.setSize] from a
      signal handler for the ::size-prepared signal.
      
      Attempts to set the desired image size  are ignored after the
      emission of the ::size-prepared signal.
  
      Params:
        width = The desired width of the image being loaded.
        height = The desired height of the image being loaded.
  */
  void setSize(int width, int height)
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

    auto _buf = cast(const(ubyte)*)buf.ptr;
    GError *_err;
    _retval = cast(bool)gdk_pixbuf_loader_write(cast(GdkPixbufLoader*)this._cPtr, _buf, _count, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Parses the next contents of the given image buffer.
  
      Params:
        buffer = The image data as a [glib.bytes.Bytes] buffer.
      Returns: `TRUE` if the write was successful, or `FALSE` if
          the loader cannot parse the buffer
      Throws: [ErrorWrap]
  */
  bool writeBytes(glib.bytes.Bytes buffer)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gdk_pixbuf_loader_write_bytes(cast(GdkPixbufLoader*)this._cPtr, buffer ? cast(GBytes*)buffer._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Connect to `AreaPrepared` signal.
  
      This signal is emitted when the pixbuf loader has allocated the
      pixbuf in the desired size.
      
      After this signal is emitted, applications can call
      [gdkpixbuf.pixbuf_loader.PixbufLoader.getPixbuf] to fetch the partially-loaded
      pixbuf.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdkpixbuf.pixbuf_loader.PixbufLoader pixbufLoader))
  
          `pixbufLoader` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAreaPrepared(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdkpixbuf.pixbuf_loader.PixbufLoader)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(int x, int y, int width, int height, gdkpixbuf.pixbuf_loader.PixbufLoader pixbufLoader))
  
          `x` X offset of upper-left corner of the updated area. (optional)
  
          `y` Y offset of upper-left corner of the updated area. (optional)
  
          `width` Width of updated area. (optional)
  
          `height` Height of updated area. (optional)
  
          `pixbufLoader` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAreaUpdated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == int)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gdkpixbuf.pixbuf_loader.PixbufLoader)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("area-updated", closure, after);
  }

  /**
      Connect to `Closed` signal.
  
      This signal is emitted when [gdkpixbuf.pixbuf_loader.PixbufLoader.close] is called.
      
      It can be used by different parts of an application to receive
      notification when an image loader is closed by the code that
      drives it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdkpixbuf.pixbuf_loader.PixbufLoader pixbufLoader))
  
          `pixbufLoader` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClosed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdkpixbuf.pixbuf_loader.PixbufLoader)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }

  /**
      Connect to `SizePrepared` signal.
  
      This signal is emitted when the pixbuf loader has been fed the
      initial amount of data that is required to figure out the size
      of the image that it will create.
      
      Applications can call [gdkpixbuf.pixbuf_loader.PixbufLoader.setSize] in response
      to this signal to set the desired size to which the image
      should be scaled.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int width, int height, gdkpixbuf.pixbuf_loader.PixbufLoader pixbufLoader))
  
          `width` the original width of the image (optional)
  
          `height` the original height of the image (optional)
  
          `pixbufLoader` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSizePrepared(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gdkpixbuf.pixbuf_loader.PixbufLoader)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("size-prepared", closure, after);
  }
}
