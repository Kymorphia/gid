/// Module for [Decimal32DataType] class
module arrow.decimal32_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class Decimal32DataType : arrow.decimal_data_type.DecimalDataType
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
    return cast(void function())garrow_decimal32_data_type_get_type != &gidSymbolNotFound ? garrow_decimal32_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal32DataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.decimal32_data_type.Decimal32DataType]
      Returns: New builder object
  */
  static Decimal32DataTypeGidBuilder builder()
  {
    return new Decimal32DataTypeGidBuilder;
  }

  /** */
  this(int precision, int scale)
  {
    GArrowDecimal32DataType* _cretval;
    GError *_err;
    _cretval = garrow_decimal32_data_type_new(precision, scale, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static int maxPrecision()
  {
    int _retval;
    _retval = garrow_decimal32_data_type_max_precision();
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.decimal32_data_type.Decimal32DataType]
class Decimal32DataTypeGidBuilderImpl(T) : arrow.decimal_data_type.DecimalDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.decimal32_data_type.Decimal32DataType]
final class Decimal32DataTypeGidBuilder : Decimal32DataTypeGidBuilderImpl!Decimal32DataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Decimal32DataType build()
  {
    return new Decimal32DataType(cast(void*)createGObject(Decimal32DataType._getGType), Yes.Take);
  }
}
