/// Module for [Texture] class
module gdk.texture;

import gdk.c.functions;
import gdk.c.types;
import gdk.paintable;
import gdk.paintable_mixin;
import gdk.types;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.file;
import gio.icon;
import gio.icon_mixin;
import gio.loadable_icon;
import gio.loadable_icon_mixin;
import glib.bytes;
import glib.error;
import gobject.object;

/**
    [gdk.texture.Texture] is the basic element used to refer to pixel data.
    
    It is primarily meant for pixel data that will not change over
    multiple frames, and will be used for a long time.
    
    There are various ways to create [gdk.texture.Texture] objects from a
    [gdkpixbuf.pixbuf.Pixbuf], or from bytes stored in memory, a file, or a
    [gio.resource.Resource].
    
    The ownership of the pixel data is transferred to the [gdk.texture.Texture]
    instance; you can only make a copy of it, via [gdk.texture.Texture.download].
    
    [gdk.texture.Texture] is an immutable object: That means you cannot change
    anything about it other than increasing the reference count via
    [gobject.object.ObjectWrap.ref_], and consequently, it is a thread-safe object.
*/
class Texture : gobject.object.ObjectWrap, gdk.paintable.Paintable, gio.icon.Icon, gio.loadable_icon.LoadableIcon
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
    return cast(void function())gdk_texture_get_type != &gidSymbolNotFound ? gdk_texture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Texture self()
  {
    return this;
  }

  mixin PaintableT!();
  mixin IconT!();
  mixin LoadableIconT!();

  /**
      Creates a new texture object representing the [gdkpixbuf.pixbuf.Pixbuf].
      
      This function is threadsafe, so that you can e.g. use GTask
      and [gio.task.Task.runInThread] to avoid blocking the main thread
      while loading a big image.
  
      Params:
        pixbuf = a [gdkpixbuf.pixbuf.Pixbuf]
      Returns: a new [gdk.texture.Texture]
  */
  static gdk.texture.Texture newForPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    GdkTexture* _cretval;
    _cretval = gdk_texture_new_for_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new texture by loading an image from memory,
      
      The file format is detected automatically. The supported formats
      are PNG, JPEG and TIFF, though more formats might be available.
      
      If null is returned, then error will be set.
      
      This function is threadsafe, so that you can e.g. use GTask
      and [gio.task.Task.runInThread] to avoid blocking the main thread
      while loading a big image.
  
      Params:
        bytes = a [glib.bytes.Bytes] containing the data to load
      Returns: A newly-created [gdk.texture.Texture]
      Throws: [ErrorWrap]
  */
  static gdk.texture.Texture newFromBytes(glib.bytes.Bytes bytes)
  {
    GdkTexture* _cretval;
    GError *_err;
    _cretval = gdk_texture_new_from_bytes(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new texture by loading an image from a file.
      
      The file format is detected automatically. The supported formats
      are PNG, JPEG and TIFF, though more formats might be available.
      
      If null is returned, then error will be set.
      
      This function is threadsafe, so that you can e.g. use GTask
      and [gio.task.Task.runInThread] to avoid blocking the main thread
      while loading a big image.
  
      Params:
        file = [gio.file.File] to load
      Returns: A newly-created [gdk.texture.Texture]
      Throws: [ErrorWrap]
  */
  static gdk.texture.Texture newFromFile(gio.file.File file)
  {
    GdkTexture* _cretval;
    GError *_err;
    _cretval = gdk_texture_new_from_file(file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new texture by loading an image from a file.
      
      The file format is detected automatically. The supported formats
      are PNG, JPEG and TIFF, though more formats might be available.
      
      If null is returned, then error will be set.
      
      This function is threadsafe, so that you can e.g. use GTask
      and [gio.task.Task.runInThread] to avoid blocking the main thread
      while loading a big image.
  
      Params:
        path = the filename to load
      Returns: A newly-created [gdk.texture.Texture]
      Throws: [ErrorWrap]
  */
  static gdk.texture.Texture newFromFilename(string path)
  {
    GdkTexture* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = gdk_texture_new_from_filename(_path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new texture by loading an image from a resource.
      
      The file format is detected automatically. The supported formats
      are PNG and JPEG, though more formats might be available.
      
      It is a fatal error if resource_path does not specify a valid
      image resource and the program will abort if that happens.
      If you are unsure about the validity of a resource, use
      [gdk.texture.Texture.newFromFile] to load it.
      
      This function is threadsafe, so that you can e.g. use GTask
      and [gio.task.Task.runInThread] to avoid blocking the main thread
      while loading a big image.
  
      Params:
        resourcePath = the path of the resource file
      Returns: A newly-created [gdk.texture.Texture]
  */
  static gdk.texture.Texture newFromResource(string resourcePath)
  {
    GdkTexture* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    _cretval = gdk_texture_new_from_resource(_resourcePath);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, Yes.Take);
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
  gdk.types.MemoryFormat getFormat()
  {
    GdkMemoryFormat _cretval;
    _cretval = gdk_texture_get_format(cast(GdkTexture*)this._cPtr);
    gdk.types.MemoryFormat _retval = cast(gdk.types.MemoryFormat)_cretval;
    return _retval;
  }

  /**
      Returns the height of the texture, in pixels.
      Returns: the height of the [gdk.texture.Texture]
  */
  int getHeight()
  {
    int _retval;
    _retval = gdk_texture_get_height(cast(GdkTexture*)this._cPtr);
    return _retval;
  }

  /**
      Returns the width of texture, in pixels.
      Returns: the width of the [gdk.texture.Texture]
  */
  int getWidth()
  {
    int _retval;
    _retval = gdk_texture_get_width(cast(GdkTexture*)this._cPtr);
    return _retval;
  }

  /**
      Store the given texture to the filename as a PNG file.
      
      This is a utility function intended for debugging and testing.
      If you want more control over formats, proper error handling or
      want to store to a [gio.file.File] or other location, you might want to
      use [gdk.texture.Texture.saveToPngBytes] or look into the
      gdk-pixbuf library.
  
      Params:
        filename = the filename to store to
      Returns: true if saving succeeded, false on failure.
  */
  bool saveToPng(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _retval = cast(bool)gdk_texture_save_to_png(cast(GdkTexture*)this._cPtr, _filename);
    return _retval;
  }

  /**
      Store the given texture in memory as a PNG file.
      
      Use [gdk.texture.Texture.newFromBytes] to read it back.
      
      If you want to serialize a texture, this is a convenient and
      portable way to do that.
      
      If you need more control over the generated image, such as
      attaching metadata, you should look into an image handling
      library such as the gdk-pixbuf library.
      
      If you are dealing with high dynamic range float data, you
      might also want to consider [gdk.texture.Texture.saveToTiffBytes]
      instead.
      Returns: a newly allocated [glib.bytes.Bytes] containing PNG data
  */
  glib.bytes.Bytes saveToPngBytes()
  {
    GBytes* _cretval;
    _cretval = gdk_texture_save_to_png_bytes(cast(GdkTexture*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Store the given texture to the filename as a TIFF file.
      
      GTK will attempt to store data without loss.
  
      Params:
        filename = the filename to store to
      Returns: true if saving succeeded, false on failure.
  */
  bool saveToTiff(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _retval = cast(bool)gdk_texture_save_to_tiff(cast(GdkTexture*)this._cPtr, _filename);
    return _retval;
  }

  /**
      Store the given texture in memory as a TIFF file.
      
      Use [gdk.texture.Texture.newFromBytes] to read it back.
      
      This function is intended to store a representation of the
      texture's data that is as accurate as possible. This is
      particularly relevant when working with high dynamic range
      images and floating-point texture data.
      
      If that is not your concern and you are interested in a
      smaller size and a more portable format, you might want to
      use [gdk.texture.Texture.saveToPngBytes].
      Returns: a newly allocated [glib.bytes.Bytes] containing TIFF data
  */
  glib.bytes.Bytes saveToTiffBytes()
  {
    GBytes* _cretval;
    _cretval = gdk_texture_save_to_tiff_bytes(cast(GdkTexture*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
