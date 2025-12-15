/// C types for gdkpixbuf2 library
module gdkpixbuf.c.types;

public import gid.basictypes;
public import gmodule.c.types;
public import gio.c.types;

/**
    This enumeration defines the color spaces that are supported by
    the gdk-pixbuf library.
    
    Currently only RGB is supported.
*/
enum GdkColorspace
{
  /**
      Indicates a red/green/blue additive color space.
  */
  Rgb = 0,
}

/**
    Interpolation modes for scaling functions.
    
    The [gdkpixbuf.types.InterpType.Nearest] mode is the fastest scaling method, but has
    horrible quality when scaling down; [gdkpixbuf.types.InterpType.Bilinear] is the best
    choice if you aren't sure what to choose, it has a good speed/quality
    balance.
    
    **Note**: Cubic filtering is missing from the list; hyperbolic
    interpolation is just as fast and results in higher quality.
*/
enum GdkInterpType
{
  /**
      Nearest neighbor sampling; this is the fastest
       and lowest quality mode. Quality is normally unacceptable when scaling
       down, but may be OK when scaling up.
  */
  Nearest = 0,

  /**
      This is an accurate simulation of the PostScript
       image operator without any interpolation enabled.  Each pixel is
       rendered as a tiny parallelogram of solid color, the edges of which
       are implemented with antialiasing.  It resembles nearest neighbor for
       enlargement, and bilinear for reduction.
  */
  Tiles = 1,

  /**
      Best quality/speed balance; use this mode by
       default. Bilinear interpolation.  For enlargement, it is
       equivalent to point-sampling the ideal bilinear-interpolated image.
       For reduction, it is equivalent to laying down small tiles and
       integrating over the coverage area.
  */
  Bilinear = 2,

  /**
      This is the slowest and highest quality
       reconstruction function. It is derived from the hyperbolic filters in
       Wolberg's "Digital Image Warping", and is formally defined as the
       hyperbolic-filter sampling the ideal hyperbolic-filter interpolated
       image (the filter is designed to be idempotent for 1:1 pixel mapping).
       **Deprecated**: this interpolation filter is deprecated, as in reality
       it has a lower quality than the @GDK_INTERP_BILINEAR filter
       (Since: 2.38)
  */
  Hyper = 3,
}

/**
    Control the alpha channel for drawables.
    
    These values can be passed to gdk_pixbuf_xlib_render_to_drawable_alpha()
    in gdk-pixbuf-xlib to control how the alpha channel of an image should
    be handled.
    
    This function can create a bilevel clipping mask (black and white) and use
    it while painting the image.
    
    In the future, when the X Window System gets an alpha channel extension,
    it will be possible to do full alpha compositing onto arbitrary drawables.
    For now both cases fall back to a bilevel clipping mask.

    Deprecated: There is no user of GdkPixbufAlphaMode in GdkPixbuf,
        and the Xlib utility functions have been split out to their own
        library, gdk-pixbuf-xlib
*/
enum GdkPixbufAlphaMode
{
  /**
      A bilevel clipping mask (black and white)
       will be created and used to draw the image.  Pixels below 0.5 opacity
       will be considered fully transparent, and all others will be
       considered fully opaque.
  */
  Bilevel = 0,

  /**
      For now falls back to #GDK_PIXBUF_ALPHA_BILEVEL.
       In the future it will do full alpha compositing.
  */
  Full = 1,
}

/**
    An error code in the `GDK_PIXBUF_ERROR` domain.
    
    Many gdk-pixbuf operations can cause errors in this domain, or in
    the `G_FILE_ERROR` domain.
*/
enum GdkPixbufError
{
  /**
      An image file was broken somehow.
  */
  CorruptImage = 0,

  /**
      Not enough memory.
  */
  InsufficientMemory = 1,

  /**
      A bad option was passed to a pixbuf save module.
  */
  BadOption = 2,

  /**
      Unknown image type.
  */
  UnknownType = 3,

  /**
      Don't know how to perform the
       given operation on the type of image at hand.
  */
  UnsupportedOperation = 4,

  /**
      Generic failure code, something went wrong.
  */
  Failed = 5,

  /**
      Only part of the animation was loaded.
  */
  IncompleteAnimation = 6,
}

/**
    Flags which allow a module to specify further details about the supported
    operations.
*/
enum GdkPixbufFormatFlags : uint
{
  /**
      the module can write out images in the format.
  */
  Writable = 1,

  /**
      the image format is scalable
  */
  Scalable = 2,

