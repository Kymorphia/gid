/// Module for [NullDataType] class
module arrow.null_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class NullDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_null_data_type_get_type != &gidSymbolNotFound ? garrow_null_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NullDataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.null_data_type.NullDataType]
      Returns: New builder object
  */
  static NullDataTypeGidBuilder builder()
  {
    return new NullDataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowNullDataType* _cretval;
    _cretval = garrow_null_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.null_data_type.NullDataType]
class NullDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.null_data_type.NullDataType]
final class NullDataTypeGidBuilder : NullDataTypeGidBuilderImpl!NullDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NullDataType build()
  {
    return new NullDataType(cast(void*)createGObject(NullDataType._getGType), Yes.Take);
  }
}
