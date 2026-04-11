/// Module for [HalfFloatDataType] class
module arrow.half_float_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.floating_point_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class HalfFloatDataType : arrow.floating_point_data_type.FloatingPointDataType
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
    return cast(void function())garrow_half_float_data_type_get_type != &gidSymbolNotFound ? garrow_half_float_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HalfFloatDataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.half_float_data_type.HalfFloatDataType]
      Returns: New builder object
  */
  static HalfFloatDataTypeGidBuilder builder()
  {
    return new HalfFloatDataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowHalfFloatDataType* _cretval;
    _cretval = garrow_half_float_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.half_float_data_type.HalfFloatDataType]
class HalfFloatDataTypeGidBuilderImpl(T) : arrow.floating_point_data_type.FloatingPointDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.half_float_data_type.HalfFloatDataType]
final class HalfFloatDataTypeGidBuilder : HalfFloatDataTypeGidBuilderImpl!HalfFloatDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HalfFloatDataType build()
  {
    return new HalfFloatDataType(cast(void*)createGObject(HalfFloatDataType._getGType), Yes.Take);
  }
}
