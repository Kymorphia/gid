/// Module for [BooleanDataType] class
module arrow.boolean_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class BooleanDataType : arrow.fixed_width_data_type.FixedWidthDataType
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
    return cast(void function())garrow_boolean_data_type_get_type != &gidSymbolNotFound ? garrow_boolean_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BooleanDataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.boolean_data_type.BooleanDataType]
      Returns: New builder object
  */
  static BooleanDataTypeGidBuilder builder()
  {
    return new BooleanDataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowBooleanDataType* _cretval;
    _cretval = garrow_boolean_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.boolean_data_type.BooleanDataType]
class BooleanDataTypeGidBuilderImpl(T) : arrow.fixed_width_data_type.FixedWidthDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.boolean_data_type.BooleanDataType]
final class BooleanDataTypeGidBuilder : BooleanDataTypeGidBuilderImpl!BooleanDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BooleanDataType build()
  {
    return new BooleanDataType(cast(void*)createGObject(BooleanDataType._getGType), Yes.Take);
  }
}
