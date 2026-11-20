/// Module for [DurationArrayBuilder] class
module arrow.duration_array_builder;

public import gid.basictypes;
import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.duration_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class DurationArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_duration_array_builder_get_type != &gidSymbolNotFound ? garrow_duration_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowDurationArrayBuilder";
  }

  /** Returns `this`, for use in `with` statements. */
  override DurationArrayBuilder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.duration_array_builder.DurationArrayBuilder]
      Returns: New builder object
  */
  static DurationArrayBuilderGidBuilder builder() nothrow
  {
    return new DurationArrayBuilderGidBuilder;
  }

  /** */
  this(arrow.duration_data_type.DurationDataType dataType) nothrow
  {
    GArrowDurationArrayBuilder* _cretval;
    _cretval = garrow_duration_array_builder_new(dataType ? cast(GArrowDurationDataType*)dataType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendValue(long value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_duration_array_builder_append_value(cast(GArrowDurationArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of the elapsed time in
            64-bit signed integer.
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

    auto _values = cast(long*)values.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids_arr = new gboolean[](isValids.length);
    auto _isValids = _isValids_arr.ptr;
    foreach (i, b; isValids) _isValids[i] = cast(gboolean)b;
    GError *_err;
    _retval = cast(bool)garrow_duration_array_builder_append_values(cast(GArrowDurationArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.duration_array_builder.DurationArrayBuilder]
class DurationArrayBuilderGidBuilderImpl(T) : arrow.array_builder.ArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.duration_array_builder.DurationArrayBuilder]
final class DurationArrayBuilderGidBuilder : DurationArrayBuilderGidBuilderImpl!DurationArrayBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DurationArrayBuilder build() nothrow
  {
    return new DurationArrayBuilder(cast(void*)createGObject(DurationArrayBuilder._getGType), Yes.Take);
  }
}
