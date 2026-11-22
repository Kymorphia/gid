/// Module for [ZlibDecompressor] class
module gid.gio2.zlib_decompressor;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.converter;
import gid.gio2.converter_mixin;
import gid.gio2.file_info;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.zlib_decompressor.ZlibDecompressor] is an implementation of [gid.gio2.converter.Converter] that
    decompresses data compressed with zlib.
*/
class ZlibDecompressor : gid.gobject2.object.ObjectWrap, gid.gio2.converter.Converter
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
    return cast(void function())g_zlib_decompressor_get_type != &gidSymbolNotFound ? g_zlib_decompressor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GZlibDecompressor";
  }

  /** Returns `this`, for use in `with` statements. */
  override ZlibDecompressor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.zlib_decompressor.ZlibDecompressor]
      Returns: New builder object
  */
  static ZlibDecompressorGidBuilder builder() nothrow
  {
    return new ZlibDecompressorGidBuilder;
  }

  /**
      Get `fileInfo` property.
      Returns: A [gid.gio2.file_info.FileInfo] containing the information found in the gzip header
        of the data stream processed.
        
        This will be `NULL` if the header was not yet fully processed, is not
        present at all, or the compressor’s [gid.gio2.zlib_decompressor.ZlibDecompressor.format]
        property is not `enum@Gio.ZlibCompressorFormat.GZIP`.
  */
  @property gid.gio2.file_info.FileInfo fileInfo() nothrow
  {
    return getFileInfo();
  }

  /**
      Get `format` property.
      Returns: The format of the compressed data.
  */
  @property gid.gio2.types.ZlibCompressorFormat format() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.types.ZlibCompressorFormat)("format");
  }

  mixin ConverterT!();

  /**
      Creates a new decompressor.
  
      Params:
        format = the format to use for the compressed data
      Returns: a new [gid.gio2.zlib_decompressor.ZlibDecompressor]
  */
  this(gid.gio2.types.ZlibCompressorFormat format) nothrow
  {
    GZlibDecompressor* _cretval;
    _cretval = g_zlib_decompressor_new(format);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the [gid.gio2.zlib_decompressor.ZlibDecompressor.fileInfo] property.
      Returns: file info from the gzip header, if available
  */
  gid.gio2.file_info.FileInfo getFileInfo() nothrow
  {
    GFileInfo* _cretval;
    _cretval = g_zlib_decompressor_get_file_info(cast(GZlibDecompressor*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file_info.FileInfo)(cast(GFileInfo*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.zlib_decompressor.ZlibDecompressor]
class ZlibDecompressorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.converter.ConverterGidBuilderImpl!T
{

  mixin ConverterGidBuilderT!();

  /**
      Set `format` property.
      Params:
        propval = The format of the compressed data.
      Returns: Builder instance for fluent chaining
  */
  T format(gid.gio2.types.ZlibCompressorFormat propval) nothrow
  {
    return setProperty("format", propval);
  }
}

/// Fluent builder for [gid.gio2.zlib_decompressor.ZlibDecompressor]
final class ZlibDecompressorGidBuilder : ZlibDecompressorGidBuilderImpl!ZlibDecompressorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ZlibDecompressor build() nothrow
  {
    return new ZlibDecompressor(cast(void*)createGObject(ZlibDecompressor._getGType), Yes.Take);
  }
}
