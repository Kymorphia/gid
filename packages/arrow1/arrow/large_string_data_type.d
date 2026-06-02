/// Module for [LargeStringDataType] class
module arrow.large_string_data_type;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_large_string_data_type_get_type != &gidSymbolNotFound ? garrow_large_string_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeStringDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.large_string_data_type.LargeStringDataType]
      Returns: New builder object
  */
  static LargeStringDataTypeGidBuilder builder() nothrow
  {
    return new LargeStringDataTypeGidBuilder;
  }

  /** */
  this() nothrow
  {
    GArrowLargeStringDataType* _cretval;
    _cretval = garrow_large_string_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.large_string_data_type.LargeStringDataType]
class LargeStringDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.large_string_data_type.LargeStringDataType]
final class LargeStringDataTypeGidBuilder : LargeStringDataTypeGidBuilderImpl!LargeStringDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LargeStringDataType build() nothrow
  {
    return new LargeStringDataType(cast(void*)createGObject(LargeStringDataType._getGType), Yes.Take);
  }
}
