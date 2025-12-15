/// Module for [Scalar] class
module arrow.scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.cast_options;
import arrow.data_type;
import arrow.equal_options;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Scalar : gobject.object.ObjectWrap
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
    return cast(void function())garrow_scalar_get_type != &gidSymbolNotFound ? garrow_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Scalar self()
  {
    return this;
  }

  /** */
  static arrow.scalar.Scalar parse(arrow.data_type.DataType dataType, ubyte[] data)
  {
    GArrowScalar* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _cretval = garrow_scalar_parse(dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, _data, _size, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.scalar.Scalar)(cast(GArrowScalar*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.scalar.Scalar cast_(arrow.data_type.DataType dataType, arrow.cast_options.CastOptions options = null)
  {
    GArrowScalar* _cretval;
    GError *_err;
    _cretval = garrow_scalar_cast(cast(GArrowScalar*)this._cPtr, dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, options ? cast(GArrowCastOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.scalar.Scalar)(cast(GArrowScalar*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.scalar.Scalar otherScalar)
  {
    bool _retval;
    _retval = cast(bool)garrow_scalar_equal(cast(GArrowScalar*)this._cPtr, otherScalar ? cast(GArrowScalar*)otherScalar._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalOptions(arrow.scalar.Scalar otherScalar, arrow.equal_options.EqualOptions options = null)
  {
    bool _retval;
    _retval = cast(bool)garrow_scalar_equal_options(cast(GArrowScalar*)this._cPtr, otherScalar ? cast(GArrowScalar*)otherScalar._cPtr(No.Dup) : null, options ? cast(GArrowEqualOptions*)options._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_scalar_get_data_type(cast(GArrowScalar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool isValid()
  {
    bool _retval;
    _retval = cast(bool)garrow_scalar_is_valid(cast(GArrowScalar*)this._cPtr);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_scalar_to_string(cast(GArrowScalar*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
