/// Module for [FeatherWriteProperties] class
module arrow.feather_write_properties;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class FeatherWriteProperties : gobject.object.ObjectWrap
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
    return cast(void function())garrow_feather_write_properties_get_type != &gidSymbolNotFound ? garrow_feather_write_properties_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FeatherWriteProperties self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.feather_write_properties.FeatherWriteProperties]
      Returns: New builder object
  */
  static FeatherWritePropertiesGidBuilder builder() nothrow
  {
    return new FeatherWritePropertiesGidBuilder;
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
  @property arrow.types.CompressionType compression() nothrow
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
  @property void compression(arrow.types.CompressionType propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.CompressionType)("compression", propval);
  }

  /** */
  this() nothrow
  {
    GArrowFeatherWriteProperties* _cretval;
    _cretval = garrow_feather_write_properties_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.feather_write_properties.FeatherWriteProperties]
class FeatherWritePropertiesGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

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
      Returns: Builder instance for fluent chaining
  */
  T compression(arrow.types.CompressionType propval) nothrow
  {
    return setProperty("compression", propval);
  }
}

/// Fluent builder for [arrow.feather_write_properties.FeatherWriteProperties]
final class FeatherWritePropertiesGidBuilder : FeatherWritePropertiesGidBuilderImpl!FeatherWritePropertiesGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FeatherWriteProperties build() nothrow
  {
    return new FeatherWriteProperties(cast(void*)createGObject(FeatherWriteProperties._getGType), Yes.Take);
  }
}
