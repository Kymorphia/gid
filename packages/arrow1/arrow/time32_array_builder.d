/// Module for [Time32ArrayBuilder] class
module arrow.time32_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.time32_data_type;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class Time32ArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_time32_array_builder_get_type != &gidSymbolNotFound ? garrow_time32_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Time32ArrayBuilder self()
  {
    return this;
  }

  /** */
  this(arrow.time32_data_type.Time32DataType dataType)
  {
    GArrowTime32ArrayBuilder* _cretval;
    _cretval = garrow_time32_array_builder_new(dataType ? cast(GArrowTime32DataType*)dataType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  bool append(int value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_time32_array_builder_append(cast(GArrowTime32ArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue(int value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_time32_array_builder_append_value(cast(GArrowTime32ArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of
            the number of days since UNIX epoch in signed 32bit integer.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth `is_valids` is true, the Nth `values` is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(int[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = cast(const(int)*)values.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_time32_array_builder_append_values(cast(GArrowTime32ArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
