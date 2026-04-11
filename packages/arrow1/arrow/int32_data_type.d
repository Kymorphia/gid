/// Module for [Int32DataType] class
module arrow.int32_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Int32DataType : arrow.integer_data_type.IntegerDataType
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
    return cast(void function())garrow_int32_data_type_get_type != &gidSymbolNotFound ? garrow_int32_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int32DataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.int32_data_type.Int32DataType]
      Returns: New builder object
  */
  static Int32DataTypeGidBuilder builder()
  {
    return new Int32DataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowInt32DataType* _cretval;
    _cretval = garrow_int32_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.int32_data_type.Int32DataType]
class Int32DataTypeGidBuilderImpl(T) : arrow.integer_data_type.IntegerDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.int32_data_type.Int32DataType]
final class Int32DataTypeGidBuilder : Int32DataTypeGidBuilderImpl!Int32DataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Int32DataType build()
  {
    return new Int32DataType(cast(void*)createGObject(Int32DataType._getGType), Yes.Take);
  }
}
