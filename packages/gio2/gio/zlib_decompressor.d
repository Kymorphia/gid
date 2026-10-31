/// Module for [ZlibDecompressor] class
module gio.zlib_decompressor;

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
    [gio.zlib_decompressor.ZlibDecompressor] is an implementation of [gio.converter.Converter] that
    decompresses data compressed with zlib.
*/
class ZlibDecompressor : gobject.object.ObjectWrap, gio.converter.Converter
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
    return cast(void function())g_zlib_decompressor_get_type != &gidSymbolNotFound ? g_zlib_decompressor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ZlibDecompressor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gio.zlib_decompressor.ZlibDecompressor]
      Returns: New builder object
  */
  static ZlibDecompressorGidBuilder builder() nothrow
  {
    return new ZlibDecompressorGidBuilder;
  }

  /**
      Get `fileInfo` property.
      Returns: A [gio.file_info.FileInfo] containing the information found in the gzip header
        of the data stream processed.
        
        This will be `NULL` if the header was not yet fully processed, is not
        present at all, or the compressor’s [gio.zlib_decompressor.ZlibDecompressor.format]
        property is not `enum@Gio.ZlibCompressorFormat.GZIP`.
  */
  @property gio.file_info.FileInfo fileInfo() nothrow
  {
    return getFileInfo();
  }

  /**
      Get `format` property.
      Returns: The format of the compressed data.
  */
  @property gio.types.ZlibCompressorFormat format() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gio.types.ZlibCompressorFormat)("format");
  }

  mixin ConverterT!();

  /**
      Creates a new decompressor.
  
      Params:
        format = the format to use for the compressed data
      Returns: a new [gio.zlib_decompressor.ZlibDecompressor]
  */
  this(gio.types.ZlibCompressorFormat format) nothrow
  {
    GZlibDecompressor* _cretval;
    _cretval = g_zlib_decompressor_new(format);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the [gio.zlib_decompressor.ZlibDecompressor.fileInfo] property.
      Returns: file info from the gzip header, if available
  */
  gio.file_info.FileInfo getFileInfo() nothrow
  {
    GFileInfo* _cretval;
    _cretval = g_zlib_decompressor_get_file_info(cast(GZlibDecompressor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gio.zlib_decompressor.ZlibDecompressor]
class ZlibDecompressorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gio.converter.ConverterGidBuilderImpl!T
{

  mixin ConverterGidBuilderT!();

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
}

/// Fluent builder for [gio.zlib_decompressor.ZlibDecompressor]
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
