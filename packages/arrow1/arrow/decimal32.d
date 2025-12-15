/// Module for [Decimal32] class
module arrow.decimal32;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

/** */
class Decimal32 : gobject.object.ObjectWrap
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
    return cast(void function())garrow_decimal32_get_type != &gidSymbolNotFound ? garrow_decimal32_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal32 self()
  {
    return this;
  }

  /** */
  static arrow.decimal32.Decimal32 newInteger(long data)
  {
    GArrowDecimal32* _cretval;
    _cretval = garrow_decimal32_new_integer(data);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal32.Decimal32)(cast(GArrowDecimal32*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.decimal32.Decimal32 newString(string data)
  {
    GArrowDecimal32* _cretval;
    const(char)* _data = data.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_decimal32_new_string(_data, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal32.Decimal32)(cast(GArrowDecimal32*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Computes the absolute value of the decimal destructively.
  */
  void abs()
  {
    garrow_decimal32_abs(cast(GArrowDecimal32*)this._cPtr);
  }

  /** */
  arrow.decimal32.Decimal32 copy()
  {
    GArrowDecimal32* _cretval;
    _cretval = garrow_decimal32_copy(cast(GArrowDecimal32*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal32.Decimal32)(cast(GArrowDecimal32*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal32.Decimal32 divide(arrow.decimal32.Decimal32 right, out arrow.decimal32.Decimal32 remainder)
  {
    GArrowDecimal32* _cretval;
    GArrowDecimal32* _remainder;
    GError *_err;
    _cretval = garrow_decimal32_divide(cast(GArrowDecimal32*)this._cPtr, right ? cast(GArrowDecimal32*)right._cPtr(No.Dup) : null, &_remainder, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal32.Decimal32)(cast(GArrowDecimal32*)_cretval, Yes.Take);
    remainder = new arrow.decimal32.Decimal32(cast(void*)_remainder, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.decimal32.Decimal32 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal32_equal(cast(GArrowDecimal32*)this._cPtr, otherDecimal ? cast(GArrowDecimal32*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool greaterThan(arrow.decimal32.Decimal32 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal32_greater_than(cast(GArrowDecimal32*)this._cPtr, otherDecimal ? cast(GArrowDecimal32*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool greaterThanOrEqual(arrow.decimal32.Decimal32 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal32_greater_than_or_equal(cast(GArrowDecimal32*)this._cPtr, otherDecimal ? cast(GArrowDecimal32*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThan(arrow.decimal32.Decimal32 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal32_less_than(cast(GArrowDecimal32*)this._cPtr, otherDecimal ? cast(GArrowDecimal32*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThanOrEqual(arrow.decimal32.Decimal32 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal32_less_than_or_equal(cast(GArrowDecimal32*)this._cPtr, otherDecimal ? cast(GArrowDecimal32*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.decimal32.Decimal32 minus(arrow.decimal32.Decimal32 right)
  {
    GArrowDecimal32* _cretval;
    _cretval = garrow_decimal32_minus(cast(GArrowDecimal32*)this._cPtr, right ? cast(GArrowDecimal32*)right._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal32.Decimal32)(cast(GArrowDecimal32*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal32.Decimal32 multiply(arrow.decimal32.Decimal32 right)
  {
    GArrowDecimal32* _cretval;
    _cretval = garrow_decimal32_multiply(cast(GArrowDecimal32*)this._cPtr, right ? cast(GArrowDecimal32*)right._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal32.Decimal32)(cast(GArrowDecimal32*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Negate the current value of the decimal destructively.
  */
  void negate()
  {
    garrow_decimal32_negate(cast(GArrowDecimal32*)this._cPtr);
  }

  /** */
  bool notEqual(arrow.decimal32.Decimal32 otherDecimal)
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal32_not_equal(cast(GArrowDecimal32*)this._cPtr, otherDecimal ? cast(GArrowDecimal32*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.decimal32.Decimal32 plus(arrow.decimal32.Decimal32 right)
  {
    GArrowDecimal32* _cretval;
    _cretval = garrow_decimal32_plus(cast(GArrowDecimal32*)this._cPtr, right ? cast(GArrowDecimal32*)right._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal32.Decimal32)(cast(GArrowDecimal32*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal32.Decimal32 rescale(int originalScale, int newScale)
  {
    GArrowDecimal32* _cretval;
    GError *_err;
    _cretval = garrow_decimal32_rescale(cast(GArrowDecimal32*)this._cPtr, originalScale, newScale, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal32.Decimal32)(cast(GArrowDecimal32*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  glib.bytes.Bytes toBytes()
  {
    GBytes* _cretval;
    _cretval = garrow_decimal32_to_bytes(cast(GArrowDecimal32*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  long toInteger()
  {
    long _retval;
    _retval = garrow_decimal32_to_integer(cast(GArrowDecimal32*)this._cPtr);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_decimal32_to_string(cast(GArrowDecimal32*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string toStringScale(int scale)
  {
    char* _cretval;
    _cretval = garrow_decimal32_to_string_scale(cast(GArrowDecimal32*)this._cPtr, scale);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
