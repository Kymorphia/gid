/// Module for [ArrayBuilder] class
module arrow.array_builder;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class ArrayBuilder : gobject.object.ObjectWrap
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
    return cast(void function())garrow_array_builder_get_type != &gidSymbolNotFound ? garrow_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ArrayBuilder self()
  {
    return this;
  }

  /** */
  bool appendEmptyValue()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_array_builder_append_empty_value(cast(GArrowArrayBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple empty values at once. It's more efficient than multiple
      [arrow.array_builder.ArrayBuilder.appendEmptyValue] calls.
  
      Params:
        n = The number of null values to be appended.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendEmptyValues(long n)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_array_builder_append_empty_values(cast(GArrowArrayBuilder*)this._cPtr, n, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendNull()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_array_builder_append_null(cast(GArrowArrayBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple nulls at once. It's more efficient than multiple
      [arrow.array_builder.ArrayBuilder.appendNull] calls.
  
      Params:
        n = The number of null values to be appended.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendNulls(long n)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_array_builder_append_nulls(cast(GArrowArrayBuilder*)this._cPtr, n, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.array.Array finish()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_builder_finish(cast(GArrowArrayBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getCapacity()
  {
    long _retval;
    _retval = garrow_array_builder_get_capacity(cast(GArrowArrayBuilder*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getChild(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_array_builder_get_child(cast(GArrowArrayBuilder*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder[] getChildren()
  {
    GList* _cretval;
    _cretval = garrow_array_builder_get_children(cast(GArrowArrayBuilder*)this._cPtr);
    auto _retval = gListToD!(arrow.array_builder.ArrayBuilder, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  long getLength()
  {
    long _retval;
    _retval = garrow_array_builder_get_length(cast(GArrowArrayBuilder*)this._cPtr);
    return _retval;
  }

  /** */
  long getNNulls()
  {
    long _retval;
    _retval = garrow_array_builder_get_n_nulls(cast(GArrowArrayBuilder*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_array_builder_get_value_data_type(cast(GArrowArrayBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.types.Type getValueType()
  {
    GArrowType _cretval;
    _cretval = garrow_array_builder_get_value_type(cast(GArrowArrayBuilder*)this._cPtr);
    arrow.types.Type _retval = cast(arrow.types.Type)_cretval;
    return _retval;
  }

  /** */
  bool reserve(long additionalCapacity)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_array_builder_reserve(cast(GArrowArrayBuilder*)this._cPtr, additionalCapacity, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  void reset()
  {
    garrow_array_builder_reset(cast(GArrowArrayBuilder*)this._cPtr);
  }

  /** */
  bool resize(long capacity)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_array_builder_resize(cast(GArrowArrayBuilder*)this._cPtr, capacity, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
