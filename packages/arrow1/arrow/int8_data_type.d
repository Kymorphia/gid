/// Module for [Int8DataType] class
module arrow.int8_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Int8DataType : arrow.integer_data_type.IntegerDataType
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
    return cast(void function())garrow_int8_data_type_get_type != &gidSymbolNotFound ? garrow_int8_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int8DataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.int8_data_type.Int8DataType]
  Returns: New builder object
  */
  static Int8DataTypeGidBuilder builder()
  {
    return new Int8DataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowInt8DataType* _cretval;
    _cretval = garrow_int8_data_type_new();
    this(_cretval, Yes.Take);
  }
}

class Int8DataTypeGidBuilderImpl(T) : arrow.integer_data_type.IntegerDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.int8_data_type.Int8DataType]
final class Int8DataTypeGidBuilder : Int8DataTypeGidBuilderImpl!Int8DataTypeGidBuilder
{
  Int8DataType build()
  {
    return new Int8DataType(cast(void*)createGObject(Int8DataType._getGType), Yes.Take);
  }
}
