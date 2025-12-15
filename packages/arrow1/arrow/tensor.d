/// Module for [Tensor] class
module arrow.tensor;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Tensor : gobject.object.ObjectWrap
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
    return cast(void function())garrow_tensor_get_type != &gidSymbolNotFound ? garrow_tensor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Tensor self()
  {
    return this;
  }

  /** */
  this(arrow.data_type.DataType dataType, arrow.buffer.Buffer data, long[] shape, long[] strides = null, string[] dimensionNames = null)
  {
    GArrowTensor* _cretval;
    size_t _nDimensions;
    if (shape)
      _nDimensions = cast(size_t)shape.length;

    auto _shape = cast(long*)shape.ptr;
    size_t _nStrides;
    if (strides)
      _nStrides = cast(size_t)strides.length;

    auto _strides = cast(long*)strides.ptr;
    size_t _nDimensionNames;
    if (dimensionNames)
      _nDimensionNames = cast(size_t)dimensionNames.length;

    char*[] _tmpdimensionNames;
    foreach (s; dimensionNames)
      _tmpdimensionNames ~= s.toCString(No.Alloc);
    char** _dimensionNames = _tmpdimensionNames.ptr;
    _cretval = garrow_tensor_new(dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, _shape, _nDimensions, _strides, _nStrides, _dimensionNames, _nDimensionNames);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.tensor.Tensor otherTensor)
  {
    bool _retval;
    _retval = cast(bool)garrow_tensor_equal(cast(GArrowTensor*)this._cPtr, otherTensor ? cast(GArrowTensor*)otherTensor._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_tensor_get_buffer(cast(GArrowTensor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string getDimensionName(int i)
  {
    const(char)* _cretval;
    _cretval = garrow_tensor_get_dimension_name(cast(GArrowTensor*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  int getNDimensions()
  {
    int _retval;
    _retval = garrow_tensor_get_n_dimensions(cast(GArrowTensor*)this._cPtr);
    return _retval;
  }

  /** */
  long[] getShape()
  {
    long* _cretval;
    int _cretlength;
    _cretval = garrow_tensor_get_shape(cast(GArrowTensor*)this._cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  long getSize()
  {
    long _retval;
    _retval = garrow_tensor_get_size(cast(GArrowTensor*)this._cPtr);
    return _retval;
  }

  /** */
  long[] getStrides()
  {
    long* _cretval;
    int _cretlength;
    _cretval = garrow_tensor_get_strides(cast(GArrowTensor*)this._cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  arrow.data_type.DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_tensor_get_value_data_type(cast(GArrowTensor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.types.Type getValueType()
  {
    GArrowType _cretval;
    _cretval = garrow_tensor_get_value_type(cast(GArrowTensor*)this._cPtr);
    arrow.types.Type _retval = cast(arrow.types.Type)_cretval;
    return _retval;
  }

  /** */
  bool isColumnMajor()
  {
    bool _retval;
    _retval = cast(bool)garrow_tensor_is_column_major(cast(GArrowTensor*)this._cPtr);
    return _retval;
  }

  /** */
  bool isContiguous()
  {
    bool _retval;
    _retval = cast(bool)garrow_tensor_is_contiguous(cast(GArrowTensor*)this._cPtr);
    return _retval;
  }

  /** */
  bool isMutable()
  {
    bool _retval;
    _retval = cast(bool)garrow_tensor_is_mutable(cast(GArrowTensor*)this._cPtr);
    return _retval;
  }

  /** */
  bool isRowMajor()
  {
    bool _retval;
    _retval = cast(bool)garrow_tensor_is_row_major(cast(GArrowTensor*)this._cPtr);
    return _retval;
  }
}
