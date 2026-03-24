/// Module for [UInt32DataType] class
module arrow.uint32_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class UInt32DataType : arrow.integer_data_type.IntegerDataType
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
    return cast(void function())garrow_uint32_data_type_get_type != &gidSymbolNotFound ? garrow_uint32_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt32DataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.uint32_data_type.UInt32DataType]
  Returns: New builder object
  */
  static UInt32DataTypeGidBuilder builder()
  {
    return new UInt32DataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowUInt32DataType* _cretval;
    _cretval = garrow_uint32_data_type_new();
    this(_cretval, Yes.Take);
  }
}

class UInt32DataTypeGidBuilderImpl(T) : arrow.integer_data_type.IntegerDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uint32_data_type.UInt32DataType]
final class UInt32DataTypeGidBuilder : UInt32DataTypeGidBuilderImpl!UInt32DataTypeGidBuilder
{
  UInt32DataType build()
  {
    return new UInt32DataType(cast(void*)createGObject(UInt32DataType._getGType), Yes.Take);
  }
}
