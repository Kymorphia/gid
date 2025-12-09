/// Module for [Int16Array] class
module arrow.int16_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class Int16Array : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_int16_array_get_type != &gidSymbolNotFound ? garrow_int16_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int16Array self()
  {
    return this;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowInt16Array* _cretval;
    _cretval = garrow_int16_array_new(length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  short getValue(long i)
  {
    short _retval;
    _retval = garrow_int16_array_get_value(cast(GArrowInt16Array*)this._cPtr, i);
    return _retval;
  }

  /** */
  short[] getValues()
  {
    const(short)* _cretval;
    long _cretlength;
    _cretval = garrow_int16_array_get_values(cast(GArrowInt16Array*)this._cPtr, &_cretlength);
    short[] _retval;

    if (_cretval)
    {
      _retval = cast(short[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /** */
  long sum()
  {
    long _retval;
    GError *_err;
    _retval = garrow_int16_array_sum(cast(GArrowInt16Array*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
