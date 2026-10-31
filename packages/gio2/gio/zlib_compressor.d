/// Module for [ZlibCompressor] class
module gio.zlib_compressor;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.converter;
import gio.converter_mixin;
import gio.file_info;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.zlib_compressor.ZlibCompressor] is an implementation of [gio.converter.Converter] that
    compresses data using zlib.
*/
class ZlibCompressor : gobject.object.ObjectWrap, gio.converter.Converter
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_zlib_compressor_get_type != &gidSymbolNotFound ? g_zlib_compressor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ZlibCompressor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gio.zlib_compressor.ZlibCompressor]
      Returns: New builder object
  */
  static ZlibCompressorGidBuilder builder() nothrow
  {
    return new ZlibCompressorGidBuilder;
  }

  /**
      Get `fileInfo` property.
      Returns: A [gio.file_info.FileInfo] containing file information to put into the gzip
        header.
        
        The file name and modification time from the file info will be used.
        
        This will only be used if non-`NULL` and
        [gio.zlib_compressor.ZlibCompressor.format] is
        `enum@Gio.ZlibCompressorFormat.GZIP`.
  */
  @property gio.file_info.FileInfo fileInfo() nothrow
  {
    return getFileInfo();
  }

  /**
      Set `fileInfo` property.
      Params:
        propval = A [gio.file_info.FileInfo] containing file information to put into the gzip
          header.
          
          The file name and modification time from the file info will be used.
          
          This will only be used if non-`NULL` and
          [gio.zlib_compressor.ZlibCompressor.format] is
          `enum@Gio.ZlibCompressorFormat.GZIP`.
  */
  @property void fileInfo(gio.file_info.FileInfo propval) nothrow
  {
    setFileInfo(propval);
  }

  /**
      Get `format` property.
      Returns: The format of the compressed data.
  */
  @property gio.types.ZlibCompressorFormat format() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gio.types.ZlibCompressorFormat)("format");
  }

  /**
      Get `level` property.
      Returns: The level of compression from `0` (no compression) to `9` (most
        compression).
        
        `-1` for the default level.
  */
  @property int level() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("level");
  }

  /**
      Get `os` property.
      Returns: The OS code of the gzip header.
        
        This will be used if set to a non-negative value, and if
        [gio.zlib_compressor.ZlibCompressor.format] is
        `enum@Gio.ZlibCompressorFormat.GZIP`, the compressor will set the OS code of
        the gzip header to this value.
        
        If the value is unset, zlib will set the OS code depending on the platform.
        This may be undesirable when reproducible output is desired. In that case setting
        the OS code to `3` (for Unix) is recommended.
  */
  @property int os() nothrow
  {
    return getOs();
  }

  /**
      Set `os` property.
      Params:
        propval = The OS code of the gzip header.
          
          This will be used if set to a non-negative value, and if
          [gio.zlib_compressor.ZlibCompressor.format] is
          `enum@Gio.ZlibCompressorFormat.GZIP`, the compressor will set the OS code of
          the gzip header to this value.
          
          If the value is unset, zlib will set the OS code depending on the platform.
          This may be undesirable when reproducible output is desired. In that case setting
          the OS code to `3` (for Unix) is recommended.
  */
  @property void os(int propval) nothrow
  {
    setOs(propval);
  }

  mixin ConverterT!();

  /**
      Creates a compressor.
  
      Params:
        format = the format to use for the compressed data
        level = compression level (`0`-`9`), `-1` for default
      Returns: a new [gio.zlib_compressor.ZlibCompressor]
  */
  this(gio.types.ZlibCompressorFormat format, int level) nothrow
  {
    GZlibCompressor* _cretval;
    _cretval = g_zlib_compressor_new(format, level);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the [gio.zlib_compressor.ZlibCompressor.fileInfo] property.
      Returns: file info for the gzip header, if set
  */
  gio.file_info.FileInfo getFileInfo() nothrow
  {
    GFileInfo* _cretval;
    _cretval = g_zlib_compressor_get_file_info(cast(GZlibCompressor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gio.zlib_compressor.ZlibCompressor.os] property.
      Returns: the previously set OS value, or `-1` if unset
  */
  int getOs() nothrow
  {
    int _retval;
    _retval = g_zlib_compressor_get_os(cast(GZlibCompressor*)this._cPtr);
    return _retval;
  }

  /**
      Sets the [gio.zlib_compressor.ZlibCompressor.fileInfo] property.
      
      Note: it is an error to call this function while a compression is in
      progress; it may only be called immediately after creation of compressor,
      or after resetting it with [gio.converter.Converter.reset].
  
      Params:
        fileInfo = file info for the gzip header
  */
  void setFileInfo(gio.file_info.FileInfo fileInfo = null) nothrow
  {
    g_zlib_compressor_set_file_info(cast(GZlibCompressor*)this._cPtr, fileInfo ? cast(GFileInfo*)fileInfo._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gio.zlib_compressor.ZlibCompressor.os] property.
      
      Note: it is an error to call this function while a compression is in
      progress; it may only be called immediately after creation of compressor,
      or after resetting it with [gio.converter.Converter.reset].
  
      Params:
        os = the OS code to use, or `-1` to unset
  */
  void setOs(int os) nothrow
  {
    g_zlib_compressor_set_os(cast(GZlibCompressor*)this._cPtr, os);
  }
}

/// Fluent builder implementation template for [gio.zlib_compressor.ZlibCompressor]
class ZlibCompressorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.converter.ConverterGidBuilderImpl!T
{

  mixin ConverterGidBuilderT!();

  /**
      Set `fileInfo` property.
      Params:
        propval = A [gio.file_info.FileInfo] containing file information to put into the gzip
          header.
          
          The file name and modification time from the file info will be used.
          
          This will only be used if non-`NULL` and
          [gio.zlib_compressor.ZlibCompressor.format] is
          `enum@Gio.ZlibCompressorFormat.GZIP`.
      Returns: Builder instance for fluent chaining
  */
  T fileInfo(gio.file_info.FileInfo propval) nothrow
  {
    return setProperty("file-info", propval);
  }

  /**
      Set `format` property.
      Params:
        propval = The format of the compressed data.
      Returns: Builder instance for fluent chaining
  */
  T format(gio.types.ZlibCompressorFormat propval) nothrow
  {
    return setProperty("format", propval);
  }

  /**
      Set `level` property.
      Params:
        propval = The level of compression from `0` (no compression) to `9` (most
          compression).
          
          `-1` for the default level.
      Returns: Builder instance for fluent chaining
  */
  T level(int propval) nothrow
  {
    return setProperty("level", propval);
  }

  /**
      Set `os` property.
      Params:
        propval = The OS code of the gzip header.
          
          This will be used if set to a non-negative value, and if
          [gio.zlib_compressor.ZlibCompressor.format] is
          `enum@Gio.ZlibCompressorFormat.GZIP`, the compressor will set the OS code of
          the gzip header to this value.
          
          If the value is unset, zlib will set the OS code depending on the platform.
          This may be undesirable when reproducible output is desired. In that case setting
          the OS code to `3` (for Unix) is recommended.
      Returns: Builder instance for fluent chaining
  */
  T os(int propval) nothrow
  {
    return setProperty("os", propval);
  }
}

/// Fluent builder for [gio.zlib_compressor.ZlibCompressor]
final class ZlibCompressorGidBuilder : ZlibCompressorGidBuilderImpl!ZlibCompressorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ZlibCompressor build() nothrow
  {
    return new ZlibCompressor(cast(void*)createGObject(ZlibCompressor._getGType), Yes.Take);
  }
}
