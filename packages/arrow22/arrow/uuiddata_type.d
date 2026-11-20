/// Module for [UUIDDataType] class
module arrow.uuiddata_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.extension_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class UUIDDataType : arrow.extension_data_type.ExtensionDataType
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_uuid_data_type_get_type != &gidSymbolNotFound ? garrow_uuid_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowUUIDDataType";
  }

  /** Returns `this`, for use in `with` statements. */
  override UUIDDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.uuiddata_type.UUIDDataType]
      Returns: New builder object
  */
  static UUIDDataTypeGidBuilder builder() nothrow
  {
    return new UUIDDataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowUUIDDataType* _cretval;
    GError *_err;
    _cretval = garrow_uuid_data_type_new(&_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.uuiddata_type.UUIDDataType]
class UUIDDataTypeGidBuilderImpl(T) : arrow.extension_data_type.ExtensionDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uuiddata_type.UUIDDataType]
final class UUIDDataTypeGidBuilder : UUIDDataTypeGidBuilderImpl!UUIDDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UUIDDataType build() nothrow
  {
    return new UUIDDataType(cast(void*)createGObject(UUIDDataType._getGType), Yes.Take);
  }
}
