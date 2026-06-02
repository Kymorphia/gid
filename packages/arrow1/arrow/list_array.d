/// Module for [ListArray] class
module arrow.list_array;

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
class ListArray : arrow.array.Array
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_list_array_get_type != &gidSymbolNotFound ? garrow_list_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListArray self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.list_array.ListArray]
      Returns: New builder object
  */
  static ListArrayGidBuilder builder() nothrow
  {
    return new ListArrayGidBuilder;
  }

  /** */
  @property arrow.array.Array rawValues() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.array.Array)("raw-values");
  }

  /** */
  this(arrow.data_type.DataType dataType, long length, arrow.buffer.Buffer valueOffsets, arrow.array.Array values, arrow.buffer.Buffer nullBitmap, long nNulls) nothrow
  {
    GArrowListArray* _cretval;
    _cretval = garrow_list_array_new(dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, length, valueOffsets ? cast(GArrowBuffer*)valueOffsets._cPtr(No.Dup) : null, values ? cast(GArrowArray*)values._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.array.Array getValue(long i) nothrow
  {
    GArrowArray* _cretval;
    _cretval = garrow_list_array_get_value(cast(GArrowListArray*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  int getValueLength(long i) nothrow
  {
    int _retval;
    _retval = garrow_list_array_get_value_length(cast(GArrowListArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  int getValueOffset(long i) nothrow
  {
    int _retval;
    _retval = garrow_list_array_get_value_offset(cast(GArrowListArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  int[] getValueOffsets() nothrow
  {
    const(int)* _cretval;
    long _cretlength;
    _cretval = garrow_list_array_get_value_offsets(cast(GArrowListArray*)this._cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  alias getValueType = arrow.array.Array.getValueType;

  /** */
  arrow.data_type.DataType getValueType() nothrow
  {
    GArrowDataType* _cretval;
    _cretval = garrow_list_array_get_value_type(cast(GArrowListArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getValues() nothrow
  {
    GArrowArray* _cretval;
    _cretval = garrow_list_array_get_values(cast(GArrowListArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.list_array.ListArray]
class ListArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{

  /** */
  T rawValues(arrow.array.Array propval) nothrow
  {
    return setProperty("raw-values", propval);
  }
}

/// Fluent builder for [arrow.list_array.ListArray]
final class ListArrayGidBuilder : ListArrayGidBuilderImpl!ListArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListArray build() nothrow
  {
    return new ListArray(cast(void*)createGObject(ListArray._getGType), Yes.Take);
  }
}