  /**
      the module is threadsafe. gdk-pixbuf
          ignores modules that are not marked as threadsafe. (Since 2.28).
  */
  Threadsafe = 4,
}

/**
    The possible rotations which can be passed to [gdkpixbuf.pixbuf.Pixbuf.rotateSimple].
    
    To make them easier to use, their numerical values are the actual degrees.
*/
enum GdkPixbufRotation
{
  /**
      No rotation.
  */
  None = 0,

  /**
      Rotate by 90 degrees.
  */
  Counterclockwise = 90,

  /**
      Rotate by 180 degrees.
  */
  Upsidedown = 180,

  /**
      Rotate by 270 degrees.
  */
  Clockwise = 270,
}

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
struct GdkPixbuf;

/**
    An opaque object representing an animation.
    
    The GdkPixBuf library provides a simple mechanism to load and
    represent animations. An animation is conceptually a series of
    frames to be displayed over time.
    
    The animation may not be represented as a series of frames
    internally; for example, it may be stored as a sprite and
    instructions for moving the sprite around a background.
    
    To display an animation you don't need to understand its
    representation, however; you just ask [gdkpixbuf.pixbuf.Pixbuf] what should
    be displayed at a given point in time.
*/
struct GdkPixbufAnimation
{
  /** */
  GObject parentInstance;
}

/**
    Modules supporting animations must derive a type from
    #GdkPixbufAnimation, providing suitable implementations of the
    virtual functions.
*/
struct GdkPixbufAnimationClass
{
  /**
      the parent class
  */
  GObjectClass parentClass;

  /**
      returns whether the given animation is just a static image.
  */
  extern(C) gboolean function(GdkPixbufAnimation* animation) isStaticImage;

  /**
      returns a static image representing the given animation.
  */
  extern(C) GdkPixbuf* function(GdkPixbufAnimation* animation) getStaticImage;

  /**
      fills @width and @height with the frame size of the animation.
  */
  extern(C) void function(GdkPixbufAnimation* animation, int* width, int* height) getSize;

  /**
      returns an iterator for the given animation.
  */
  extern(C) GdkPixbufAnimationIter* function(GdkPixbufAnimation* animation, const(GTimeVal)* startTime) getIter;
}

/**
    An opaque object representing an iterator which points to a
    certain position in an animation.
*/
struct GdkPixbufAnimationIter
{
  /** */
  GObject parentInstance;
}

/**
    Modules supporting animations must derive a type from
    #GdkPixbufAnimationIter, providing suitable implementations of the
    virtual functions.
*/
struct GdkPixbufAnimationIterClass
{
  /**
      the parent class
  */
  GObjectClass parentClass;

  /**
      returns the time in milliseconds that the current frame
       should be shown.
  */
  extern(C) int function(GdkPixbufAnimationIter* iter) getDelayTime;

  /**
      returns the current frame.
  */
  extern(C) GdkPixbuf* function(GdkPixbufAnimationIter* iter) getPixbuf;

  /**
      returns whether the current frame of @iter is
       being loaded.
  */
  extern(C) gboolean function(GdkPixbufAnimationIter* iter) onCurrentlyLoadingFrame;

  /**
      advances the iterator to @current_time, possibly changing the
       current frame.
  */
  extern(C) gboolean function(GdkPixbufAnimationIter* iter, const(GTimeVal)* currentTime) advance;
}

/**
    A [gdkpixbuf.pixbuf_format.PixbufFormat] contains information about the image format accepted
    by a module.
    
    Only modules should access the fields directly, applications should
    use the `gdk_pixbuf_format_*` family of functions.
*/
struct GdkPixbufFormat
{
  /**
      the name of the image format
  */
  char* name;

  /**
      the signature of the module
  */
  GdkPixbufModulePattern* signature;

  /**
      the message domain for the `description`
  */
  char* domain;

  /**
      a description of the image format
  */
  char* description;

  /**
      the MIME types for the image format
  */
  char** mimeTypes;

  /**
      typical filename extensions for the
        image format
  */
  char** extensions;

  /**
      a combination of [gdkpixbuf.types.PixbufFormatFlags]
  */
  uint flags;

  /**
      a boolean determining whether the loader is disabled`
  */
  gboolean disabled;

  /**
      a string containing license information, typically set to
        shorthands like "GPL", "LGPL", etc.
  */
  char* license;
}

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
struct GdkPixbufLoader
{
  /** */
  GObject parentInstance;

  /** */
  void* priv;
}

