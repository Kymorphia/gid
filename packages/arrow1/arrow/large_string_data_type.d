/// Module for [LargeStringDataType] class
module arrow.large_string_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class LargeStringDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_large_string_data_type_get_type != &gidSymbolNotFound ? garrow_large_string_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeStringDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.large_string_data_type.LargeStringDataType]
  Returns: New builder object
  */
  static LargeStringDataTypeGidBuilder builder()
  {
    return new LargeStringDataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowLargeStringDataType* _cretval;
    _cretval = garrow_large_string_data_type_new();
    this(_cretval, Yes.Take);
  }
}

class LargeStringDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.large_string_data_type.LargeStringDataType]
final class LargeStringDataTypeGidBuilder : LargeStringDataTypeGidBuilderImpl!LargeStringDataTypeGidBuilder
{
  LargeStringDataType build()
  {
    return new LargeStringDataType(cast(void*)createGObject(LargeStringDataType._getGType), Yes.Take);
  }
}
