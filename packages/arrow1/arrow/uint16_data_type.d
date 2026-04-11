/// Module for [UInt16DataType] class
module arrow.uint16_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class UInt16DataType : arrow.integer_data_type.IntegerDataType
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
    return cast(void function())garrow_uint16_data_type_get_type != &gidSymbolNotFound ? garrow_uint16_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt16DataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.uint16_data_type.UInt16DataType]
      Returns: New builder object
  */
  static UInt16DataTypeGidBuilder builder()
  {
    return new UInt16DataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowUInt16DataType* _cretval;
    _cretval = garrow_uint16_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.uint16_data_type.UInt16DataType]
class UInt16DataTypeGidBuilderImpl(T) : arrow.integer_data_type.IntegerDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uint16_data_type.UInt16DataType]
final class UInt16DataTypeGidBuilder : UInt16DataTypeGidBuilderImpl!UInt16DataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UInt16DataType build()
  {
    return new UInt16DataType(cast(void*)createGObject(UInt16DataType._getGType), Yes.Take);
  }
}
