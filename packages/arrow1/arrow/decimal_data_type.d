/// Module for [DecimalDataType] class
module arrow.decimal_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_size_binary_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class DecimalDataType : arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType
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
    return cast(void function())garrow_decimal_data_type_get_type != &gidSymbolNotFound ? garrow_decimal_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DecimalDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.decimal_data_type.DecimalDataType]
  Returns: New builder object
  */
  static DecimalDataTypeGidBuilder builder()
  {
    return new DecimalDataTypeGidBuilder;
  }

  /** */
  this(int precision, int scale)
  {
    GArrowDecimalDataType* _cretval;
    GError *_err;
    _cretval = garrow_decimal_data_type_new(precision, scale, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  int getPrecision()
  {
    int _retval;
    _retval = garrow_decimal_data_type_get_precision(cast(GArrowDecimalDataType*)this._cPtr);
    return _retval;
  }

  /** */
  int getScale()
  {
    int _retval;
    _retval = garrow_decimal_data_type_get_scale(cast(GArrowDecimalDataType*)this._cPtr);
    return _retval;
  }
}

class DecimalDataTypeGidBuilderImpl(T) : arrow.fixed_size_binary_data_type.FixedSizeBinaryDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.decimal_data_type.DecimalDataType]
final class DecimalDataTypeGidBuilder : DecimalDataTypeGidBuilderImpl!DecimalDataTypeGidBuilder
{
  DecimalDataType build()
  {
    return new DecimalDataType(cast(void*)createGObject(DecimalDataType._getGType), Yes.Take);
  }
}
