/// Module for [TimestampArrayBuilder] class
module arrow.timestamp_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.timestamp_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class TimestampArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_timestamp_array_builder_get_type != &gidSymbolNotFound ? garrow_timestamp_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimestampArrayBuilder self()
  {
    return this;
  }

  /**
      Get builder for [arrow.timestamp_array_builder.TimestampArrayBuilder]
      Returns: New builder object
  */
  static TimestampArrayBuilderGidBuilder builder()
  {
    return new TimestampArrayBuilderGidBuilder;
  }

  /** */
  this(arrow.timestamp_data_type.TimestampDataType dataType)
  {
    GArrowTimestampArrayBuilder* _cretval;
    _cretval = garrow_timestamp_array_builder_new(dataType ? cast(GArrowTimestampDataType*)dataType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  bool append(long value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_timestamp_array_builder_append(cast(GArrowTimestampArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue(long value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_timestamp_array_builder_append_value(cast(GArrowTimestampArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of
            the number of milliseconds since UNIX epoch in signed 64bit integer.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth `is_valids` is true, the Nth `values` is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(long[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = values.ptr ? cast(const(long)*)values.ptr : [long.init].ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = isValids.ptr ? cast(const(gboolean)*)isValids.ptr : [gboolean.init].ptr;
    GError *_err;
    _retval = cast(bool)garrow_timestamp_array_builder_append_values(cast(GArrowTimestampArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.timestamp_array_builder.TimestampArrayBuilder]
class TimestampArrayBuilderGidBuilderImpl(T) : arrow.array_builder.ArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.timestamp_array_builder.TimestampArrayBuilder]
final class TimestampArrayBuilderGidBuilder : TimestampArrayBuilderGidBuilderImpl!TimestampArrayBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TimestampArrayBuilder build()
  {
    return new TimestampArrayBuilder(cast(void*)createGObject(TimestampArrayBuilder._getGType), Yes.Take);
  }
}
