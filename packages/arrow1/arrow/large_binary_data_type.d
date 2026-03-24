/// Module for [LargeBinaryDataType] class
module arrow.large_binary_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class LargeBinaryDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_large_binary_data_type_get_type != &gidSymbolNotFound ? garrow_large_binary_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeBinaryDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.large_binary_data_type.LargeBinaryDataType]
  Returns: New builder object
  */
  static LargeBinaryDataTypeGidBuilder builder()
  {
    return new LargeBinaryDataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowLargeBinaryDataType* _cretval;
    _cretval = garrow_large_binary_data_type_new();
    this(_cretval, Yes.Take);
  }
}

class LargeBinaryDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.large_binary_data_type.LargeBinaryDataType]
final class LargeBinaryDataTypeGidBuilder : LargeBinaryDataTypeGidBuilderImpl!LargeBinaryDataTypeGidBuilder
{
  LargeBinaryDataType build()
  {
    return new LargeBinaryDataType(cast(void*)createGObject(LargeBinaryDataType._getGType), Yes.Take);
  }
}
