/// Module for [BinaryArrayBuilder] class
module arrow.binary_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.gid_builder;

/** */
class BinaryArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_binary_array_builder_get_type != &gidSymbolNotFound ? garrow_binary_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BinaryArrayBuilder self()
  {
    return this;
  }

  /**
      Get builder for [arrow.binary_array_builder.BinaryArrayBuilder]
      Returns: New builder object
  */
  static BinaryArrayBuilderGidBuilder builder()
  {
    return new BinaryArrayBuilderGidBuilder;
  }

  /** */
  this()
  {
    GArrowBinaryArrayBuilder* _cretval;
    _cretval = garrow_binary_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool append(ubyte[] value)
  {
    bool _retval;
    int _length;
    if (value)
      _length = cast(int)value.length;

    auto _value = value.ptr ? cast(const(ubyte)*)value.ptr : [ubyte.init].ptr;
    GError *_err;
    _retval = cast(bool)garrow_binary_array_builder_append(cast(GArrowBinaryArrayBuilder*)this._cPtr, _value, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue(ubyte[] value)
  {
    bool _retval;
    int _length;
    if (value)
      _length = cast(int)value.length;

    auto _value = value.ptr ? cast(const(ubyte)*)value.ptr : [ubyte.init].ptr;
    GError *_err;
    _retval = cast(bool)garrow_binary_array_builder_append_value(cast(GArrowBinaryArrayBuilder*)this._cPtr, _value, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValueBytes(glib.bytes.Bytes value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_binary_array_builder_append_value_bytes(cast(GArrowBinaryArrayBuilder*)this._cPtr, value ? cast(GBytes*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
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

    GBytes*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= cast(GBytes*)obj._cPtr;
    GBytes** _values = _tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = isValids.ptr ? cast(const(gboolean)*)isValids.ptr : [gboolean.init].ptr;
    GError *_err;
    _retval = cast(bool)garrow_binary_array_builder_append_values(cast(GArrowBinaryArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.binary_array_builder.BinaryArrayBuilder]
class BinaryArrayBuilderGidBuilderImpl(T) : arrow.array_builder.ArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.binary_array_builder.BinaryArrayBuilder]
final class BinaryArrayBuilderGidBuilder : BinaryArrayBuilderGidBuilderImpl!BinaryArrayBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BinaryArrayBuilder build()
  {
    return new BinaryArrayBuilder(cast(void*)createGObject(BinaryArrayBuilder._getGType), Yes.Take);
  }
}
