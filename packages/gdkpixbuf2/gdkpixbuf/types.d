/// D types for gdkpixbuf2 library
module gdkpixbuf.types;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.pixbuf_animation;
import gdkpixbuf.pixbuf_format;
import gdkpixbuf.pixbuf_module;
import gid.gid;
import glib.error;


// Enums

/** */
alias Colorspace = GdkColorspace;

/** */
alias InterpType = GdkInterpType;

/** */
alias PixbufAlphaMode = GdkPixbufAlphaMode;

/** */
alias PixbufError = GdkPixbufError;

/** */
alias PixbufFormatFlags = GdkPixbufFormatFlags;

/** */
alias PixbufRotation = GdkPixbufRotation;

// Callbacks

/**
    Defines the type of the function used to fill a
    #GdkPixbufFormat structure with information about a module.

    Params:
      info = a #GdkPixbufFormat.
*/
alias PixbufModuleFillInfoFunc = void delegate(gdkpixbuf.pixbuf_format.PixbufFormat info);

/**
    Defines the type of the function used to set the vtable of a
    #GdkPixbufModule when it is loaded.

    Params:
      module_ = a #GdkPixbufModule.
*/
alias PixbufModuleFillVtableFunc = void delegate(gdkpixbuf.pixbuf_module.PixbufModule module_);

/**
    Incrementally loads a buffer into the image data.

    Params:
      context = the state object created by [gdkpixbuf.types.PixbufModuleBeginLoadFunc]
      buf = the data to load
    Returns: `TRUE` if the incremental load was successful
    Throws: [ErrorWrap]
*/
alias PixbufModuleIncrementLoadFunc = bool delegate(void* context, ubyte[] buf, GError **_err);

/**
    Loads a file from a standard C file stream into a new [gdkpixbuf.pixbuf_animation.PixbufAnimation].
    
    In case of error, this function should return `NULL` and set the `error` argument.

    Params:
      f = the file stream from which the image should be loaded
    Returns: a newly created [gdkpixbuf.pixbuf_animation.PixbufAnimation] for the contents of the file
    Throws: [ErrorWrap]
*/
alias PixbufModuleLoadAnimationFunc = gdkpixbuf.pixbuf_animation.PixbufAnimation delegate(void* f, GError **_err);

/**
    Loads a file from a standard C file stream into a new [gdkpixbuf.pixbuf.Pixbuf].
    
    In case of error, this function should return `NULL` and set the `error` argument.

    Params:
      f = the file stream from which the image should be loaded
    Returns: a newly created [gdkpixbuf.pixbuf.Pixbuf] for the contents of the file
    Throws: [ErrorWrap]
*/
alias PixbufModuleLoadFunc = gdkpixbuf.pixbuf.Pixbuf delegate(void* f, GError **_err);

/**
    Loads XPM data into a new [gdkpixbuf.pixbuf.Pixbuf].

    Params:
      data = the XPM data
    Returns: a newly created [gdkpixbuf.pixbuf.Pixbuf] for the XPM data
*/
alias PixbufModuleLoadXpmDataFunc = gdkpixbuf.pixbuf.Pixbuf delegate(string[] data);

/**
    Defines the type of the function that gets called once the initial
    setup of pixbuf is done.
    
    #GdkPixbufLoader uses a function of this type to emit the
    "<link linkend="GdkPixbufLoader-area-prepared">area_prepared</link>"
    signal.

    Params:
      pixbuf = the #GdkPixbuf that is currently being loaded.
      anim = if an animation is being loaded, the #GdkPixbufAnimation, else null.
*/
alias PixbufModulePreparedFunc = void delegate(gdkpixbuf.pixbuf.Pixbuf pixbuf, gdkpixbuf.pixbuf_animation.PixbufAnimation anim);

