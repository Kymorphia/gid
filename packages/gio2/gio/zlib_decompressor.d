/// Module for [ZlibDecompressor] class
module gio.zlib_decompressor;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.converter;
import gio.converter_mixin;
import gio.file_info;
import gio.types;
import gobject.object;

/**
    [gio.zlib_decompressor.ZlibDecompressor] is an implementation of [gio.converter.Converter] that
    decompresses data compressed with zlib.
*/
class ZlibDecompressor : gobject.object.ObjectWrap, gio.converter.Converter
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
    return cast(void function())g_zlib_decompressor_get_type != &gidSymbolNotFound ? g_zlib_decompressor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ZlibDecompressor self()
  {
    return this;
  }

  /**
      Get `fileInfo` property.
      Returns: A #GFileInfo containing the information found in the GZIP header
        of the data stream processed, or null if the header was not yet
        fully processed, is not present at all, or the compressor's
        #GZlibDecompressor:format property is not [gio.types.ZlibCompressorFormat.Gzip].
  */
  @property gio.file_info.FileInfo fileInfo()
  {
    return getFileInfo();
  }

  mixin ConverterT!();

  /**
      Creates a new #GZlibDecompressor.
  
      Params:
        format = The format to use for the compressed data
      Returns: a new #GZlibDecompressor
  */
  this(gio.types.ZlibCompressorFormat format)
  {
    GZlibDecompressor* _cretval;
    _cretval = g_zlib_decompressor_new(format);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the #GFileInfo constructed from the GZIP header data
      of compressed data processed by compressor, or null if decompressor's
      #GZlibDecompressor:format property is not [gio.types.ZlibCompressorFormat.Gzip],
      or the header data was not fully processed yet, or it not present in the
      data stream at all.
      Returns: a #GFileInfo, or null
  */
  gio.file_info.FileInfo getFileInfo()
  {
    GFileInfo* _cretval;
    _cretval = g_zlib_decompressor_get_file_info(cast(GZlibDecompressor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, No.Take);
    return _retval;
  }
}
