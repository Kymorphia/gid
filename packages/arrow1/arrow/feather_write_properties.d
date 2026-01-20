/// Module for [FeatherWriteProperties] class
module arrow.feather_write_properties;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class FeatherWriteProperties : gobject.object.ObjectWrap
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
    return cast(void function())garrow_feather_write_properties_get_type != &gidSymbolNotFound ? garrow_feather_write_properties_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FeatherWriteProperties self()
  {
    return this;
  }

  /**
      Get `compression` property.
      Returns: Compression type to use. Only
        [arrow.types.CompressionType.Uncompressed],
        [arrow.types.CompressionType.Lz4] and [arrow.types.CompressionType.Zstd]
        are supported. The default compression is
        [arrow.types.CompressionType.Lz4] if Apache Arrow C++ is built with
        support for it, otherwise [arrow.types.CompressionType.Uncompressed].
        [arrow.types.CompressionType.Uncompressed] is set as the object
        default here.
  */
  @property arrow.types.CompressionType compression()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.CompressionType)("compression");
  }

  /**
      Set `compression` property.
      Params:
        propval = Compression type to use. Only
          [arrow.types.CompressionType.Uncompressed],
          [arrow.types.CompressionType.Lz4] and [arrow.types.CompressionType.Zstd]
          are supported. The default compression is
          [arrow.types.CompressionType.Lz4] if Apache Arrow C++ is built with
          support for it, otherwise [arrow.types.CompressionType.Uncompressed].
          [arrow.types.CompressionType.Uncompressed] is set as the object
          default here.
  */
  @property void compression(arrow.types.CompressionType propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.CompressionType)("compression", propval);
  }

  /** */
  this()
  {
    GArrowFeatherWriteProperties* _cretval;
    _cretval = garrow_feather_write_properties_new();
    this(_cretval, Yes.Take);
  }
}
