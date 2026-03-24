/// Module for [NumericDataType] class
module arrow.numeric_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class NumericDataType : arrow.fixed_width_data_type.FixedWidthDataType
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
    return cast(void function())garrow_numeric_data_type_get_type != &gidSymbolNotFound ? garrow_numeric_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NumericDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.numeric_data_type.NumericDataType]
  Returns: New builder object
  */
  static NumericDataTypeGidBuilder builder()
  {
    return new NumericDataTypeGidBuilder;
  }
}

class NumericDataTypeGidBuilderImpl(T) : arrow.fixed_width_data_type.FixedWidthDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.numeric_data_type.NumericDataType]
final class NumericDataTypeGidBuilder : NumericDataTypeGidBuilderImpl!NumericDataTypeGidBuilder
{
  NumericDataType build()
  {
    return new NumericDataType(cast(void*)createGObject(NumericDataType._getGType), No.Take);
  }
}
