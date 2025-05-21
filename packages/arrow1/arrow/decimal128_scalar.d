/// Module for [Decimal128Scalar] class
module arrow.decimal128_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal128;
import arrow.decimal128_data_type;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Decimal128Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_decimal128_scalar_get_type != &gidSymbolNotFound ? garrow_decimal128_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal128Scalar self()
  {
    return this;
  }

  /** */
  this(arrow.decimal128_data_type.Decimal128DataType dataType, arrow.decimal128.Decimal128 value)
  {
    GArrowDecimal128Scalar* _cretval;
    _cretval = garrow_decimal128_scalar_new(dataType ? cast(GArrowDecimal128DataType*)dataType._cPtr(No.Dup) : null, value ? cast(GArrowDecimal128*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.decimal128.Decimal128 getValue()
  {
    GArrowDecimal128* _cretval;
    _cretval = garrow_decimal128_scalar_get_value(cast(GArrowDecimal128Scalar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal128.Decimal128)(cast(GArrowDecimal128*)_cretval, No.Take);
    return _retval;
  }
}