/** */
struct GdkPixbufLoaderClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(GdkPixbufLoader* loader, int width, int height) sizePrepared;

  /** */
  extern(C) void function(GdkPixbufLoader* loader) areaPrepared;

  /** */
  extern(C) void function(GdkPixbufLoader* loader, int x, int y, int width, int height) areaUpdated;

  /** */
  extern(C) void function(GdkPixbufLoader* loader) closed;
}

/**
    A [gdkpixbuf.pixbuf_module.PixbufModule] contains the necessary functions to load and save
    images in a certain file format.
    
    If [gdkpixbuf.pixbuf.Pixbuf] has been compiled with [gmodule.module_.Module] support, it can be extended
    by modules which can load (and perhaps also save) new image and animation
    formats.
    
    ## Implementing modules
    
    The [gdkpixbuf.pixbuf.Pixbuf] interfaces needed for implementing modules are contained in
    `gdk-pixbuf-io.h` (and `gdk-pixbuf-animation.h` if the module supports
    animations). They are not covered by the same stability guarantees as the
    regular GdkPixbuf API. To underline this fact, they are protected by the
    `GDK_PIXBUF_ENABLE_BACKEND` pre-processor symbol.
    
    Each loadable module must contain a [gdkpixbuf.types.PixbufModuleFillVtableFunc] function
    named `fill_vtable`, which will get called when the module
    is loaded and must set the function pointers of the [gdkpixbuf.pixbuf_module.PixbufModule].
    
    In order to make format-checking work before actually loading the modules
    (which may require calling `dlopen` to load image libraries), modules export
    their signatures (and other information) via the `fill_info` function. An
    external utility, `gdk-pixbuf-query-loaders`, uses this to create a text
    file containing a list of all available loaders and  their signatures.
    This file is then read at runtime by [gdkpixbuf.pixbuf.Pixbuf] to obtain the list of
    available loaders and their signatures.
    
    Modules may only implement a subset of the functionality available via
    [gdkpixbuf.pixbuf_module.PixbufModule]. If a particular functionality is not implemented, the
    `fill_vtable` function will simply not set the corresponding
    function pointers of the [gdkpixbuf.pixbuf_module.PixbufModule] structure. If a module supports
    incremental loading (i.e. provides `begin_load`, `stop_load` and
    `load_increment`), it doesn't have to implement `load`, since [gdkpixbuf.pixbuf.Pixbuf]
    can supply a generic `load` implementation wrapping the incremental loading.
    
    ## Installing modules
    
    Installing a module is a two-step process:
    
     $(LIST
        * copy the module file(s) to the loader directory (normally
          `$libdir/gdk-pixbuf-2.0/$version/loaders`, unless overridden by the
          environment variable `GDK_PIXBUF_MODULEDIR`)
        * call `gdk-pixbuf-query-loaders` to update the module file (normally
          `$libdir/gdk-pixbuf-2.0/$version/loaders.cache`, unless overridden
          by the environment variable `GDK_PIXBUF_MODULE_FILE`)
     )
*/
struct GdkPixbufModule
{
  /**
      the name of the module, usually the same as the
       usual file extension for images of this type, eg. "xpm", "jpeg" or "png".
  */
  char* moduleName;

  /**
      the path from which the module is loaded.
  */
  char* modulePath;

  /**
      the loaded [gmodule.module_.Module].
  */
  ModuleC* module_;

  /**
      a [gdkpixbuf.pixbuf_format.PixbufFormat] holding information about the module.
  */
  GdkPixbufFormat* info;

  /**
      loads an image from a file.
  */
  GdkPixbufModuleLoadFunc load;

  /**
      loads an image from data in memory.
  */
  GdkPixbufModuleLoadXpmDataFunc loadXpmData;

  /**
      begins an incremental load.
  */
  GdkPixbufModuleBeginLoadFunc beginLoad;

  /**
      stops an incremental load.
  */
  GdkPixbufModuleStopLoadFunc stopLoad;

  /**
      continues an incremental load.
  */
  GdkPixbufModuleIncrementLoadFunc loadIncrement;

  /**
      loads an animation from a file.
  */
  GdkPixbufModuleLoadAnimationFunc loadAnimation;

  /**
      saves a [gdkpixbuf.pixbuf.Pixbuf] to a file.
  */
  GdkPixbufModuleSaveFunc save;

  /**
      saves a [gdkpixbuf.pixbuf.Pixbuf] by calling the given [gdkpixbuf.types.PixbufSaveFunc].
  */
  GdkPixbufModuleSaveCallbackFunc saveToCallback;

