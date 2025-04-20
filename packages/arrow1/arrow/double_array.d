/// Module for [DoubleArray] class
module arrow.double_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class DoubleArray : arrow.numeric_array.NumericArray
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_double_array_get_type != &gidSymbolNotFound ? garrow_double_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DoubleArray self()
  {
    return this;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowDoubleArray* _cretval;
    _cretval = garrow_double_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  double getValue(long i)
  {
    double _retval;
    _retval = garrow_double_array_get_value(cast(GArrowDoubleArray*)cPtr, i);
    return _retval;
  }

  /** */
  double[] getValues()
  {
    const(double)* _cretval;
    long _cretlength;
    _cretval = garrow_double_array_get_values(cast(GArrowDoubleArray*)cPtr, &_cretlength);
    double[] _retval;

    if (_cretval)
    {
      _retval = cast(double[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /** */
  double sum()
  {
    double _retval;
    GError *_err;
    _retval = garrow_double_array_sum(cast(GArrowDoubleArray*)cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
