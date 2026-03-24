/// Module for [IntegerDataType] class
module arrow.integer_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class IntegerDataType : arrow.numeric_data_type.NumericDataType
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
    return cast(void function())garrow_integer_data_type_get_type != &gidSymbolNotFound ? garrow_integer_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IntegerDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.integer_data_type.IntegerDataType]
  Returns: New builder object
  */
  static IntegerDataTypeGidBuilder builder()
  {
    return new IntegerDataTypeGidBuilder;
  }

  /** */
  bool isSigned()
  {
    bool _retval;
    _retval = cast(bool)garrow_integer_data_type_is_signed(cast(GArrowIntegerDataType*)this._cPtr);
    return _retval;
  }
}

class IntegerDataTypeGidBuilderImpl(T) : arrow.numeric_data_type.NumericDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.integer_data_type.IntegerDataType]
final class IntegerDataTypeGidBuilder : IntegerDataTypeGidBuilderImpl!IntegerDataTypeGidBuilder
{
  IntegerDataType build()
  {
    return new IntegerDataType(cast(void*)createGObject(IntegerDataType._getGType), No.Take);
  }
}
