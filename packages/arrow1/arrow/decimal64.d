/// Module for [Decimal64] class
module arrow.decimal64;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class Decimal64 : gobject.object.ObjectWrap
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
    return cast(void function())garrow_decimal64_get_type != &gidSymbolNotFound ? garrow_decimal64_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal64 self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.decimal64.Decimal64]
      Returns: New builder object
  */
  static Decimal64GidBuilder builder() nothrow
  {
    return new Decimal64GidBuilder;
  }

  /** */
  static arrow.decimal64.Decimal64 newInteger(long data) nothrow
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_new_integer(data);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.decimal64.Decimal64 newString(string data)
  {
    GArrowDecimal64* _cretval;
    const(char)* _data = data.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_decimal64_new_string(_data, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Computes the absolute value of the decimal destructively.
  */
  void abs() nothrow
  {
    garrow_decimal64_abs(cast(GArrowDecimal64*)this._cPtr);
  }

  /** */
  arrow.decimal64.Decimal64 copy() nothrow
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_copy(cast(GArrowDecimal64*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal64.Decimal64 divide(arrow.decimal64.Decimal64 right, out arrow.decimal64.Decimal64 remainder)
  {
    GArrowDecimal64* _cretval;
    GArrowDecimal64* _remainder;
    GError *_err;
    _cretval = garrow_decimal64_divide(cast(GArrowDecimal64*)this._cPtr, right ? cast(GArrowDecimal64*)right._cPtr(No.Dup) : null, &_remainder, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    remainder = new arrow.decimal64.Decimal64(cast(void*)_remainder, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.decimal64.Decimal64 otherDecimal) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal64_equal(cast(GArrowDecimal64*)this._cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool greaterThan(arrow.decimal64.Decimal64 otherDecimal) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal64_greater_than(cast(GArrowDecimal64*)this._cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool greaterThanOrEqual(arrow.decimal64.Decimal64 otherDecimal) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal64_greater_than_or_equal(cast(GArrowDecimal64*)this._cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThan(arrow.decimal64.Decimal64 otherDecimal) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal64_less_than(cast(GArrowDecimal64*)this._cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThanOrEqual(arrow.decimal64.Decimal64 otherDecimal) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal64_less_than_or_equal(cast(GArrowDecimal64*)this._cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.decimal64.Decimal64 minus(arrow.decimal64.Decimal64 right) nothrow
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_minus(cast(GArrowDecimal64*)this._cPtr, right ? cast(GArrowDecimal64*)right._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal64.Decimal64 multiply(arrow.decimal64.Decimal64 right) nothrow
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_multiply(cast(GArrowDecimal64*)this._cPtr, right ? cast(GArrowDecimal64*)right._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Negate the current value of the decimal destructively.
  */
  void negate() nothrow
  {
    garrow_decimal64_negate(cast(GArrowDecimal64*)this._cPtr);
  }

  /** */
  bool notEqual(arrow.decimal64.Decimal64 otherDecimal) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_decimal64_not_equal(cast(GArrowDecimal64*)this._cPtr, otherDecimal ? cast(GArrowDecimal64*)otherDecimal._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.decimal64.Decimal64 plus(arrow.decimal64.Decimal64 right) nothrow
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_plus(cast(GArrowDecimal64*)this._cPtr, right ? cast(GArrowDecimal64*)right._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.decimal64.Decimal64 rescale(int originalScale, int newScale)
  {
    GArrowDecimal64* _cretval;
    GError *_err;
    _cretval = garrow_decimal64_rescale(cast(GArrowDecimal64*)this._cPtr, originalScale, newScale, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  glib.bytes.Bytes toBytes() nothrow
  {
    GBytes* _cretval;
    _cretval = garrow_decimal64_to_bytes(cast(GArrowDecimal64*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  long toInteger() nothrow
  {
    long _retval;
    _retval = garrow_decimal64_to_integer(cast(GArrowDecimal64*)this._cPtr);
    return _retval;
  }

  /** */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = garrow_decimal64_to_string(cast(GArrowDecimal64*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string toStringScale(int scale) nothrow
  {
    char* _cretval;
    _cretval = garrow_decimal64_to_string_scale(cast(GArrowDecimal64*)this._cPtr, scale);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.decimal64.Decimal64]
class Decimal64GidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T decimal64(void* propval) nothrow
  {
    return setProperty("decimal64", propval);
  }
}

/// Fluent builder for [arrow.decimal64.Decimal64]
final class Decimal64GidBuilder : Decimal64GidBuilderImpl!Decimal64GidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Decimal64 build() nothrow
  {
    return new Decimal64(cast(void*)createGObject(Decimal64._getGType), No.Take);
  }
}
