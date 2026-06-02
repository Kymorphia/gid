/// Module for [Int16DataType] class
module arrow.int16_data_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Int16DataType : arrow.integer_data_type.IntegerDataType
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
    return cast(void function())garrow_int16_data_type_get_type != &gidSymbolNotFound ? garrow_int16_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int16DataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.int16_data_type.Int16DataType]
      Returns: New builder object
  */
  static Int16DataTypeGidBuilder builder() nothrow
  {
    return new Int16DataTypeGidBuilder;
  }

  /** */
  this() nothrow
  {
    GArrowInt16DataType* _cretval;
    _cretval = garrow_int16_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.int16_data_type.Int16DataType]
class Int16DataTypeGidBuilderImpl(T) : arrow.integer_data_type.IntegerDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.int16_data_type.Int16DataType]
final class Int16DataTypeGidBuilder : Int16DataTypeGidBuilderImpl!Int16DataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Int16DataType build() nothrow
  {
    return new Int16DataType(cast(void*)createGObject(Int16DataType._getGType), Yes.Take);
  }
}
