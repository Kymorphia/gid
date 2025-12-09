/// Module for [Int8Array] class
module arrow.int8_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class Int8Array : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_int8_array_get_type != &gidSymbolNotFound ? garrow_int8_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int8Array self()
  {
    return this;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowInt8Array* _cretval;
    _cretval = garrow_int8_array_new(length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  byte getValue(long i)
  {
    byte _retval;
    _retval = garrow_int8_array_get_value(cast(GArrowInt8Array*)this._cPtr, i);
    return _retval;
  }

  /** */
  byte[] getValues()
  {
    const(byte)* _cretval;
    long _cretlength;
    _cretval = garrow_int8_array_get_values(cast(GArrowInt8Array*)this._cPtr, &_cretlength);
    byte[] _retval;

    if (_cretval)
    {
      _retval = cast(byte[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /** */
  long sum()
  {
    long _retval;
    GError *_err;
    _retval = garrow_int8_array_sum(cast(GArrowInt8Array*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
