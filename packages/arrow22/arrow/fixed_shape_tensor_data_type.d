/// Module for [FixedShapeTensorDataType] class
module arrow.fixed_shape_tensor_data_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.extension_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class FixedShapeTensorDataType : arrow.extension_data_type.ExtensionDataType
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_fixed_shape_tensor_data_type_get_type != &gidSymbolNotFound ? garrow_fixed_shape_tensor_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowFixedShapeTensorDataType";
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedShapeTensorDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.fixed_shape_tensor_data_type.FixedShapeTensorDataType]
      Returns: New builder object
  */
  static FixedShapeTensorDataTypeGidBuilder builder() nothrow
  {
    return new FixedShapeTensorDataTypeGidBuilder;
  }

  /** */
  @property ulong nDimensions() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(ulong)("n-dimensions");
  }

  /** */
  this(arrow.data_type.DataType valueType, long[] shape, long[] permutation = null, string[] dimNames = null)
  {
    GArrowFixedShapeTensorDataType* _cretval;
    size_t _shapeLength;
    if (shape)
      _shapeLength = cast(size_t)shape.length;

    auto _shape = cast(long*)shape.ptr;
    size_t _permutationLength;
    if (permutation)
      _permutationLength = cast(size_t)permutation.length;

    auto _permutation = cast(long*)permutation.ptr;
    size_t _nDimNames;
    if (dimNames)
      _nDimNames = cast(size_t)dimNames.length;

    auto _dimNames_arr = new char*[](dimNames.length);
    auto _dimNames = cast(char**)_dimNames_arr.ptr;
    foreach (i, s; dimNames) _dimNames[i] = s.toCString!(No.Malloc);
    GError *_err;
    _cretval = garrow_fixed_shape_tensor_data_type_new(valueType ? cast(GArrowDataType*)valueType._cPtr(No.Dup) : null, _shape, _shapeLength, _permutation, _permutationLength, _dimNames, _nDimNames, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    this(_cretval, Yes.Take);
  }

  /** */
  string[] getDimNames() nothrow
  {
    char** _cretval;
    _cretval = garrow_fixed_shape_tensor_data_type_get_dim_names(cast(GArrowFixedShapeTensorDataType*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /** */
  long[] getPermutation() nothrow
  {
    const(long)* _cretval;
    size_t _cretlength;
    _cretval = garrow_fixed_shape_tensor_data_type_get_permutation(cast(GArrowFixedShapeTensorDataType*)this._cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /** */
  long[] getShape() nothrow
  {
    const(long)* _cretval;
    size_t _cretlength;
    _cretval = garrow_fixed_shape_tensor_data_type_get_shape(cast(GArrowFixedShapeTensorDataType*)this._cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /** */
  long[] getStrides() nothrow
  {
    const(long)* _cretval;
    size_t _cretlength;
    _cretval = garrow_fixed_shape_tensor_data_type_get_strides(cast(GArrowFixedShapeTensorDataType*)this._cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.fixed_shape_tensor_data_type.FixedShapeTensorDataType]
class FixedShapeTensorDataTypeGidBuilderImpl(T) : arrow.extension_data_type.ExtensionDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.fixed_shape_tensor_data_type.FixedShapeTensorDataType]
final class FixedShapeTensorDataTypeGidBuilder : FixedShapeTensorDataTypeGidBuilderImpl!FixedShapeTensorDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedShapeTensorDataType build() nothrow
  {
    return new FixedShapeTensorDataType(cast(void*)createGObject(FixedShapeTensorDataType._getGType), Yes.Take);
  }
}
