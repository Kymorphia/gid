/// Module for [FloatDataType] class
module arrow.float_data_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.floating_point_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class FloatDataType : arrow.floating_point_data_type.FloatingPointDataType
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
    return cast(void function())garrow_float_data_type_get_type != &gidSymbolNotFound ? garrow_float_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FloatDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.float_data_type.FloatDataType]
      Returns: New builder object
  */
  static FloatDataTypeGidBuilder builder() nothrow
  {
    return new FloatDataTypeGidBuilder;
  }

  /** */
  this() nothrow
  {
    GArrowFloatDataType* _cretval;
    _cretval = garrow_float_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.float_data_type.FloatDataType]
class FloatDataTypeGidBuilderImpl(T) : arrow.floating_point_data_type.FloatingPointDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.float_data_type.FloatDataType]
final class FloatDataTypeGidBuilder : FloatDataTypeGidBuilderImpl!FloatDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FloatDataType build() nothrow
  {
    return new FloatDataType(cast(void*)createGObject(FloatDataType._getGType), Yes.Take);
  }
}
