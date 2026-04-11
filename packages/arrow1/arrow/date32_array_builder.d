/// Module for [Date32ArrayBuilder] class
module arrow.date32_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class Date32ArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_date32_array_builder_get_type != &gidSymbolNotFound ? garrow_date32_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Date32ArrayBuilder self()
  {
    return this;
  }

  /**
      Get builder for [arrow.date32_array_builder.Date32ArrayBuilder]
      Returns: New builder object
  */
  static Date32ArrayBuilderGidBuilder builder()
  {
    return new Date32ArrayBuilderGidBuilder;
  }

  /** */
  this()
  {
    GArrowDate32ArrayBuilder* _cretval;
    _cretval = garrow_date32_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool append(int value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_date32_array_builder_append(cast(GArrowDate32ArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue(int value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_date32_array_builder_append_value(cast(GArrowDate32ArrayBuilder*)this._cPtr, value, &_err);
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
    _retval = cast(bool)garrow_date32_array_builder_append_values(cast(GArrowDate32ArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.date32_array_builder.Date32ArrayBuilder]
class Date32ArrayBuilderGidBuilderImpl(T) : arrow.array_builder.ArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.date32_array_builder.Date32ArrayBuilder]
final class Date32ArrayBuilderGidBuilder : Date32ArrayBuilderGidBuilderImpl!Date32ArrayBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Date32ArrayBuilder build()
  {
    return new Date32ArrayBuilder(cast(void*)createGObject(Date32ArrayBuilder._getGType), Yes.Take);
  }
}
