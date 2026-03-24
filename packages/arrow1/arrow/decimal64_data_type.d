/// Module for [Decimal64DataType] class
module arrow.decimal64_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class Decimal64DataType : arrow.decimal_data_type.DecimalDataType
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
    return cast(void function())garrow_decimal64_data_type_get_type != &gidSymbolNotFound ? garrow_decimal64_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal64DataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.decimal64_data_type.Decimal64DataType]
  Returns: New builder object
  */
  static Decimal64DataTypeGidBuilder builder()
  {
    return new Decimal64DataTypeGidBuilder;
  }

  /** */
  this(int precision, int scale)
  {
    GArrowDecimal64DataType* _cretval;
    GError *_err;
    _cretval = garrow_decimal64_data_type_new(precision, scale, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static int maxPrecision()
  {
    int _retval;
    _retval = garrow_decimal64_data_type_max_precision();
    return _retval;
  }
}

class Decimal64DataTypeGidBuilderImpl(T) : arrow.decimal_data_type.DecimalDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.decimal64_data_type.Decimal64DataType]
final class Decimal64DataTypeGidBuilder : Decimal64DataTypeGidBuilderImpl!Decimal64DataTypeGidBuilder
{
  Decimal64DataType build()
  {
    return new Decimal64DataType(cast(void*)createGObject(Decimal64DataType._getGType), Yes.Take);
  }
}
