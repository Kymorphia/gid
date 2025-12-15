/// Module for [BooleanArray] class
module arrow.boolean_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.primitive_array;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class BooleanArray : arrow.primitive_array.PrimitiveArray
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
    return cast(void function())garrow_boolean_array_get_type != &gidSymbolNotFound ? garrow_boolean_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BooleanArray self()
  {
    return this;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowBooleanArray* _cretval;
    _cretval = garrow_boolean_array_new(length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.boolean_array.BooleanArray and(arrow.boolean_array.BooleanArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_and(cast(GArrowBooleanArray*)this._cPtr, right ? cast(GArrowBooleanArray*)right._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool getValue(long i)
  {
    bool _retval;
    _retval = cast(bool)garrow_boolean_array_get_value(cast(GArrowBooleanArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  bool[] getValues()
  {
    gboolean* _cretval;
    long _cretlength;
    _cretval = garrow_boolean_array_get_values(cast(GArrowBooleanArray*)this._cPtr, &_cretlength);
    bool[] _retval;

    if (_cretval)
    {
      _retval = new bool[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = cast(bool)_cretval[i];
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  arrow.boolean_array.BooleanArray invert()
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_invert(cast(GArrowBooleanArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.boolean_array.BooleanArray or(arrow.boolean_array.BooleanArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_or(cast(GArrowBooleanArray*)this._cPtr, right ? cast(GArrowBooleanArray*)right._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.boolean_array.BooleanArray xor(arrow.boolean_array.BooleanArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_xor(cast(GArrowBooleanArray*)this._cPtr, right ? cast(GArrowBooleanArray*)right._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }
}
