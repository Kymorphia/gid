/// Module for [UInt64DataType] class
module arrow.uint64_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class UInt64DataType : arrow.integer_data_type.IntegerDataType
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
    return cast(void function())garrow_uint64_data_type_get_type != &gidSymbolNotFound ? garrow_uint64_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt64DataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.uint64_data_type.UInt64DataType]
  Returns: New builder object
  */
  static UInt64DataTypeGidBuilder builder()
  {
    return new UInt64DataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowUInt64DataType* _cretval;
    _cretval = garrow_uint64_data_type_new();
    this(_cretval, Yes.Take);
  }
}

class UInt64DataTypeGidBuilderImpl(T) : arrow.integer_data_type.IntegerDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uint64_data_type.UInt64DataType]
final class UInt64DataTypeGidBuilder : UInt64DataTypeGidBuilderImpl!UInt64DataTypeGidBuilder
{
  UInt64DataType build()
  {
    return new UInt64DataType(cast(void*)createGObject(UInt64DataType._getGType), Yes.Take);
  }
}
