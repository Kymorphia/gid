/// Module for [UInt32ArrayBuilder] class
module arrow.uint32_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class UInt32ArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_uint32_array_builder_get_type != &gidSymbolNotFound ? garrow_uint32_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt32ArrayBuilder self()
  {
    return this;
  }

  /**
      Get builder for [arrow.uint32_array_builder.UInt32ArrayBuilder]
      Returns: New builder object
  */
  static UInt32ArrayBuilderGidBuilder builder()
  {
    return new UInt32ArrayBuilderGidBuilder;
  }

  /** */
  this()
  {
    GArrowUInt32ArrayBuilder* _cretval;
    _cretval = garrow_uint32_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool append(uint value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_uint32_array_builder_append(cast(GArrowUInt32ArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue(uint value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_uint32_array_builder_append_value(cast(GArrowUInt32ArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of uint32.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth `is_valids` is true, the Nth `values` is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(uint[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = values.ptr ? cast(const(uint)*)values.ptr : [uint.init].ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = isValids.ptr ? cast(const(gboolean)*)isValids.ptr : [gboolean.init].ptr;
    GError *_err;
    _retval = cast(bool)garrow_uint32_array_builder_append_values(cast(GArrowUInt32ArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.uint32_array_builder.UInt32ArrayBuilder]
class UInt32ArrayBuilderGidBuilderImpl(T) : arrow.array_builder.ArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uint32_array_builder.UInt32ArrayBuilder]
final class UInt32ArrayBuilderGidBuilder : UInt32ArrayBuilderGidBuilderImpl!UInt32ArrayBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UInt32ArrayBuilder build()
  {
    return new UInt32ArrayBuilder(cast(void*)createGObject(UInt32ArrayBuilder._getGType), Yes.Take);
  }
}
