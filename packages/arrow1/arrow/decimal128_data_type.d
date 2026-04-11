/// Module for [Decimal128DataType] class
module arrow.decimal128_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class Decimal128DataType : arrow.decimal_data_type.DecimalDataType
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
    return cast(void function())garrow_decimal128_data_type_get_type != &gidSymbolNotFound ? garrow_decimal128_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal128DataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.decimal128_data_type.Decimal128DataType]
      Returns: New builder object
  */
  static Decimal128DataTypeGidBuilder builder()
  {
    return new Decimal128DataTypeGidBuilder;
  }

  /** */
  this(int precision, int scale)
  {
    GArrowDecimal128DataType* _cretval;
    GError *_err;
    _cretval = garrow_decimal128_data_type_new(precision, scale, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static int maxPrecision()
  {
    int _retval;
    _retval = garrow_decimal128_data_type_max_precision();
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.decimal128_data_type.Decimal128DataType]
class Decimal128DataTypeGidBuilderImpl(T) : arrow.decimal_data_type.DecimalDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.decimal128_data_type.Decimal128DataType]
final class Decimal128DataTypeGidBuilder : Decimal128DataTypeGidBuilderImpl!Decimal128DataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Decimal128DataType build()
  {
    return new Decimal128DataType(cast(void*)createGObject(Decimal128DataType._getGType), Yes.Take);
  }
}