  /**
      returns whether a save option key is supported by the module
  */
  GdkPixbufModuleSaveOptionSupportedFunc isSaveOptionSupported;

  /** */
  extern(C) void function() Reserved1;

  /** */
  extern(C) void function() Reserved2;

  /** */
  extern(C) void function() Reserved3;

  /** */
  extern(C) void function() Reserved4;
}

/**
    The signature prefix for a module.
    
    The signature of a module is a set of prefixes. Prefixes are encoded as
    pairs of ordinary strings, where the second string, called the mask, if
    not `NULL`, must be of the same length as the first one and may contain
    ' ', '!', 'x', 'z', and 'n' to indicate bytes that must be matched,
    not matched, "don't-care"-bytes, zeros and non-zeros, respectively.
    
    Each prefix has an associated integer that describes the relevance of
    the prefix, with 0 meaning a mismatch and 100 a "perfect match".
    
    Starting with gdk-pixbuf 2.8, the first byte of the mask may be '*',
    indicating an unanchored pattern that matches not only at the beginning,
    but also in the middle. Versions prior to 2.8 will interpret the '*'
    like an 'x'.
    
    The signature of a module is stored as an array of
    `GdkPixbufModulePatterns`. The array is terminated by a pattern
    where the `prefix` is `NULL`.
    
    ```c
    GdkPixbufModulePattern *signature[] = {
      { "abcdx", " !x z", 100 },
      { "bla", NULL,  90 },
      { NULL, NULL, 0 }
    };
    ```
    
    In the example above, the signature matches e.g. "auud\0" with
    relevance 100, and "blau" with relevance 90.
*/
struct GdkPixbufModulePattern
{
  /**
      the prefix for this pattern
  */
  char* prefix;

  /**
      mask containing bytes which modify how the prefix is matched against
       test data
  */
  char* mask;

  /**
      relevance of this pattern
  */
  int relevance;
}

/** */
struct GdkPixbufNonAnim;

/**
    An opaque struct representing a simple animation.
*/
struct GdkPixbufSimpleAnim;

/** */
struct GdkPixbufSimpleAnimClass;

/** */
struct GdkPixbufSimpleAnimIter;

alias extern(C) void function(ubyte* pixels, void* data) GdkPixbufDestroyNotify;

alias extern(C) void* function(GdkPixbufModuleSizeFunc sizeFunc, GdkPixbufModulePreparedFunc preparedFunc, GdkPixbufModuleUpdatedFunc updatedFunc, void* userData, GError** _err) GdkPixbufModuleBeginLoadFunc;

alias extern(C) void function(GdkPixbufFormat* info) GdkPixbufModuleFillInfoFunc;

alias extern(C) void function(GdkPixbufModule* module_) GdkPixbufModuleFillVtableFunc;

alias extern(C) gboolean function(void* context, const(ubyte)* buf, uint size, GError** _err) GdkPixbufModuleIncrementLoadFunc;

alias extern(C) GdkPixbufAnimation* function(void* f, GError** _err) GdkPixbufModuleLoadAnimationFunc;

alias extern(C) GdkPixbuf* function(void* f, GError** _err) GdkPixbufModuleLoadFunc;

alias extern(C) GdkPixbuf* function(const(char*)* data) GdkPixbufModuleLoadXpmDataFunc;

alias extern(C) void function(GdkPixbuf* pixbuf, GdkPixbufAnimation* anim, void* userData) GdkPixbufModulePreparedFunc;

alias extern(C) gboolean function(GdkPixbufSaveFunc saveFunc, void* userData, GdkPixbuf* pixbuf, char** optionKeys, char** optionValues, GError** _err) GdkPixbufModuleSaveCallbackFunc;

alias extern(C) gboolean function(void* f, GdkPixbuf* pixbuf, char** paramKeys, char** paramValues, GError** _err) GdkPixbufModuleSaveFunc;

alias extern(C) gboolean function(const(char)* optionKey) GdkPixbufModuleSaveOptionSupportedFunc;

alias extern(C) void function(int* width, int* height, void* userData) GdkPixbufModuleSizeFunc;

alias extern(C) gboolean function(void* context, GError** _err) GdkPixbufModuleStopLoadFunc;

alias extern(C) void function(GdkPixbuf* pixbuf, int x, int y, int width, int height, void* userData) GdkPixbufModuleUpdatedFunc;

alias extern(C) gboolean function(const(ubyte)* buf, size_t count, GError** error, void* data) GdkPixbufSaveFunc;

