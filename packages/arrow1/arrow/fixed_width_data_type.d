/// Module for [FixedWidthDataType] class
module arrow.fixed_width_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class FixedWidthDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_fixed_width_data_type_get_type != &gidSymbolNotFound ? garrow_fixed_width_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedWidthDataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.fixed_width_data_type.FixedWidthDataType]
      Returns: New builder object
  */
  static FixedWidthDataTypeGidBuilder builder()
  {
    return new FixedWidthDataTypeGidBuilder;
  }

  /** */
  int getBitWidth()
  {
    int _retval;
    _retval = garrow_fixed_width_data_type_get_bit_width(cast(GArrowFixedWidthDataType*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.fixed_width_data_type.FixedWidthDataType]
class FixedWidthDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.fixed_width_data_type.FixedWidthDataType]
final class FixedWidthDataTypeGidBuilder : FixedWidthDataTypeGidBuilderImpl!FixedWidthDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedWidthDataType build()
  {
    return new FixedWidthDataType(cast(void*)createGObject(FixedWidthDataType._getGType), No.Take);
  }
}
