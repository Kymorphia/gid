/// Module for [FixedSizeListArray] class
module arrow.fixed_size_list_array;

public import gid.basictypes;
import arrow.array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class FixedSizeListArray : arrow.array.Array
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
    return cast(void function())garrow_fixed_size_list_array_get_type != &gidSymbolNotFound ? garrow_fixed_size_list_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowFixedSizeListArray";
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedSizeListArray self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.fixed_size_list_array.FixedSizeListArray]
      Returns: New builder object
  */
  static FixedSizeListArrayGidBuilder builder() nothrow
  {
    return new FixedSizeListArrayGidBuilder;
  }

  /** */
  @property arrow.array.Array rawValues() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.array.Array)("raw-values");
  }

  /** */
  this(arrow.data_type.DataType dataType, long length, arrow.array.Array values, arrow.buffer.Buffer nullBitmap, long nNulls) nothrow
  {
    GArrowFixedSizeListArray* _cretval;
    _cretval = garrow_fixed_size_list_array_new(dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, length, values ? cast(GArrowArray*)values._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  int getListSize() nothrow
  {
    int _retval;
    _retval = garrow_fixed_size_list_array_get_list_size(cast(GArrowFixedSizeListArray*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.array.Array getValue(long i) nothrow
  {
    GArrowArray* _cretval;
    _cretval = garrow_fixed_size_list_array_get_value(cast(GArrowFixedSizeListArray*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  int getValueLength(long i) nothrow
  {
    int _retval;
    _retval = garrow_fixed_size_list_array_get_value_length(cast(GArrowFixedSizeListArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  long getValueOffset(long i) nothrow
  {
    long _retval;
    _retval = garrow_fixed_size_list_array_get_value_offset(cast(GArrowFixedSizeListArray*)this._cPtr, i);
    return _retval;
  }

  alias getValueType = arrow.array.Array.getValueType;

  /** */
  arrow.data_type.DataType getValueType() nothrow
  {
    GArrowDataType* _cretval;
    _cretval = garrow_fixed_size_list_array_get_value_type(cast(GArrowFixedSizeListArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getValues() nothrow
  {
    GArrowArray* _cretval;
    _cretval = garrow_fixed_size_list_array_get_values(cast(GArrowFixedSizeListArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.fixed_size_list_array.FixedSizeListArray]
class FixedSizeListArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{

  /** */
  T rawValues(arrow.array.Array propval) nothrow
  {
    return setProperty("raw-values", propval);
  }
}

/// Fluent builder for [arrow.fixed_size_list_array.FixedSizeListArray]
final class FixedSizeListArrayGidBuilder : FixedSizeListArrayGidBuilderImpl!FixedSizeListArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedSizeListArray build() nothrow
  {
    return new FixedSizeListArray(cast(void*)createGObject(FixedSizeListArray._getGType), Yes.Take);
  }
}
