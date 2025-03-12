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

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_boolean_array_get_type != &gidSymbolNotFound ? garrow_boolean_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override BooleanArray self()
  {
    return this;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowBooleanArray* _cretval;
    _cretval = garrow_boolean_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.boolean_array.BooleanArray and(arrow.boolean_array.BooleanArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_and(cast(GArrowBooleanArray*)cPtr, right ? cast(GArrowBooleanArray*)right.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool getValue(long i)
  {
    bool _retval;
    _retval = garrow_boolean_array_get_value(cast(GArrowBooleanArray*)cPtr, i);
    return _retval;
  }

  /** */
  bool[] getValues()
  {
    bool* _cretval;
    long _cretlength;
    _cretval = garrow_boolean_array_get_values(cast(GArrowBooleanArray*)cPtr, &_cretlength);
    bool[] _retval;

    if (_cretval)
    {
      _retval = cast(bool[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /** */
  arrow.boolean_array.BooleanArray invert()
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_invert(cast(GArrowBooleanArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.boolean_array.BooleanArray or(arrow.boolean_array.BooleanArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_or(cast(GArrowBooleanArray*)cPtr, right ? cast(GArrowBooleanArray*)right.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.boolean_array.BooleanArray xor(arrow.boolean_array.BooleanArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_boolean_array_xor(cast(GArrowBooleanArray*)cPtr, right ? cast(GArrowBooleanArray*)right.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }
}
