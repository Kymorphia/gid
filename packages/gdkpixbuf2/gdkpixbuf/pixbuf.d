/// Module for [Pixbuf] class
module gdkpixbuf.pixbuf;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf_format;
import gdkpixbuf.types;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.icon;
import gio.icon_mixin;
import gio.input_stream;
import gio.loadable_icon;
import gio.loadable_icon_mixin;
import gio.output_stream;
import gio.types;
import glib.bytes;
import glib.error;
import gobject.object;

/**
    A pixel buffer.
    
    [gdkpixbuf.pixbuf.Pixbuf] contains information about an image's pixel data,
    its color space, bits per sample, width and height, and the
    rowstride (the number of bytes between the start of one row
    and the start of the next).
    
    ## Creating new [gdkpixbuf.pixbuf.Pixbuf]
    
    The most basic way to create a pixbuf is to wrap an existing pixel
    buffer with a [gdkpixbuf.pixbuf.Pixbuf] instance. You can use the
    [gdkpixbuf.pixbuf.Pixbuf.newFromData] function to do this.
    
    Every time you create a new [gdkpixbuf.pixbuf.Pixbuf] instance for some data, you
    will need to specify the destroy notification function that will be
    called when the data buffer needs to be freed; this will happen when
    a [gdkpixbuf.pixbuf.Pixbuf] is finalized by the reference counting functions. If
    you have a chunk of static data compiled into your application, you
    can pass in `NULL` as the destroy notification function so that the
    data will not be freed.
    
    The [gdkpixbuf.pixbuf.Pixbuf.new_] constructor function can be used
    as a convenience to create a pixbuf with an empty buffer; this is
    equivalent to allocating a data buffer using `malloc()` and then
    wrapping it with `[gdkpixbuf.pixbuf.Pixbuf.newFromData]`. The `[gdkpixbuf.pixbuf.Pixbuf.new_]`
    function will compute an optimal rowstride so that rendering can be
    performed with an efficient algorithm.
    
    As a special case, you can use the [gdkpixbuf.pixbuf.Pixbuf.newFromXpmData]
    function to create a pixbuf from inline XPM image data.
    
    You can also copy an existing pixbuf with the [gdkpixbuf.pixbuf.Pixbuf.copy]
    function. This is not the same as just acquiring a reference to
    the old pixbuf instance: the copy function will actually duplicate
    the pixel data in memory and create a new `class@Pixbuf` instance
    for it.
    
    ## Reference counting
    
    [gdkpixbuf.pixbuf.Pixbuf] structures are reference counted. This means that an
    application can share a single pixbuf among many parts of the
    code. When a piece of the program needs to use a pixbuf, it should
    acquire a reference to it by calling `[gobject.object.ObjectWrap.ref_]`; when it no
    longer needs the pixbuf, it should release the reference it acquired
    by calling `[gobject.object.ObjectWrap.unref]`. The resources associated with a
    [gdkpixbuf.pixbuf.Pixbuf] will be freed when its reference count drops to zero.
    Newly-created [gdkpixbuf.pixbuf.Pixbuf] instances start with a reference count
    of one.
    
    ## Image Data
    
    Image data in a pixbuf is stored in memory in an uncompressed,
    packed format. Rows in the image are stored top to bottom, and
    in each row pixels are stored from left to right.
    
    There may be padding at the end of a row.
    
    The "rowstride" value of a pixbuf, as returned by [gdkpixbuf.pixbuf.Pixbuf.getRowstride],
    indicates the number of bytes between rows.
    
    **NOTE**: If you are copying raw pixbuf data with `memcpy()` note that the
    last row in the pixbuf may not be as wide as the full rowstride, but rather
    just as wide as the pixel data needs to be; that is: it is unsafe to do
    `memcpy (dest, pixels, rowstride * height)` to copy a whole pixbuf. Use
    [gdkpixbuf.pixbuf.Pixbuf.copy] instead, or compute the width in bytes of the
    last row as:
    
    ```c
    last_row = width * ((n_channels * bits_per_sample + 7) / 8);
    ```
    
    The same rule applies when iterating over each row of a [gdkpixbuf.pixbuf.Pixbuf] pixels
    array.
    
    The following code illustrates a simple `put_pixel()`
    function for RGB pixbufs with 8 bits per channel with an alpha
    channel.
    
    ```c
    static void
    put_pixel (GdkPixbuf *pixbuf,
               int x,
    	   int y,
    	   guchar red,
    	   guchar green,
    	   guchar blue,
    	   guchar alpha)
    {
      int n_channels = gdk_pixbuf_get_n_channels (pixbuf);
    
      // Ensure that the pixbuf is valid
      g_assert (gdk_pixbuf_get_colorspace (pixbuf) == GDK_COLORSPACE_RGB);
      g_assert (gdk_pixbuf_get_bits_per_sample (pixbuf) == 8);
      g_assert (gdk_pixbuf_get_has_alpha (pixbuf));
      g_assert (n_channels == 4);
    
      int width = gdk_pixbuf_get_width (pixbuf);
      int height = gdk_pixbuf_get_height (pixbuf);
    
      // Ensure that the coordinates are in a valid range
      g_assert (x >= 0 && x < width);
      g_assert (y >= 0 && y < height);
    
      int rowstride = gdk_pixbuf_get_rowstride (pixbuf);
    
      // The pixel buffer in the GdkPixbuf instance
      guchar *pixels = gdk_pixbuf_get_pixels (pixbuf);
    
      // The pixel we wish to modify
      guchar *p = pixels + y * rowstride + x * n_channels;
      p[0] = red;
      p[1] = green;
      p[2] = blue;
      p[3] = alpha;
    }
    ```
    
    ## Loading images
    
    The `GdkPixBuf` class provides a simple mechanism for loading
    an image from a file in synchronous and asynchronous fashion.
    
    For GUI applications, it is recommended to use the asynchronous
    stream API to avoid blocking the control flow of the application.
    
    Additionally, [gdkpixbuf.pixbuf.Pixbuf] provides the [gdkpixbuf.pixbuf_loader.PixbufLoader]
    API for progressive image loading.
    
    ## Saving images
    
    The [gdkpixbuf.pixbuf.Pixbuf] class provides methods for saving image data in
    a number of file formats. The formatted data can be written to a
    file or to a memory buffer. [gdkpixbuf.pixbuf.Pixbuf] can also call a user-defined
    callback on the data, which allows to e.g. write the image
    to a socket or store it in a database.
*/
class Pixbuf : gobject.object.ObjectWrap, gio.icon.Icon, gio.loadable_icon.LoadableIcon
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
    return cast(void function())gdk_pixbuf_get_type != &gidSymbolNotFound ? gdk_pixbuf_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Pixbuf self()
  {
    return this;
  }

  mixin IconT!();
  mixin LoadableIconT!();

  /**
      Creates a new [gdkpixbuf.pixbuf.Pixbuf] structure and allocates a buffer for it.
      
      If the allocation of the buffer failed, this function will return `NULL`.
      
      The buffer has an optimal rowstride. Note that the buffer is not cleared;
      you will have to fill it completely yourself.
  
      Params:
        colorspace = Color space for image
        hasAlpha = Whether the image should have transparency information
        bitsPerSample = Number of bits per color sample
        width = Width of image in pixels, must be > 0
        height = Height of image in pixels, must be > 0
      Returns: A newly-created pixel buffer
  */
  this(gdkpixbuf.types.Colorspace colorspace, bool hasAlpha, int bitsPerSample, int width, int height)
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_new(colorspace, hasAlpha, bitsPerSample, width, height);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GdkPixbuf out of in-memory readonly image data.
      
      Currently only RGB images with 8 bits per sample are supported.
      
      This is the [glib.bytes.Bytes] variant of [gdkpixbuf.pixbuf.Pixbuf.newFromData], useful
      for language bindings.
  
      Params:
        data = Image data in 8-bit/sample packed format inside a #GBytes
        colorspace = Colorspace for the image data
        hasAlpha = Whether the data has an opacity channel
        bitsPerSample = Number of bits per sample
        width = Width of the image in pixels, must be > 0
        height = Height of the image in pixels, must be > 0
        rowstride = Distance in bytes between row starts
      Returns: A newly-created pixbuf
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromBytes(glib.bytes.Bytes data, gdkpixbuf.types.Colorspace colorspace, bool hasAlpha, int bitsPerSample, int width, int height, int rowstride)
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_new_from_bytes(data ? cast(GBytes*)data._cPtr(No.Dup) : null, colorspace, hasAlpha, bitsPerSample, width, height, rowstride);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new pixbuf by loading an image from a file.
      
      The file format is detected automatically.
      
      If `NULL` is returned, then error will be set. Possible errors are:
      
       $(LIST
          * the file could not be opened
          * there is no loader for the file's format
          * there is not enough memory to allocate the image buffer
          * the image buffer contains invalid data
       )
         
      The error domains are `GDK_PIXBUF_ERROR` and `G_FILE_ERROR`.
  
      Params:
        filename = Name of file to load, in the GLib file
            name encoding
      Returns: A newly-created pixbuf
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromFile(string filename)
  {
    GdkPixbuf* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _cretval = gdk_pixbuf_new_from_file(_filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new pixbuf by loading an image from a file.
      
      The file format is detected automatically.
      
      If `NULL` is returned, then error will be set. Possible errors are:
      
       $(LIST
          * the file could not be opened
          * there is no loader for the file's format
          * there is not enough memory to allocate the image buffer
          * the image buffer contains invalid data
       )
         
      The error domains are `GDK_PIXBUF_ERROR` and `G_FILE_ERROR`.
      
      The image will be scaled to fit in the requested size, optionally preserving
      the image's aspect ratio.
      
      When preserving the aspect ratio, a `width` of -1 will cause the image
      to be scaled to the exact given height, and a `height` of -1 will cause
      the image to be scaled to the exact given width. When not preserving
      aspect ratio, a `width` or `height` of -1 means to not scale the image
      at all in that dimension. Negative values for `width` and `height` are
      allowed since 2.8.
  
      Params:
        filename = Name of file to load, in the GLib file
              name encoding
        width = The width the image should have or -1 to not constrain the width
        height = The height the image should have or -1 to not constrain the height
        preserveAspectRatio = `TRUE` to preserve the image's aspect ratio
      Returns: A newly-created pixbuf
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromFileAtScale(string filename, int width, int height, bool preserveAspectRatio)
  {
    GdkPixbuf* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _cretval = gdk_pixbuf_new_from_file_at_scale(_filename, width, height, preserveAspectRatio, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new pixbuf by loading an image from a file.
      
      The file format is detected automatically.
      
      If `NULL` is returned, then error will be set. Possible errors are:
      
       $(LIST
          * the file could not be opened
          * there is no loader for the file's format
          * there is not enough memory to allocate the image buffer
          * the image buffer contains invalid data
       )
         
      The error domains are `GDK_PIXBUF_ERROR` and `G_FILE_ERROR`.
      
      The image will be scaled to fit in the requested size, preserving
      the image's aspect ratio. Note that the returned pixbuf may be smaller
      than `width` x `height`, if the aspect ratio requires it. To load
      and image at the requested size, regardless of aspect ratio, use
      [gdkpixbuf.pixbuf.Pixbuf.newFromFileAtScale].
  
      Params:
        filename = Name of file to load, in the GLib file
              name encoding
        width = The width the image should have or -1 to not constrain the width
        height = The height the image should have or -1 to not constrain the height
      Returns: A newly-created pixbuf
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromFileAtSize(string filename, int width, int height)
  {
    GdkPixbuf* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _cretval = gdk_pixbuf_new_from_file_at_size(_filename, width, height, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a [gdkpixbuf.pixbuf.Pixbuf] from a flat representation that is suitable for
      storing as inline data in a program.
      
      This is useful if you want to ship a program with images, but don't want
      to depend on any external files.
      
      GdkPixbuf ships with a program called `gdk-pixbuf-csource`, which allows
      for conversion of [gdkpixbuf.pixbuf.Pixbuf]s into such a inline representation.
      
      In almost all cases, you should pass the `--raw` option to
      `gdk-pixbuf-csource`. A sample invocation would be:
      
      ```
      gdk-pixbuf-csource --raw --name=myimage_inline myimage.png
      ```
      
      For the typical case where the inline pixbuf is read-only static data,
      you don't need to copy the pixel data unless you intend to write to
      it, so you can pass `FALSE` for `copy_pixels`. If you pass `--rle` to
      `gdk-pixbuf-csource`, a copy will be made even if `copy_pixels` is `FALSE`,
      so using this option is generally a bad idea.
      
      If you create a pixbuf from const inline data compiled into your
      program, it's probably safe to ignore errors and disable length checks,
      since things will always succeed:
      
      ```c
      pixbuf = gdk_pixbuf_new_from_inline (-1, myimage_inline, FALSE, NULL);
      ```
      
      For non-const inline data, you could get out of memory. For untrusted
      inline data located at runtime, you could have corrupt inline data in
      addition.
  
      Params:
        data = Byte data containing a
            serialized `GdkPixdata` structure
        copyPixels = Whether to copy the pixel data, or use direct pointers
            `data` for the resulting pixbuf
      Returns: A newly-created pixbuf
      Throws: [ErrorWrap]
  
      Deprecated: Use [gio.resource.Resource] instead.
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromInline(ubyte[] data, bool copyPixels)
  {
    GdkPixbuf* _cretval;
    int _dataLength;
    if (data)
      _dataLength = cast(int)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _cretval = gdk_pixbuf_new_from_inline(_dataLength, _data, copyPixels, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new pixbuf by loading an image from an resource.
      
      The file format is detected automatically. If `NULL` is returned, then
      error will be set.
  
      Params:
        resourcePath = the path of the resource file
      Returns: A newly-created pixbuf
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromResource(string resourcePath)
  {
    GdkPixbuf* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    GError *_err;
    _cretval = gdk_pixbuf_new_from_resource(_resourcePath, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new pixbuf by loading an image from an resource.
      
      The file format is detected automatically. If `NULL` is returned, then
      error will be set.
      
      The image will be scaled to fit in the requested size, optionally
      preserving the image's aspect ratio. When preserving the aspect ratio,
      a width of -1 will cause the image to be scaled to the exact given
      height, and a height of -1 will cause the image to be scaled to the
      exact given width. When not preserving aspect ratio, a width or
      height of -1 means to not scale the image at all in that dimension.
      
      The stream is not closed.
  
      Params:
        resourcePath = the path of the resource file
        width = The width the image should have or -1 to not constrain the width
        height = The height the image should have or -1 to not constrain the height
        preserveAspectRatio = `TRUE` to preserve the image's aspect ratio
      Returns: A newly-created pixbuf
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromResourceAtScale(string resourcePath, int width, int height, bool preserveAspectRatio)
  {
    GdkPixbuf* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    GError *_err;
    _cretval = gdk_pixbuf_new_from_resource_at_scale(_resourcePath, width, height, preserveAspectRatio, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new pixbuf by loading an image from an input stream.
      
      The file format is detected automatically.
      
      If `NULL` is returned, then `error` will be set.
      
      The `cancellable` can be used to abort the operation from another thread.
      If the operation was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be
      returned. Other possible errors are in the `GDK_PIXBUF_ERROR` and
      `G_IO_ERROR` domains.
      
      The stream is not closed.
  
      Params:
        stream = a [gio.input_stream.InputStream] to load the pixbuf from
        cancellable = optional [gio.cancellable.Cancellable] object, `NULL` to ignore
      Returns: A newly-created pixbuf
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromStream(gio.input_stream.InputStream stream, gio.cancellable.Cancellable cancellable = null)
  {
    GdkPixbuf* _cretval;
    GError *_err;
    _cretval = gdk_pixbuf_new_from_stream(stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new pixbuf by loading an image from an input stream.
      
      The file format is detected automatically. If `NULL` is returned, then
      error will be set. The cancellable can be used to abort the operation
      from another thread. If the operation was cancelled, the error
      [gio.types.IOErrorEnum.Cancelled] will be returned. Other possible errors are in
      the `GDK_PIXBUF_ERROR` and `G_IO_ERROR` domains.
      
      The image will be scaled to fit in the requested size, optionally
      preserving the image's aspect ratio.
      
      When preserving the aspect ratio, a `width` of -1 will cause the image to be
      scaled to the exact given height, and a `height` of -1 will cause the image
      to be scaled to the exact given width. If both `width` and `height` are
      given, this function will behave as if the smaller of the two values
      is passed as -1.
      
      When not preserving aspect ratio, a `width` or `height` of -1 means to not
      scale the image at all in that dimension.
      
      The stream is not closed.
  
      Params:
        stream = a [gio.input_stream.InputStream] to load the pixbuf from
        width = The width the image should have or -1 to not constrain the width
        height = The height the image should have or -1 to not constrain the height
        preserveAspectRatio = `TRUE` to preserve the image's aspect ratio
        cancellable = optional [gio.cancellable.Cancellable] object, `NULL` to ignore
      Returns: A newly-created pixbuf
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromStreamAtScale(gio.input_stream.InputStream stream, int width, int height, bool preserveAspectRatio, gio.cancellable.Cancellable cancellable = null)
  {
    GdkPixbuf* _cretval;
    GError *_err;
    _cretval = gdk_pixbuf_new_from_stream_at_scale(stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, width, height, preserveAspectRatio, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Finishes an asynchronous pixbuf creation operation started with
      [gdkpixbuf.pixbuf.Pixbuf.newFromStreamAsync].
  
      Params:
        asyncResult = a [gio.async_result.AsyncResult]
      Returns: the newly created pixbuf
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromStreamFinish(gio.async_result.AsyncResult asyncResult)
  {
    GdkPixbuf* _cretval;
    GError *_err;
    _cretval = gdk_pixbuf_new_from_stream_finish(asyncResult ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)asyncResult)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new pixbuf by parsing XPM data in memory.
      
      This data is commonly the result of including an XPM file into a
      program's C source.
  
      Params:
        data = Pointer to inline XPM data.
      Returns: A newly-created pixbuf
  */
  static gdkpixbuf.pixbuf.Pixbuf newFromXpmData(string[] data)
  {
    GdkPixbuf* _cretval;
    char*[] _tmpdata;
    foreach (s; data)
      _tmpdata ~= s.toCString(No.Alloc);
    _tmpdata ~= null;
    const(char*)* _data = _tmpdata.ptr;
    _cretval = gdk_pixbuf_new_from_xpm_data(_data);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Calculates the rowstride that an image created with those values would
      have.
      
      This function is useful for front-ends and backends that want to check
      image values without needing to create a [gdkpixbuf.pixbuf.Pixbuf].
  
      Params:
        colorspace = Color space for image
        hasAlpha = Whether the image should have transparency information
        bitsPerSample = Number of bits per color sample
        width = Width of image in pixels, must be > 0
        height = Height of image in pixels, must be > 0
      Returns: the rowstride for the given values, or -1 in case of error.
  */
  static int calculateRowstride(gdkpixbuf.types.Colorspace colorspace, bool hasAlpha, int bitsPerSample, int width, int height)
  {
    int _retval;
    _retval = gdk_pixbuf_calculate_rowstride(colorspace, hasAlpha, bitsPerSample, width, height);
    return _retval;
  }

  /**
      Parses an image file far enough to determine its format and size.
  
      Params:
        filename = The name of the file to identify.
        width = Return location for the width of the image
        height = Return location for the height of the image
      Returns: A [gdkpixbuf.pixbuf_format.PixbufFormat] describing
          the image format of the file
  */
  static gdkpixbuf.pixbuf_format.PixbufFormat getFileInfo(string filename, out int width, out int height)
  {
    GdkPixbufFormat* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gdk_pixbuf_get_file_info(_filename, cast(int*)&width, cast(int*)&height);
    auto _retval = _cretval ? new gdkpixbuf.pixbuf_format.PixbufFormat(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Asynchronously parses an image file far enough to determine its
      format and size.
      
      For more details see [gdkpixbuf.pixbuf.Pixbuf.getFileInfo], which is the synchronous
      version of this function.
      
      When the operation is finished, callback will be called in the
      main thread. You can then call [gdkpixbuf.pixbuf.Pixbuf.getFileInfoFinish] to
      get the result of the operation.
  
      Params:
        filename = The name of the file to identify
        cancellable = optional [gio.cancellable.Cancellable] object, `NULL` to ignore
        callback = a [gio.types.AsyncReadyCallback] to call when the file info is available
  */
  static void getFileInfoAsync(string filename, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _filename = filename.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_pixbuf_get_file_info_async(_filename, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous pixbuf parsing operation started with
      [gdkpixbuf.pixbuf.Pixbuf.getFileInfoAsync].
  
      Params:
        asyncResult = a [gio.async_result.AsyncResult]
        width = Return location for the width of the image, or `NULL`
        height = Return location for the height of the image, or `NULL`
      Returns: A [gdkpixbuf.pixbuf_format.PixbufFormat] describing the
          image format of the file
      Throws: [ErrorWrap]
  */
  static gdkpixbuf.pixbuf_format.PixbufFormat getFileInfoFinish(gio.async_result.AsyncResult asyncResult, out int width, out int height)
  {
    GdkPixbufFormat* _cretval;
    GError *_err;
    _cretval = gdk_pixbuf_get_file_info_finish(asyncResult ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)asyncResult)._cPtr(No.Dup) : null, cast(int*)&width, cast(int*)&height, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gdkpixbuf.pixbuf_format.PixbufFormat(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains the available information about the image formats supported
      by GdkPixbuf.
      Returns: A list of
          support image formats.
  */
  static gdkpixbuf.pixbuf_format.PixbufFormat[] getFormats()
  {
    GSList* _cretval;
    _cretval = gdk_pixbuf_get_formats();
    auto _retval = gSListToD!(gdkpixbuf.pixbuf_format.PixbufFormat, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Initalizes the gdk-pixbuf loader modules referenced by the `loaders.cache`
      file present inside that directory.
      
      This is to be used by applications that want to ship certain loaders
      in a different location from the system ones.
      
      This is needed when the OS or runtime ships a minimal number of loaders
      so as to reduce the potential attack surface of carefully crafted image
      files, especially for uncommon file types. Applications that require
      broader image file types coverage, such as image viewers, would be
      expected to ship the gdk-pixbuf modules in a separate location, bundled
      with the application in a separate directory from the OS or runtime-
      provided modules.
  
      Params:
        path = Path to directory where the `loaders.cache` is installed
      Returns: 
      Throws: [ErrorWrap]
  */
  static bool initModules(string path)
  {
    bool _retval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _retval = gdk_pixbuf_init_modules(_path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates a new pixbuf by asynchronously loading an image from an input stream.
      
      For more details see [gdkpixbuf.pixbuf.Pixbuf.newFromStream], which is the synchronous
      version of this function.
      
      When the operation is finished, callback will be called in the main thread.
      You can then call [gdkpixbuf.pixbuf.Pixbuf.newFromStreamFinish] to get the result of
      the operation.
  
      Params:
        stream = a [gio.input_stream.InputStream] from which to load the pixbuf
        cancellable = optional [gio.cancellable.Cancellable] object, `NULL` to ignore
        callback = a [gio.types.AsyncReadyCallback] to call when the pixbuf is loaded
  */
  static void newFromStreamAsync(gio.input_stream.InputStream stream, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_pixbuf_new_from_stream_async(stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Creates a new pixbuf by asynchronously loading an image from an input stream.
      
      For more details see [gdkpixbuf.pixbuf.Pixbuf.newFromStreamAtScale], which is the synchronous
      version of this function.
      
      When the operation is finished, callback will be called in the main thread.
      You can then call [gdkpixbuf.pixbuf.Pixbuf.newFromStreamFinish] to get the result of the operation.
  
      Params:
        stream = a [gio.input_stream.InputStream] from which to load the pixbuf
        width = the width the image should have or -1 to not constrain the width
        height = the height the image should have or -1 to not constrain the height
        preserveAspectRatio = `TRUE` to preserve the image's aspect ratio
        cancellable = optional [gio.cancellable.Cancellable] object, `NULL` to ignore
        callback = a [gio.types.AsyncReadyCallback] to call when the pixbuf is loaded
  */
  static void newFromStreamAtScaleAsync(gio.input_stream.InputStream stream, int width, int height, bool preserveAspectRatio, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_pixbuf_new_from_stream_at_scale_async(stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, width, height, preserveAspectRatio, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous pixbuf save operation started with
      [gdkpixbuf.pixbuf.Pixbuf.saveToStreamAsync].
  
      Params:
        asyncResult = a [gio.async_result.AsyncResult]
      Returns: `TRUE` if the pixbuf was saved successfully, `FALSE` if an error was set.
      Throws: [ErrorWrap]
  */
  static bool saveToStreamFinish(gio.async_result.AsyncResult asyncResult)
  {
    bool _retval;
    GError *_err;
    _retval = gdk_pixbuf_save_to_stream_finish(asyncResult ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)asyncResult)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Takes an existing pixbuf and adds an alpha channel to it.
      
      If the existing pixbuf already had an alpha channel, the channel
      values are copied from the original; otherwise, the alpha channel
      is initialized to 255 (full opacity).
      
      If `substitute_color` is `TRUE`, then the color specified by the
      (`r`, `g`, `b`) arguments will be assigned zero opacity. That is,
      if you pass `(255, 255, 255)` for the substitute color, all white
      pixels will become fully transparent.
      
      If `substitute_color` is `FALSE`, then the (`r`, `g`, `b`) arguments
      will be ignored.
  
      Params:
        substituteColor = Whether to set a color to zero opacity.
        r = Red value to substitute.
        g = Green value to substitute.
        b = Blue value to substitute.
      Returns: A newly-created pixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf addAlpha(bool substituteColor, ubyte r, ubyte g, ubyte b)
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_add_alpha(cast(const(GdkPixbuf)*)this._cPtr, substituteColor, r, g, b);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Takes an existing pixbuf and checks for the presence of an
      associated "orientation" option.
      
      The orientation option may be provided by the JPEG loader (which
      reads the exif orientation tag) or the TIFF loader (which reads
      the TIFF orientation tag, and compensates it for the partial
      transforms performed by libtiff).
      
      If an orientation option/tag is present, the appropriate transform
      will be performed so that the pixbuf is oriented correctly.
      Returns: A newly-created pixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf applyEmbeddedOrientation()
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_apply_embedded_orientation(cast(GdkPixbuf*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a transformation of the source image src by scaling by
      scale_x and scale_y then translating by offset_x and offset_y.
      
      This gives an image in the coordinates of the destination pixbuf.
      The rectangle (dest_x, dest_y, dest_width, dest_height)
      is then alpha blended onto the corresponding rectangle of the
      original destination image.
      
      When the destination rectangle contains parts not in the source
      image, the data at the edges of the source image is replicated
      to infinity.
      
      ![](composite.png)
  
      Params:
        dest = the #GdkPixbuf into which to render the results
        destX = the left coordinate for region to render
        destY = the top coordinate for region to render
        destWidth = the width of the region to render
        destHeight = the height of the region to render
        offsetX = the offset in the X direction (currently rounded to an integer)
        offsetY = the offset in the Y direction (currently rounded to an integer)
        scaleX = the scale factor in the X direction
        scaleY = the scale factor in the Y direction
        interpType = the interpolation type for the transformation.
        overallAlpha = overall alpha for source image (0..255)
  */
  void composite(gdkpixbuf.pixbuf.Pixbuf dest, int destX, int destY, int destWidth, int destHeight, double offsetX, double offsetY, double scaleX, double scaleY, gdkpixbuf.types.InterpType interpType, int overallAlpha)
  {
    gdk_pixbuf_composite(cast(const(GdkPixbuf)*)this._cPtr, dest ? cast(GdkPixbuf*)dest._cPtr(No.Dup) : null, destX, destY, destWidth, destHeight, offsetX, offsetY, scaleX, scaleY, interpType, overallAlpha);
  }

  /**
      Creates a transformation of the source image src by scaling by
      scale_x and scale_y then translating by offset_x and offset_y,
      then alpha blends the rectangle (dest_x ,dest_y, dest_width,
      dest_height) of the resulting image with a checkboard of the
      colors color1 and color2 and renders it onto the destination
      image.
      
      If the source image has no alpha channel, and overall_alpha is 255, a fast
      path is used which omits the alpha blending and just performs the scaling.
      
      See [gdkpixbuf.pixbuf.Pixbuf.compositeColorSimple] for a simpler variant of this
      function suitable for many tasks.
  
      Params:
        dest = the #GdkPixbuf into which to render the results
        destX = the left coordinate for region to render
        destY = the top coordinate for region to render
        destWidth = the width of the region to render
        destHeight = the height of the region to render
        offsetX = the offset in the X direction (currently rounded to an integer)
        offsetY = the offset in the Y direction (currently rounded to an integer)
        scaleX = the scale factor in the X direction
        scaleY = the scale factor in the Y direction
        interpType = the interpolation type for the transformation.
        overallAlpha = overall alpha for source image (0..255)
        checkX = the X offset for the checkboard (origin of checkboard is at -check_x, -check_y)
        checkY = the Y offset for the checkboard
        checkSize = the size of checks in the checkboard (must be a power of two)
        color1 = the color of check at upper left
        color2 = the color of the other check
  */
  void compositeColor(gdkpixbuf.pixbuf.Pixbuf dest, int destX, int destY, int destWidth, int destHeight, double offsetX, double offsetY, double scaleX, double scaleY, gdkpixbuf.types.InterpType interpType, int overallAlpha, int checkX, int checkY, int checkSize, uint color1, uint color2)
  {
    gdk_pixbuf_composite_color(cast(const(GdkPixbuf)*)this._cPtr, dest ? cast(GdkPixbuf*)dest._cPtr(No.Dup) : null, destX, destY, destWidth, destHeight, offsetX, offsetY, scaleX, scaleY, interpType, overallAlpha, checkX, checkY, checkSize, color1, color2);
  }

  /**
      Creates a new pixbuf by scaling `src` to `dest_width` x `dest_height`
      and alpha blending the result with a checkboard of colors `color1`
      and `color2`.
  
      Params:
        destWidth = the width of destination image
        destHeight = the height of destination image
        interpType = the interpolation type for the transformation.
        overallAlpha = overall alpha for source image (0..255)
        checkSize = the size of checks in the checkboard (must be a power of two)
        color1 = the color of check at upper left
        color2 = the color of the other check
      Returns: the new pixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf compositeColorSimple(int destWidth, int destHeight, gdkpixbuf.types.InterpType interpType, int overallAlpha, int checkSize, uint color1, uint color2)
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_composite_color_simple(cast(const(GdkPixbuf)*)this._cPtr, destWidth, destHeight, interpType, overallAlpha, checkSize, color1, color2);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new [gdkpixbuf.pixbuf.Pixbuf] with a copy of the information in the specified
      `pixbuf`.
      
      Note that this does not copy the options set on the original [gdkpixbuf.pixbuf.Pixbuf],
      use [gdkpixbuf.pixbuf.Pixbuf.copyOptions] for this.
      Returns: A newly-created pixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf copy()
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_copy(cast(const(GdkPixbuf)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Copies a rectangular area from `src_pixbuf` to `dest_pixbuf`.
      
      Conversion of pixbuf formats is done automatically.
      
      If the source rectangle overlaps the destination rectangle on the
      same pixbuf, it will be overwritten during the copy operation.
      Therefore, you can not use this function to scroll a pixbuf.
  
      Params:
        srcX = Source X coordinate within src_pixbuf.
        srcY = Source Y coordinate within src_pixbuf.
        width = Width of the area to copy.
        height = Height of the area to copy.
        destPixbuf = Destination pixbuf.
        destX = X coordinate within dest_pixbuf.
        destY = Y coordinate within dest_pixbuf.
  */
  void copyArea(int srcX, int srcY, int width, int height, gdkpixbuf.pixbuf.Pixbuf destPixbuf, int destX, int destY)
  {
    gdk_pixbuf_copy_area(cast(const(GdkPixbuf)*)this._cPtr, srcX, srcY, width, height, destPixbuf ? cast(GdkPixbuf*)destPixbuf._cPtr(No.Dup) : null, destX, destY);
  }

  /**
      Copies the key/value pair options attached to a [gdkpixbuf.pixbuf.Pixbuf] to another
      [gdkpixbuf.pixbuf.Pixbuf].
      
      This is useful to keep original metadata after having manipulated
      a file. However be careful to remove metadata which you've already
      applied, such as the "orientation" option after rotating the image.
  
      Params:
        destPixbuf = the destination pixbuf
      Returns: `TRUE` on success.
  */
  bool copyOptions(gdkpixbuf.pixbuf.Pixbuf destPixbuf)
  {
    bool _retval;
    _retval = gdk_pixbuf_copy_options(cast(GdkPixbuf*)this._cPtr, destPixbuf ? cast(GdkPixbuf*)destPixbuf._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Clears a pixbuf to the given RGBA value, converting the RGBA value into
      the pixbuf's pixel format.
      
      The alpha component will be ignored if the pixbuf doesn't have an alpha
      channel.
  
      Params:
        pixel = RGBA pixel to used to clear (`0xffffffff` is opaque white,
            `0x00000000` transparent black)
  */
  void fill(uint pixel)
  {
    gdk_pixbuf_fill(cast(GdkPixbuf*)this._cPtr, pixel);
  }

  /**
      Flips a pixbuf horizontally or vertically and returns the
      result in a new pixbuf.
  
      Params:
        horizontal = `TRUE` to flip horizontally, `FALSE` to flip vertically
      Returns: the new pixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf flip(bool horizontal)
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_flip(cast(const(GdkPixbuf)*)this._cPtr, horizontal);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Queries the number of bits per color sample in a pixbuf.
      Returns: Number of bits per color sample.
  */
  int getBitsPerSample()
  {
    int _retval;
    _retval = gdk_pixbuf_get_bits_per_sample(cast(const(GdkPixbuf)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the length of the pixel data, in bytes.
      Returns: The length of the pixel data.
  */
  size_t getByteLength()
  {
    size_t _retval;
    _retval = gdk_pixbuf_get_byte_length(cast(const(GdkPixbuf)*)this._cPtr);
    return _retval;
  }

  /**
      Queries the color space of a pixbuf.
      Returns: Color space.
  */
  gdkpixbuf.types.Colorspace getColorspace()
  {
    GdkColorspace _cretval;
    _cretval = gdk_pixbuf_get_colorspace(cast(const(GdkPixbuf)*)this._cPtr);
    gdkpixbuf.types.Colorspace _retval = cast(gdkpixbuf.types.Colorspace)_cretval;
    return _retval;
  }

  /**
      Queries whether a pixbuf has an alpha channel (opacity information).
      Returns: `TRUE` if it has an alpha channel, `FALSE` otherwise.
  */
  bool getHasAlpha()
  {
    bool _retval;
    _retval = gdk_pixbuf_get_has_alpha(cast(const(GdkPixbuf)*)this._cPtr);
    return _retval;
  }

  /**
      Queries the height of a pixbuf.
      Returns: Height in pixels.
  */
  int getHeight()
  {
    int _retval;
    _retval = gdk_pixbuf_get_height(cast(const(GdkPixbuf)*)this._cPtr);
    return _retval;
  }

  /**
      Queries the number of channels of a pixbuf.
      Returns: Number of channels.
  */
  int getNChannels()
  {
    int _retval;
    _retval = gdk_pixbuf_get_n_channels(cast(const(GdkPixbuf)*)this._cPtr);
    return _retval;
  }

  /**
      Looks up key in the list of options that may have been attached to the
      pixbuf when it was loaded, or that may have been attached by another
      function using [gdkpixbuf.pixbuf.Pixbuf.setOption].
      
      For instance, the ANI loader provides "Title" and "Artist" options.
      The ICO, XBM, and XPM loaders provide "x_hot" and "y_hot" hot-spot
      options for cursor definitions. The PNG loader provides the tEXt ancillary
      chunk key/value pairs as options. Since 2.12, the TIFF and JPEG loaders
      return an "orientation" option string that corresponds to the embedded
      TIFF/Exif orientation tag (if present). Since 2.32, the TIFF loader sets
      the "multipage" option string to "yes" when a multi-page TIFF is loaded.
      Since 2.32 the JPEG and PNG loaders set "x-dpi" and "y-dpi" if the file
      contains image density information in dots per inch.
      Since 2.36.6, the JPEG loader sets the "comment" option with the comment
      EXIF tag.
  
      Params:
        key = a nul-terminated string.
      Returns: the value associated with `key`
  */
  string getOption(string key)
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gdk_pixbuf_get_option(cast(GdkPixbuf*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns a [glib.hash_table.HashTable] with a list of all the options that may have been
      attached to the `pixbuf` when it was loaded, or that may have been
      attached by another function using [gdkpixbuf.pixbuf.Pixbuf.setOption].
      Returns: a #GHashTable
          of key/values pairs
  */
  string[string] getOptions()
  {
    GHashTable* _cretval;
    _cretval = gdk_pixbuf_get_options(cast(GdkPixbuf*)this._cPtr);
    auto _retval = gHashTableToD!(string, string, GidOwnership.Container)(cast(GHashTable*)_cretval);
    return _retval;
  }

  /**
      Queries a pointer to the pixel data of a pixbuf.
      
      This function will cause an implicit copy of the pixbuf data if the
      pixbuf was created from read-only data.
      
      Please see the section on [image data](class.Pixbuf.html#image-data) for information
      about how the pixel data is stored in memory.
      Returns: A pointer to the pixbuf's
        pixel data.
  */
  ubyte[] getPixels()
  {
    ubyte* _cretval;
    uint _cretlength;
    _cretval = gdk_pixbuf_get_pixels_with_length(cast(const(GdkPixbuf)*)this._cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Queries the rowstride of a pixbuf, which is the number of bytes between
      the start of a row and the start of the next row.
      Returns: Distance between row starts.
  */
  int getRowstride()
  {
    int _retval;
    _retval = gdk_pixbuf_get_rowstride(cast(const(GdkPixbuf)*)this._cPtr);
    return _retval;
  }

  /**
      Queries the width of a pixbuf.
      Returns: Width in pixels.
  */
  int getWidth()
  {
    int _retval;
    _retval = gdk_pixbuf_get_width(cast(const(GdkPixbuf)*)this._cPtr);
    return _retval;
  }

  /**
      Creates a new pixbuf which represents a sub-region of `src_pixbuf`.
      
      The new pixbuf shares its pixels with the original pixbuf, so
      writing to one affects both.  The new pixbuf holds a reference to
      `src_pixbuf`, so `src_pixbuf` will not be finalized until the new
      pixbuf is finalized.
      
      Note that if `src_pixbuf` is read-only, this function will force it
      to be mutable.
  
      Params:
        srcX = X coord in src_pixbuf
        srcY = Y coord in src_pixbuf
        width = width of region in src_pixbuf
        height = height of region in src_pixbuf
      Returns: a new pixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf newSubpixbuf(int srcX, int srcY, int width, int height)
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_new_subpixbuf(cast(GdkPixbuf*)this._cPtr, srcX, srcY, width, height);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Provides a #GBytes buffer containing the raw pixel data; the data
      must not be modified.
      
      This function allows skipping the implicit copy that must be made
      if [gdkpixbuf.pixbuf.Pixbuf.getPixels] is called on a read-only pixbuf.
      Returns: A new reference to a read-only copy of
          the pixel data.  Note that for mutable pixbufs, this function will
          incur a one-time copy of the pixel data for conversion into the
          returned #GBytes.
  */
  glib.bytes.Bytes readPixelBytes()
  {
    GBytes* _cretval;
    _cretval = gdk_pixbuf_read_pixel_bytes(cast(const(GdkPixbuf)*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Provides a read-only pointer to the raw pixel data.
      
      This function allows skipping the implicit copy that must be made
      if [gdkpixbuf.pixbuf.Pixbuf.getPixels] is called on a read-only pixbuf.
      Returns: a read-only pointer to the raw pixel data
  */
  const(ubyte)* readPixels()
  {
    auto _retval = gdk_pixbuf_read_pixels(cast(const(GdkPixbuf)*)this._cPtr);
    return _retval;
  }

  /**
      Removes the key/value pair option attached to a [gdkpixbuf.pixbuf.Pixbuf].
  
      Params:
        key = a nul-terminated string representing the key to remove.
      Returns: `TRUE` if an option was removed, `FALSE` if not.
  */
  bool removeOption(string key)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = gdk_pixbuf_remove_option(cast(GdkPixbuf*)this._cPtr, _key);
    return _retval;
  }

  /**
      Rotates a pixbuf by a multiple of 90 degrees, and returns the
      result in a new pixbuf.
      
      If `angle` is 0, this function will return a copy of `src`.
  
      Params:
        angle = the angle to rotate by
      Returns: the new pixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf rotateSimple(gdkpixbuf.types.PixbufRotation angle)
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_rotate_simple(cast(const(GdkPixbuf)*)this._cPtr, angle);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Modifies saturation and optionally pixelates `src`, placing the result in
      `dest`.
      
      The `src` and `dest` pixbufs must have the same image format, size, and
      rowstride.
      
      The `src` and `dest` arguments may be the same pixbuf with no ill effects.
      
      If `saturation` is 1.0 then saturation is not changed. If it's less than 1.0,
      saturation is reduced (the image turns toward grayscale); if greater than
      1.0, saturation is increased (the image gets more vivid colors).
      
      If `pixelate` is `TRUE`, then pixels are faded in a checkerboard pattern to
      create a pixelated image.
  
      Params:
        dest = place to write modified version of src
        saturation = saturation factor
        pixelate = whether to pixelate
  */
  void saturateAndPixelate(gdkpixbuf.pixbuf.Pixbuf dest, float saturation, bool pixelate)
  {
    gdk_pixbuf_saturate_and_pixelate(cast(const(GdkPixbuf)*)this._cPtr, dest ? cast(GdkPixbuf*)dest._cPtr(No.Dup) : null, saturation, pixelate);
  }

  /**
      Vector version of `[gdkpixbuf.pixbuf.Pixbuf.saveToBuffer]`.
      
      Saves pixbuf to a new buffer in format type, which is currently "jpeg",
      "tiff", "png", "ico" or "bmp".
      
      See [gdkpixbuf.pixbuf.Pixbuf.saveToBuffer] for more details.
  
      Params:
        buffer = location to receive a pointer to the new buffer.
        type = name of file format.
        optionKeys = name of options to set
        optionValues = values for named options
      Returns: whether an error was set
      Throws: [ErrorWrap]
  */
  bool saveToBufferv(out ubyte[] buffer, string type, string[] optionKeys = null, string[] optionValues = null)
  {
    bool _retval;
    size_t _bufferSize;
    ubyte* _buffer;
    const(char)* _type = type.toCString(No.Alloc);
    char*[] _tmpoptionKeys;
    foreach (s; optionKeys)
      _tmpoptionKeys ~= s.toCString(No.Alloc);
    _tmpoptionKeys ~= null;
    char** _optionKeys = _tmpoptionKeys.ptr;

    char*[] _tmpoptionValues;
    foreach (s; optionValues)
      _tmpoptionValues ~= s.toCString(No.Alloc);
    _tmpoptionValues ~= null;
    char** _optionValues = _tmpoptionValues.ptr;

    GError *_err;
    _retval = gdk_pixbuf_save_to_bufferv(cast(GdkPixbuf*)this._cPtr, &_buffer, &_bufferSize, _type, _optionKeys, _optionValues, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    buffer.length = _bufferSize;
    buffer[0 .. $] = (cast(ubyte*)_buffer)[0 .. _bufferSize];
    gFree(cast(void*)_buffer);
    return _retval;
  }

  /**
      Vector version of `[gdkpixbuf.pixbuf.Pixbuf.saveToCallback]`.
      
      Saves pixbuf to a callback in format type, which is currently "jpeg",
      "png", "tiff", "ico" or "bmp".
      
      If error is set, `FALSE` will be returned.
      
      See [gdkpixbuf.pixbuf.Pixbuf.saveToCallback] for more details.
  
      Params:
        saveFunc = a function that is called to save each block of data that
            the save routine generates.
        type = name of file format.
        optionKeys = name of options to set
        optionValues = values for named options
      Returns: whether an error was set
      Throws: [ErrorWrap]
  */
  bool saveToCallbackv(gdkpixbuf.types.PixbufSaveFunc saveFunc, string type, string[] optionKeys = null, string[] optionValues = null)
  {
    extern(C) bool _saveFuncCallback(const(ubyte)* buf, size_t count, GError** error, void* data)
    {
      auto _dlg = cast(gdkpixbuf.types.PixbufSaveFunc*)data;
      ubyte[] _buf;
      _buf.length = count;
      _buf[0 .. count] = buf[0 .. count];
      auto _error = new glib.error.ErrorWrap(error, No.Take);

      bool _retval = (*_dlg)(_buf, _error);
      *error = *cast(GError**)_error._cPtr;

      return _retval;
    }
    auto _saveFuncCB = saveFunc ? &_saveFuncCallback : null;

    bool _retval;
    auto _saveFunc = saveFunc ? cast(void*)&(saveFunc) : null;
    const(char)* _type = type.toCString(No.Alloc);
    char*[] _tmpoptionKeys;
    foreach (s; optionKeys)
      _tmpoptionKeys ~= s.toCString(No.Alloc);
    _tmpoptionKeys ~= null;
    char** _optionKeys = _tmpoptionKeys.ptr;

    char*[] _tmpoptionValues;
    foreach (s; optionValues)
      _tmpoptionValues ~= s.toCString(No.Alloc);
    _tmpoptionValues ~= null;
    char** _optionValues = _tmpoptionValues.ptr;

    GError *_err;
    _retval = gdk_pixbuf_save_to_callbackv(cast(GdkPixbuf*)this._cPtr, _saveFuncCB, _saveFunc, _type, _optionKeys, _optionValues, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Saves `pixbuf` to an output stream.
      
      Supported file formats are currently "jpeg", "tiff", "png", "ico" or
      "bmp".
      
      See [gdkpixbuf.pixbuf.Pixbuf.saveToStream] for more details.
  
      Params:
        stream = a [gio.output_stream.OutputStream] to save the pixbuf to
        type = name of file format
        optionKeys = name of options to set
        optionValues = values for named options
        cancellable = optional [gio.cancellable.Cancellable] object, `NULL` to ignore
      Returns: `TRUE` if the pixbuf was saved successfully, `FALSE` if an
          error was set.
      Throws: [ErrorWrap]
  */
  bool saveToStreamv(gio.output_stream.OutputStream stream, string type, string[] optionKeys = null, string[] optionValues = null, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    const(char)* _type = type.toCString(No.Alloc);
    char*[] _tmpoptionKeys;
    foreach (s; optionKeys)
      _tmpoptionKeys ~= s.toCString(No.Alloc);
    _tmpoptionKeys ~= null;
    char** _optionKeys = _tmpoptionKeys.ptr;

    char*[] _tmpoptionValues;
    foreach (s; optionValues)
      _tmpoptionValues ~= s.toCString(No.Alloc);
    _tmpoptionValues ~= null;
    char** _optionValues = _tmpoptionValues.ptr;

    GError *_err;
    _retval = gdk_pixbuf_save_to_streamv(cast(GdkPixbuf*)this._cPtr, stream ? cast(GOutputStream*)stream._cPtr(No.Dup) : null, _type, _optionKeys, _optionValues, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Saves `pixbuf` to an output stream asynchronously.
      
      For more details see [gdkpixbuf.pixbuf.Pixbuf.saveToStreamv], which is the synchronous
      version of this function.
      
      When the operation is finished, `callback` will be called in the main thread.
      
      You can then call [gdkpixbuf.pixbuf.Pixbuf.saveToStreamFinish] to get the result of
      the operation.
  
      Params:
        stream = a [gio.output_stream.OutputStream] to which to save the pixbuf
        type = name of file format
        optionKeys = name of options to set
        optionValues = values for named options
        cancellable = optional [gio.cancellable.Cancellable] object, `NULL` to ignore
        callback = a [gio.types.AsyncReadyCallback] to call when the pixbuf is saved
  */
  void saveToStreamvAsync(gio.output_stream.OutputStream stream, string type, string[] optionKeys = null, string[] optionValues = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _type = type.toCString(No.Alloc);
    char*[] _tmpoptionKeys;
    foreach (s; optionKeys)
      _tmpoptionKeys ~= s.toCString(No.Alloc);
    _tmpoptionKeys ~= null;
    char** _optionKeys = _tmpoptionKeys.ptr;

    char*[] _tmpoptionValues;
    foreach (s; optionValues)
      _tmpoptionValues ~= s.toCString(No.Alloc);
    _tmpoptionValues ~= null;
    char** _optionValues = _tmpoptionValues.ptr;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gdk_pixbuf_save_to_streamv_async(cast(GdkPixbuf*)this._cPtr, stream ? cast(GOutputStream*)stream._cPtr(No.Dup) : null, _type, _optionKeys, _optionValues, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Vector version of `[gdkpixbuf.pixbuf.Pixbuf.save]`.
      
      Saves pixbuf to a file in `type`, which is currently "jpeg", "png", "tiff", "ico" or "bmp".
      
      If error is set, `FALSE` will be returned.
      
      See [gdkpixbuf.pixbuf.Pixbuf.save] for more details.
  
      Params:
        filename = name of file to save.
        type = name of file format.
        optionKeys = name of options to set
        optionValues = values for named options
      Returns: whether an error was set
      Throws: [ErrorWrap]
  */
  bool savev(string filename, string type, string[] optionKeys = null, string[] optionValues = null)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    const(char)* _type = type.toCString(No.Alloc);
    char*[] _tmpoptionKeys;
    foreach (s; optionKeys)
      _tmpoptionKeys ~= s.toCString(No.Alloc);
    _tmpoptionKeys ~= null;
    char** _optionKeys = _tmpoptionKeys.ptr;

    char*[] _tmpoptionValues;
    foreach (s; optionValues)
      _tmpoptionValues ~= s.toCString(No.Alloc);
    _tmpoptionValues ~= null;
    char** _optionValues = _tmpoptionValues.ptr;

    GError *_err;
    _retval = gdk_pixbuf_savev(cast(GdkPixbuf*)this._cPtr, _filename, _type, _optionKeys, _optionValues, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates a transformation of the source image src by scaling by
      scale_x and scale_y then translating by offset_x and offset_y,
      then renders the rectangle (dest_x, dest_y, dest_width,
      dest_height) of the resulting image onto the destination image
      replacing the previous contents.
      
      Try to use [gdkpixbuf.pixbuf.Pixbuf.scaleSimple] first; this function is
      the industrial-strength power tool you can fall back to, if
      [gdkpixbuf.pixbuf.Pixbuf.scaleSimple] isn't powerful enough.
      
      If the source rectangle overlaps the destination rectangle on the
      same pixbuf, it will be overwritten during the scaling which
      results in rendering artifacts.
  
      Params:
        dest = the #GdkPixbuf into which to render the results
        destX = the left coordinate for region to render
        destY = the top coordinate for region to render
        destWidth = the width of the region to render
        destHeight = the height of the region to render
        offsetX = the offset in the X direction (currently rounded to an integer)
        offsetY = the offset in the Y direction (currently rounded to an integer)
        scaleX = the scale factor in the X direction
        scaleY = the scale factor in the Y direction
        interpType = the interpolation type for the transformation.
  */
  void scale(gdkpixbuf.pixbuf.Pixbuf dest, int destX, int destY, int destWidth, int destHeight, double offsetX, double offsetY, double scaleX, double scaleY, gdkpixbuf.types.InterpType interpType)
  {
    gdk_pixbuf_scale(cast(const(GdkPixbuf)*)this._cPtr, dest ? cast(GdkPixbuf*)dest._cPtr(No.Dup) : null, destX, destY, destWidth, destHeight, offsetX, offsetY, scaleX, scaleY, interpType);
  }

  /**
      Create a new pixbuf containing a copy of `src` scaled to
      `dest_width` x `dest_height`.
      
      This function leaves `src` unaffected.
      
      The `interp_type` should be [gdkpixbuf.types.InterpType.Nearest] if you want maximum
      speed (but when scaling down [gdkpixbuf.types.InterpType.Nearest] is usually unusably
      ugly). The default `interp_type` should be [gdkpixbuf.types.InterpType.Bilinear] which
      offers reasonable quality and speed.
      
      You can scale a sub-portion of `src` by creating a sub-pixbuf
      pointing into `src`; see [gdkpixbuf.pixbuf.Pixbuf.newSubpixbuf].
      
      If `dest_width` and `dest_height` are equal to the width and height of
      `src`, this function will return an unscaled copy of `src`.
      
      For more complicated scaling/alpha blending see [gdkpixbuf.pixbuf.Pixbuf.scale]
      and [gdkpixbuf.pixbuf.Pixbuf.composite].
  
      Params:
        destWidth = the width of destination image
        destHeight = the height of destination image
        interpType = the interpolation type for the transformation.
      Returns: the new pixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf scaleSimple(int destWidth, int destHeight, gdkpixbuf.types.InterpType interpType)
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_pixbuf_scale_simple(cast(const(GdkPixbuf)*)this._cPtr, destWidth, destHeight, interpType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attaches a key/value pair as an option to a [gdkpixbuf.pixbuf.Pixbuf].
      
      If `key` already exists in the list of options attached to the `pixbuf`,
      the new value is ignored and `FALSE` is returned.
  
      Params:
        key = a nul-terminated string.
        value = a nul-terminated string.
      Returns: `TRUE` on success
  */
  bool setOption(string key, string value)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    _retval = gdk_pixbuf_set_option(cast(GdkPixbuf*)this._cPtr, _key, _value);
    return _retval;
  }
}
