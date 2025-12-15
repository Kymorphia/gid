/// Module for [MapArrayBuilder] class
module arrow.map_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.map_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class MapArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_map_array_builder_get_type != &gidSymbolNotFound ? garrow_map_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MapArrayBuilder self()
  {
    return this;
  }

  /** */
  this(arrow.map_data_type.MapDataType dataType)
  {
    GArrowMapArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_map_array_builder_new(dataType ? cast(GArrowMapDataType*)dataType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendValue()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_map_array_builder_append_value(cast(GArrowMapArrayBuilder*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        offsets = The array of signed int.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth `is_valids` is true, the Nth `values` is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(int[] offsets, bool[] isValids = null)
  {
    bool _retval;
    long _offsetsLength;
    if (offsets)
      _offsetsLength = cast(long)offsets.length;

    auto _offsets = cast(const(int)*)offsets.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_map_array_builder_append_values(cast(GArrowMapArrayBuilder*)this._cPtr, _offsets, _offsetsLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getItemBuilder()
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_map_array_builder_get_item_builder(cast(GArrowMapArrayBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getKeyBuilder()
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_map_array_builder_get_key_builder(cast(GArrowMapArrayBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getValueBuilder()
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_map_array_builder_get_value_builder(cast(GArrowMapArrayBuilder*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }
}
