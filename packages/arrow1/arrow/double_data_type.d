/// Module for [DoubleDataType] class
module arrow.double_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.floating_point_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class DoubleDataType : arrow.floating_point_data_type.FloatingPointDataType
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
    return cast(void function())garrow_double_data_type_get_type != &gidSymbolNotFound ? garrow_double_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DoubleDataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.double_data_type.DoubleDataType]
      Returns: New builder object
  */
  static DoubleDataTypeGidBuilder builder()
  {
    return new DoubleDataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowDoubleDataType* _cretval;
    _cretval = garrow_double_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.double_data_type.DoubleDataType]
class DoubleDataTypeGidBuilderImpl(T) : arrow.floating_point_data_type.FloatingPointDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.double_data_type.DoubleDataType]
final class DoubleDataTypeGidBuilder : DoubleDataTypeGidBuilderImpl!DoubleDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DoubleDataType build()
  {
    return new DoubleDataType(cast(void*)createGObject(DoubleDataType._getGType), Yes.Take);
  }
}
