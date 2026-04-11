/// Module for [UInt8DataType] class
module arrow.uint8_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class UInt8DataType : arrow.integer_data_type.IntegerDataType
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
    return cast(void function())garrow_uint8_data_type_get_type != &gidSymbolNotFound ? garrow_uint8_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt8DataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.uint8_data_type.UInt8DataType]
      Returns: New builder object
  */
  static UInt8DataTypeGidBuilder builder()
  {
    return new UInt8DataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowUInt8DataType* _cretval;
    _cretval = garrow_uint8_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.uint8_data_type.UInt8DataType]
class UInt8DataTypeGidBuilderImpl(T) : arrow.integer_data_type.IntegerDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uint8_data_type.UInt8DataType]
final class UInt8DataTypeGidBuilder : UInt8DataTypeGidBuilderImpl!UInt8DataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UInt8DataType build()
  {
    return new UInt8DataType(cast(void*)createGObject(UInt8DataType._getGType), Yes.Take);
  }
}
