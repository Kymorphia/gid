/// Module for [TextureDownloader] class
module gid.gdk4.texture_downloader;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.color_state;
import gid.gdk4.texture;
import gid.gdk4.types;
import gid.glib2.bytes;
import gid.gobject2.boxed;
import gid.gobject2.object;

/**
    Used to download the contents of a [gid.gdk4.texture.Texture].
    
    It is intended to be created as a short-term object for a single download,
    but can be used for multiple downloads of different textures or with different
    settings.
    
    [gid.gdk4.texture_downloader.TextureDownloader] can be used to convert data between different formats.
    Create a [gid.gdk4.texture.Texture] for the existing format and then download it in a
    different format.
*/
class TextureDownloader : gid.gobject2.boxed.BoxedWrap!(gdk_texture_downloader_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override TextureDownloader self() nothrow
  {
    return this;
  }

  /**
      Creates a new texture downloader for texture.
      
      By default, the downloader will convert the data to
      the default memory format, and to the sRGB color state.
  
      Params:
        texture = texture to download
      Returns: A new texture downloader
  */
  this(gid.gdk4.texture.Texture texture) nothrow
  {
    GdkTextureDownloader* _cretval;
    _cretval = gdk_texture_downloader_new(texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a copy of the downloader.
      
      This function is meant for language bindings.
      Returns: A copy of the downloader
  */
  gid.gdk4.texture_downloader.TextureDownloader copy() nothrow
  {
    GdkTextureDownloader* _cretval;
    _cretval = gdk_texture_downloader_copy(cast(const(GdkTextureDownloader)*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.texture_downloader.TextureDownloader(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Downloads the given texture pixels into a [gid.glib2.bytes.Bytes]. The rowstride will
      be stored in the stride value.
      
      This function will abort if it tries to download a large texture and
      fails to allocate memory. If you think that may happen, you should handle
      memory allocation yourself and use [gid.gdk4.texture_downloader.TextureDownloader.downloadInto]
      once allocation succeeded.
      
      This function cannot be used with a multiplanar format. Use
      [gid.gdk4.texture_downloader.TextureDownloader.downloadBytesWithPlanes] for that purpose.
  
      Params:
        outStride = The stride of the resulting data in bytes
      Returns: The downloaded pixels
  */
  gid.glib2.bytes.Bytes downloadBytes(out size_t outStride) nothrow
  {
    GBytes* _cretval;
    _cretval = gdk_texture_downloader_download_bytes(cast(const(GdkTextureDownloader)*)this._cPtr, cast(size_t*)&outStride);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Downloads the given texture pixels into a [gid.glib2.bytes.Bytes]. The offsets and
      strides of the resulting buffer will be stored in the respective values.
      
      If the format does have less than 4 planes, the remaining offsets and strides will be
      set to `0`.
  
      Params:
        outOffsets = The offsets of the resulting data planes in bytes
        outStrides = The stride of the resulting data planes in bytes
      Returns: The downloaded pixels
  */
  gid.glib2.bytes.Bytes downloadBytesWithPlanes(out size_t[] outOffsets, out size_t[] outStrides) nothrow
  {
    GBytes* _cretval;
    outOffsets.length = 4;
    outStrides.length = 4;
    _cretval = gdk_texture_downloader_download_bytes_with_planes(cast(const(GdkTextureDownloader)*)this._cPtr, outOffsets.ptr, outStrides.ptr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the color state that the data will be downloaded in.
      Returns: The color state of the download
  */
  gid.gdk4.color_state.ColorState getColorState() nothrow
  {
    GdkColorState* _cretval;
    _cretval = gdk_texture_downloader_get_color_state(cast(const(GdkTextureDownloader)*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.color_state.ColorState(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the format that the data will be downloaded in.
      Returns: The format of the download
  */
  gid.gdk4.types.MemoryFormat getFormat() nothrow
  {
    GdkMemoryFormat _cretval;
    _cretval = gdk_texture_downloader_get_format(cast(const(GdkTextureDownloader)*)this._cPtr);
    gid.gdk4.types.MemoryFormat _retval = cast(gid.gdk4.types.MemoryFormat)_cretval;
    return _retval;
  }

  /**
      Gets the texture that the downloader will download.
      Returns: The texture to download
  */
  gid.gdk4.texture.Texture getTexture() nothrow
  {
    GdkTexture* _cretval;
    _cretval = gdk_texture_downloader_get_texture(cast(const(GdkTextureDownloader)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the color state the downloader will convert the data to.
      
      By default, the sRGB colorstate returned by [gid.gdk4.color_state.ColorState.getSrgb]
      is used.
  
      Params:
        colorState = the color state to use
  */
  void setColorState(gid.gdk4.color_state.ColorState colorState) nothrow
  {
    gdk_texture_downloader_set_color_state(cast(GdkTextureDownloader*)this._cPtr, colorState ? cast(GdkColorState*)colorState._cPtr(No.Dup) : null);
  }

  /**
      Sets the format the downloader will download.
      
      By default, GDK_MEMORY_DEFAULT is set.
  
      Params:
        format = the format to use
  */
  void setFormat(gid.gdk4.types.MemoryFormat format) nothrow
  {
    gdk_texture_downloader_set_format(cast(GdkTextureDownloader*)this._cPtr, format);
  }

  /**
      Changes the texture the downloader will download.
  
      Params:
        texture = the new texture to download
  */
  void setTexture(gid.gdk4.texture.Texture texture) nothrow
  {
    gdk_texture_downloader_set_texture(cast(GdkTextureDownloader*)this._cPtr, texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null);
  }
}
