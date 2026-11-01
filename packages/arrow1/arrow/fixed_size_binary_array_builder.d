/// Module for [FixedSizeBinaryArrayBuilder] class
module arrow.fixed_size_binary_array_builder;

public import gid.basictypes;
import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_size_binary_data_type;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.gid_builder;

/** */
class FixedSizeBinaryArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_fixed_size_binary_array_builder_get_type != &gidSymbolNotFound ? garrow_fixed_size_binary_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedSizeBinaryArrayBuilder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder]
      Returns: New builder object
  */
  static FixedSizeBinaryArrayBuilderGidBuilder builder() nothrow
  {
    return new FixedSizeBinaryArrayBuilderGidBuilder;
  }

  /** */
  this(arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType dataType) nothrow
  {
    GArrowFixedSizeBinaryArrayBuilder* _cretval;
    _cretval = garrow_fixed_size_binary_array_builder_new(dataType ? cast(GArrowFixedSizeBinaryDataType*)dataType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendValue(ubyte[] value = null)
  {
    bool _retval;
    int _length;
    if (value)
      _length = cast(int)value.length;

    auto _value = cast(ubyte*)value.ptr;
    GError *_err;
    _retval = cast(bool)garrow_fixed_size_binary_array_builder_append_value(cast(GArrowFixedSizeBinaryArrayBuilder*)this._cPtr, _value, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  bool appendValueBytes(glib.bytes.Bytes value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_fixed_size_binary_array_builder_append_value_bytes(cast(GArrowFixedSizeBinaryArrayBuilder*)this._cPtr, value ? cast(GBytes*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of #GBytes.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth is_valids is true, the Nth values is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(glib.bytes.Bytes[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values_arr = new GBytes*[](values.length);
    auto _values = _values_arr.ptr;
    foreach (i, obj; values) _values[i] = obj ? cast(GBytes*)obj._cPtr(No.Dup) : null;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids_arr = new gboolean[](isValids.length);
    auto _isValids = _isValids_arr.ptr;
    foreach (i, b; isValids) _isValids[i] = cast(gboolean)b;
    GError *_err;
    _retval = cast(bool)garrow_fixed_size_binary_array_builder_append_values(cast(GArrowFixedSizeBinaryArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
      
      This is more efficient than
      [arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder.appendValues].
  
      Params:
        values = A #GBytes that contains multiple values.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth is_valids is true, the Nth values is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValuesPacked(glib.bytes.Bytes values, bool[] isValids = null)
  {
    bool _retval;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids_arr = new gboolean[](isValids.length);
    auto _isValids = _isValids_arr.ptr;
    foreach (i, b; isValids) _isValids[i] = cast(gboolean)b;
    GError *_err;
    _retval = cast(bool)garrow_fixed_size_binary_array_builder_append_values_packed(cast(GArrowFixedSizeBinaryArrayBuilder*)this._cPtr, values ? cast(GBytes*)values._cPtr(No.Dup) : null, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder]
class FixedSizeBinaryArrayBuilderGidBuilderImpl(T) : arrow.array_builder.ArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder]
final class FixedSizeBinaryArrayBuilderGidBuilder : FixedSizeBinaryArrayBuilderGidBuilderImpl!FixedSizeBinaryArrayBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedSizeBinaryArrayBuilder build() nothrow
  {
    return new FixedSizeBinaryArrayBuilder(cast(void*)createGObject(FixedSizeBinaryArrayBuilder._getGType), Yes.Take);
  }
}