/**
    Saves a [gdkpixbuf.pixbuf.Pixbuf] into a standard C file stream.
    
    The optional `param_keys` and `param_values` arrays contain the keys and
    values (in the same order) for attributes to be saved alongside the image
    data.

    Params:
      f = the file stream into which the image should be saved
      pixbuf = the image to save
      paramKeys = parameter keys to save
      paramValues = parameter values to save
    Returns: `TRUE` on success; in case of failure, `FALSE` is returned and
        the `error` is set
    Throws: [ErrorWrap]
*/
alias PixbufModuleSaveFunc = bool delegate(void* f, gdkpixbuf.pixbuf.Pixbuf pixbuf, string[] paramKeys, string[] paramValues, GError **_err);

/**
    Checks whether the given `option_key` is supported when saving.

    Params:
      optionKey = the option key to check
    Returns: `TRUE` if the option is supported
*/
alias PixbufModuleSaveOptionSupportedFunc = bool delegate(string optionKey);

/**
    Defines the type of the function that gets called once the size
    of the loaded image is known.
    
    The function is expected to set width and height to the desired
    size to which the image should be scaled. If a module has no efficient
    way to achieve the desired scaling during the loading of the image, it may
    either ignore the size request, or only approximate it - gdk-pixbuf will
    then perform the required scaling on the completely loaded image.
    
    If the function sets width or height to zero, the module should interpret
    this as a hint that it will be closed soon and shouldn't allocate further
    resources. This convention is used to implement [gdkpixbuf.pixbuf.Pixbuf.getFileInfo]
    efficiently.

    Params:
      width = pointer to a location containing the current image width
      height = pointer to a location containing the current image height
*/
alias PixbufModuleSizeFunc = void delegate(out int width, out int height);

/**
    Finalizes the image loading state.
    
    This function is called on success and error states.

    Params:
      context = the state object created by [gdkpixbuf.types.PixbufModuleBeginLoadFunc]
    Returns: `TRUE` if the loading operation was successful
    Throws: [ErrorWrap]
*/
alias PixbufModuleStopLoadFunc = bool delegate(void* context, GError **_err);

/**
    Defines the type of the function that gets called every time a region
    of pixbuf is updated.
    
    #GdkPixbufLoader uses a function of this type to emit the
    "<link linkend="GdkPixbufLoader-area-updated">area_updated</link>"
    signal.

    Params:
      pixbuf = the #GdkPixbuf that is currently being loaded.
      x = the X origin of the updated area.
      y = the Y origin of the updated area.
      width = the width of the updated area.
      height = the height of the updated area.
*/
alias PixbufModuleUpdatedFunc = void delegate(gdkpixbuf.pixbuf.Pixbuf pixbuf, int x, int y, int width, int height);

/**
    Save functions used by [gdkpixbuf.pixbuf.Pixbuf.saveToCallback].
    
    This function is called once for each block of bytes that is "written"
    by `[gdkpixbuf.pixbuf.Pixbuf.saveToCallback]`.
    
    If successful it should return `TRUE`; if an error occurs it should set
    `error` and return `FALSE`, in which case `[gdkpixbuf.pixbuf.Pixbuf.saveToCallback]`
    will fail with the same error.

    Params:
      buf = bytes to be written.
      error = A location to return an error.
    Returns: `TRUE` if successful, `FALSE` otherwise
*/
alias PixbufSaveFunc = bool delegate(ubyte[] buf, out glib.error.ErrorWrap error);

/**
    Major version of gdk-pixbuf library, that is the "0" in
    "0.8.2" for example.
*/
enum PIXBUF_MAJOR = 2;

/**
    Micro version of gdk-pixbuf library, that is the "2" in
    "0.8.2" for example.
*/
enum PIXBUF_MICRO = 5;

/**
    Minor version of gdk-pixbuf library, that is the "8" in
    "0.8.2" for example.
*/
enum PIXBUF_MINOR = 44;

/**
    Contains the full version of GdkPixbuf as a string.
    
    This is the version being compiled against; contrast with
    `gdk_pixbuf_version`.
*/
enum PIXBUF_VERSION = "2.44.5";
