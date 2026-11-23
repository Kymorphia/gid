/// Module for [Texture] class
module gid.gdk4.texture;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.color_state;
import gid.gdk4.paintable;
import gid.gdk4.paintable_mixin;
import gid.gdk4.types;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.file;
import gid.gio2.icon;
import gid.gio2.icon_mixin;
import gid.gio2.loadable_icon;
import gid.gio2.loadable_icon_mixin;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Refers to pixel data in various forms.
    
    It is primarily meant for pixel data that will not change over
    multiple frames, and will be used for a long time.
    
    There are various ways to create [gid.gdk4.texture.Texture] objects from a
    [gid.gdkpixbuf2.pixbuf.Pixbuf], or from bytes stored in memory, a file, or a
    [gid.gio2.resource.Resource].
    
    The ownership of the pixel data is transferred to the [gid.gdk4.texture.Texture]
    instance; you can only make a copy of it, via [gid.gdk4.texture.Texture.download].
    
    [gid.gdk4.texture.Texture] is an immutable object: That means you cannot change
    anything about it other than increasing the reference count via
    [gid.gobject2.object.ObjectWrap.ref_], and consequently, it is a threadsafe object.
    
    GDK provides a number of threadsafe texture loading functions:
    [gid.gdk4.texture.Texture.newFromResource],
    [gid.gdk4.texture.Texture.newFromBytes],
    [gid.gdk4.texture.Texture.newFromFile],
    [gid.gdk4.texture.Texture.newFromFilename],
    [gid.gdk4.texture.Texture.newForPixbuf]. Note that these are meant for loading
    icons and resources that are shipped with the toolkit or application. It
    is recommended that you use a dedicated image loading framework such as
    [glycin](https://lib.rs/crates/glycin), if you need to load untrusted image
    data.
*/
class Texture : gid.gobject2.object.ObjectWrap, gid.gdk4.paintable.Paintable, gid.gio2.icon.Icon, gid.gio2.loadable_icon.LoadableIcon
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_texture_get_type != &gidSymbolNotFound ? gdk_texture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkTexture";
  }

  /** Returns `this`, for use in `with` statements. */
  override Texture self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.texture.Texture]
      Returns: New builder object
  */
  static TextureGidBuilder builder() nothrow
  {
    return new TextureGidBuilder;
  }

  /**
      Get `colorState` property.
      Returns: The color state of the texture.
  */
  @property gid.gdk4.color_state.ColorState colorState() nothrow
  {
    return getColorState();
  }

  /**
      Get `height` property.
      Returns: The height of the texture, in pixels.
  */
  @property int height() nothrow
  {
    return getHeight();
  }

  /**
      Get `width` property.
      Returns: The width of the texture, in pixels.
  */
  @property int width() nothrow
  {
    return getWidth();
  }

  mixin PaintableT!();
  mixin IconT!();
  mixin LoadableIconT!();

  /**
      Creates a new texture object representing the [gid.gdkpixbuf2.pixbuf.Pixbuf].
      
      This function is threadsafe, so that you can e.g. use GTask
      and [gid.gio2.task.Task.runInThread] to avoid blocking the main
      thread while loading a big image.
  
      Params:
        pixbuf = a [gid.gdkpixbuf2.pixbuf.Pixbuf]
      Returns: a new [gid.gdk4.texture.Texture]
  
      Deprecated: Use e.g. libglycin, which can load many image
          formats into a [gid.gdk4.texture.Texture]
  */
  static gid.gdk4.texture.Texture newForPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf) nothrow
  {
    GdkTexture* _cretval;
    _cretval = gdk_texture_new_for_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new texture by loading an image from memory,
      
      The file format is detected automatically. The supported formats
      are PNG, JPEG and TIFF, though more formats might be available.
      
      If `NULL` is returned, then error will be set.
      
      This function is threadsafe, so that you can e.g. use GTask
      and [gid.gio2.task.Task.runInThread] to avoid blocking the main thread
      while loading a big image.
      
      ::: warning
          Note that this function should not be used with untrusted data.
          Use a proper image loading framework such as libglycin, which can
          load many image formats into a [gid.gdk4.texture.Texture].
  
      Params:
        bytes = a [gid.glib2.bytes.Bytes] containing the data to load
      Returns: A newly-created [gid.gdk4.texture.Texture]
      Throws: [ErrorWrap]
  */
  static gid.gdk4.texture.Texture newFromBytes(gid.glib2.bytes.Bytes bytes)
  {
    GdkTexture* _cretval;
    GError *_err;
    _cretval = gdk_texture_new_from_bytes(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new texture by loading an image from a file.
      
      The file format is detected automatically. The supported formats
      are PNG, JPEG and TIFF, though more formats might be available.
      
      If `NULL` is returned, then error will be set.
      
      This function is threadsafe, so that you can e.g. use GTask
      and [gid.gio2.task.Task.runInThread] to avoid blocking the main thread
      while loading a big image.
      
      ::: warning
          Note that this function should not be used with untrusted data.
          Use a proper image loading framework such as libglycin, which can
          load many image formats into a [gid.gdk4.texture.Texture].
  
      Params:
        file = [gid.gio2.file.File] to load
      Returns: A newly-created [gid.gdk4.texture.Texture]
      Throws: [ErrorWrap]
  */
  static gid.gdk4.texture.Texture newFromFile(gid.gio2.file.File file)
  {
    GdkTexture* _cretval;
    GError *_err;
    _cretval = gdk_texture_new_from_file(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new texture by loading an image from a file.
      
      The file format is detected automatically. The supported formats
      are PNG, JPEG and TIFF, though more formats might be available.
      
      If `NULL` is returned, then error will be set.
      
      This function is threadsafe, so that you can e.g. use GTask
      and [gid.gio2.task.Task.runInThread] to avoid blocking the main thread
      while loading a big image.
      
      ::: warning
          Note that this function should not be used with untrusted data.
          Use a proper image loading framework such as libglycin, which can
          load many image formats into a [gid.gdk4.texture.Texture].
  
      Params:
        path = the filename to load
      Returns: A newly-created [gid.gdk4.texture.Texture]
      Throws: [ErrorWrap]
  */
  static gid.gdk4.texture.Texture newFromFilename(string path)
  {
    GdkTexture* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = gdk_texture_new_from_filename(_path, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new texture by loading an image from a resource.
      
      The file format is detected automatically. The supported formats
      are PNG, JPEG and TIFF, though more formats might be available.
      
      It is a fatal error if resource_path does not specify a valid
      image resource and the program will abort if that happens.
      If you are unsure about the validity of a resource, use
      [gid.gdk4.texture.Texture.newFromFile] to load it.
      
      This function is threadsafe, so that you can e.g. use GTask
      and [gid.gio2.task.Task.runInThread] to avoid blocking the main thread
      while loading a big image.
  
      Params:
        resourcePath = the path of the resource file
      Returns: A newly-created [gid.gdk4.texture.Texture]
  */
  static gid.gdk4.texture.Texture newFromResource(string resourcePath) nothrow
  {
    GdkTexture* _cretval;
    const(char)* _resourcePath = resourcePath.toCString!(No.Malloc, No.Nullable);
    _cretval = gdk_texture_new_from_resource(_resourcePath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the color state associated with the texture.
      Returns: the color state of the [gid.gdk4.texture.Texture]
  */
  gid.gdk4.color_state.ColorState getColorState() nothrow
  {
    GdkColorState* _cretval;
    _cretval = gdk_texture_get_color_state(cast(GdkTexture*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.color_state.ColorState(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the memory format most closely associated with the data of
      the texture.
      
      Note that it may not be an exact match for texture data
      stored on the GPU or with compression.
      
      The format can give an indication about the bit depth and opacity
      of the texture and is useful to determine the best format for
      downloading the texture.
      Returns: the preferred format for the texture's data
  */
  gid.gdk4.types.MemoryFormat getFormat() nothrow
  {
    GdkMemoryFormat _cretval;
    _cretval = gdk_texture_get_format(cast(GdkTexture*)this._cPtr);
    gid.gdk4.types.MemoryFormat _retval = cast(gid.gdk4.types.MemoryFormat)_cretval;
    return _retval;
  }

  /**
      Returns the height of the texture, in pixels.
      Returns: the height of the [gid.gdk4.texture.Texture]
  */
  int getHeight() nothrow
  {
    int _retval;
    _retval = gdk_texture_get_height(cast(GdkTexture*)this._cPtr);
    return _retval;
  }

  /**
      Returns the width of texture, in pixels.
      Returns: the width of the [gid.gdk4.texture.Texture]
  */
  int getWidth() nothrow
  {
    int _retval;
    _retval = gdk_texture_get_width(cast(GdkTexture*)this._cPtr);
    return _retval;
  }

  /**
      Store the given texture to the filename as a PNG file.
      
      This is a utility function intended for debugging and testing.
      If you want more control over formats, proper error handling or
      want to store to a [gid.gio2.file.File] or other location, you might
      want to use [gid.gdk4.texture.Texture.saveToPngBytes] or look into
      the libglycin library.
  
      Params:
        filename = the filename to store to
      Returns: true if saving succeeded, false on failure.
  */
  bool saveToPng(string filename) nothrow
  {
    bool _retval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gdk_texture_save_to_png(cast(GdkTexture*)this._cPtr, _filename);
    return _retval;
  }

  /**
      Store the given texture in memory as a PNG file.
      
      Use [gid.gdk4.texture.Texture.newFromBytes] to read it back.
      
      If you want to serialize a texture, this is a convenient and
      portable way to do that.
      
      If you need more control over the generated image, such as
      attaching metadata, you should look into an image handling
      library such as the libglycin library.
      
      If you are dealing with high dynamic range float data, you
      might also want to consider [gid.gdk4.texture.Texture.saveToTiffBytes]
      instead.
      Returns: a newly allocated [gid.glib2.bytes.Bytes] containing PNG data
  */
  gid.glib2.bytes.Bytes saveToPngBytes() nothrow
  {
    GBytes* _cretval;
    _cretval = gdk_texture_save_to_png_bytes(cast(GdkTexture*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Store the given texture to the filename as a TIFF file.
      
      GTK will attempt to store data without loss.
  
      Params:
        filename = the filename to store to
      Returns: true if saving succeeded, false on failure.
  */
  bool saveToTiff(string filename) nothrow
  {
    bool _retval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gdk_texture_save_to_tiff(cast(GdkTexture*)this._cPtr, _filename);
    return _retval;
  }

  /**
      Store the given texture in memory as a TIFF file.
      
      Use [gid.gdk4.texture.Texture.newFromBytes] to read it back.
      
      This function is intended to store a representation of the
      texture's data that is as accurate as possible. This is
      particularly relevant when working with high dynamic range
      images and floating-point texture data.
      
      If that is not your concern and you are interested in a
      smaller size and a more portable format, you might want to
      use [gid.gdk4.texture.Texture.saveToPngBytes].
      Returns: a newly allocated [gid.glib2.bytes.Bytes] containing TIFF data
  */
  gid.glib2.bytes.Bytes saveToTiffBytes() nothrow
  {
    GBytes* _cretval;
    _cretval = gdk_texture_save_to_tiff_bytes(cast(GdkTexture*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gdk4.texture.Texture]
class TextureGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gdk4.paintable.PaintableGidBuilderImpl!T, gid.gio2.icon.IconGidBuilderImpl!T, gid.gio2.loadable_icon.LoadableIconGidBuilderImpl!T
{

  mixin PaintableGidBuilderT!();
  mixin IconGidBuilderT!();
  mixin LoadableIconGidBuilderT!();

  /**
      Set `colorState` property.
      Params:
        propval = The color state of the texture.
      Returns: Builder instance for fluent chaining
  */
  T colorState(gid.gdk4.color_state.ColorState propval) nothrow
  {
    return setProperty("color-state", propval);
  }

  /**
      Set `height` property.
      Params:
        propval = The height of the texture, in pixels.
      Returns: Builder instance for fluent chaining
  */
  T height(int propval) nothrow
  {
    return setProperty("height", propval);
  }

  /**
      Set `width` property.
      Params:
        propval = The width of the texture, in pixels.
      Returns: Builder instance for fluent chaining
  */
  T width(int propval) nothrow
  {
    return setProperty("width", propval);
  }
}

/// Fluent builder for [gid.gdk4.texture.Texture]
final class TextureGidBuilder : TextureGidBuilderImpl!TextureGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Texture build() nothrow
  {
    return new Texture(cast(void*)createGObject(Texture._getGType), Yes.Take);
  }
}
