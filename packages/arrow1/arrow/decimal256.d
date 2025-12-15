/// Module for [Decimal256] class
module arrow.decimal256;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

/** */
class Decimal256 : gobject.object.ObjectWrap
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
    return cast(void function())garrow_decimal256_get_type != &gidSymbolNotFound ? garrow_decimal256_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal256 self()
  {
    return this;
  }

  /** */
  static arrow.decimal256.Decimal256 newInteger(long data)
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_new_integer(data);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.decimal256.Decimal256 newString(string data)
  {
    GArrowDecimal256* _cretval;
    const(char)* _data = data.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_decimal256_new_string(_data, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Computes the absolute value of the decimal destructively.
  */
  void abs()
  {
    garrow_decimal256_abs(cast(GArrowDecimal256*)this._cPtr);
  }

  /** */
  arrow.decimal256.Decimal256 copy()
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_copy(cast(GArrowDecimal256*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal256.Decimal256 divide(arrow.decimal256.Decimal256 right, out arrow.decimal256.Decimal256 remainder)
  {
    GArrowDecimal256* _cretval;
    GArrowDecimal256* _remainder;
    GError *_err;
    _cretval = garrow_decimal256_divide(cast(GArrowDecimal256*)this._cPtr, right ? cast(GArrowDecimal256*)right._cPtr(No.Dup) : null, &_remainder, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, Yes.Take);
    remainder = new arrow.decimal256.Decimal256(cast(void*)_remainder, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.decimal256.Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal256_equal(cast(GArrowDecimal256*)this._cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool greaterThan(arrow.decimal256.Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal256_greater_than(cast(GArrowDecimal256*)this._cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool greaterThanOrEqual(arrow.decimal256.Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal256_greater_than_or_equal(cast(GArrowDecimal256*)this._cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThan(arrow.decimal256.Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal256_less_than(cast(GArrowDecimal256*)this._cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThanOrEqual(arrow.decimal256.Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal256_less_than_or_equal(cast(GArrowDecimal256*)this._cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.decimal256.Decimal256 multiply(arrow.decimal256.Decimal256 right)
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_multiply(cast(GArrowDecimal256*)this._cPtr, right ? cast(GArrowDecimal256*)right._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Negate the current value of the decimal destructively.
  */
  void negate()
  {
    garrow_decimal256_negate(cast(GArrowDecimal256*)this._cPtr);
  }

  /** */
  bool notEqual(arrow.decimal256.Decimal256 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal256_not_equal(cast(GArrowDecimal256*)this._cPtr, otherDecimal ? cast(GArrowDecimal256*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.decimal256.Decimal256 plus(arrow.decimal256.Decimal256 right)
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_plus(cast(GArrowDecimal256*)this._cPtr, right ? cast(GArrowDecimal256*)right._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal256.Decimal256 rescale(int originalScale, int newScale)
  {
    GArrowDecimal256* _cretval;
    GError *_err;
    _cretval = garrow_decimal256_rescale(cast(GArrowDecimal256*)this._cPtr, originalScale, newScale, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  glib.bytes.Bytes toBytes()
  {
    GBytes* _cretval;
    _cretval = garrow_decimal256_to_bytes(cast(GArrowDecimal256*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_decimal256_to_string(cast(GArrowDecimal256*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string toStringScale(int scale)
  {
    char* _cretval;
    _cretval = garrow_decimal256_to_string_scale(cast(GArrowDecimal256*)this._cPtr, scale);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
