/// Module for [Date64ArrayBuilder] class
module arrow.date64_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class Date64ArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_date64_array_builder_get_type != &gidSymbolNotFound ? garrow_date64_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Date64ArrayBuilder self()
  {
    return this;
  }

  /**
  Get builder for [arrow.date64_array_builder.Date64ArrayBuilder]
  Returns: New builder object
  */
  static Date64ArrayBuilderGidBuilder builder()
  {
    return new Date64ArrayBuilderGidBuilder;
  }

  /** */
  this()
  {
    GArrowDate64ArrayBuilder* _cretval;
    _cretval = garrow_date64_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool append(long value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_date64_array_builder_append(cast(GArrowDate64ArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue(long value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_date64_array_builder_append_value(cast(GArrowDate64ArrayBuilder*)this._cPtr, value, &_err);
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

    auto _values = cast(const(long)*)values.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_date64_array_builder_append_values(cast(GArrowDate64ArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}

class Date64ArrayBuilderGidBuilderImpl(T) : arrow.array_builder.ArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.date64_array_builder.Date64ArrayBuilder]
final class Date64ArrayBuilderGidBuilder : Date64ArrayBuilderGidBuilderImpl!Date64ArrayBuilderGidBuilder
{
  Date64ArrayBuilder build()
  {
    return new Date64ArrayBuilder(cast(void*)createGObject(Date64ArrayBuilder._getGType), Yes.Take);
  }
}
