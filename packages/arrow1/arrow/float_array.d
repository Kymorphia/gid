/// Module for [FloatArray] class
module arrow.float_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class FloatArray : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_float_array_get_type != &gidSymbolNotFound ? garrow_float_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FloatArray self()
  {
    return this;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowFloatArray* _cretval;
    _cretval = garrow_float_array_new(length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  float getValue(long i)
  {
    float _retval;
    _retval = garrow_float_array_get_value(cast(GArrowFloatArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  float[] getValues()
  {
    const(float)* _cretval;
    long _cretlength;
    _cretval = garrow_float_array_get_values(cast(GArrowFloatArray*)this._cPtr, &_cretlength);
    float[] _retval;

    if (_cretval)
    {
      _retval = cast(float[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /** */
  double sum()
  {
    double _retval;
    GError *_err;
    _retval = garrow_float_array_sum(cast(GArrowFloatArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
