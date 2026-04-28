/// Module for [BooleanArrayBuilder] class
module arrow.boolean_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class BooleanArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_boolean_array_builder_get_type != &gidSymbolNotFound ? garrow_boolean_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BooleanArrayBuilder self()
  {
    return this;
  }

  /**
      Get builder for [arrow.boolean_array_builder.BooleanArrayBuilder]
      Returns: New builder object
  */
  static BooleanArrayBuilderGidBuilder builder()
  {
    return new BooleanArrayBuilderGidBuilder;
  }

  /** */
  this()
  {
    GArrowBooleanArrayBuilder* _cretval;
    _cretval = garrow_boolean_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool append(bool value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_boolean_array_builder_append(cast(GArrowBooleanArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue(bool value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_boolean_array_builder_append_value(cast(GArrowBooleanArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of boolean.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth `is_valids` is true, the Nth `values` is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(bool[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = values.ptr ? cast(const(gboolean)*)values.ptr : [gboolean.init].ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = isValids.ptr ? cast(const(gboolean)*)isValids.ptr : [gboolean.init].ptr;
    GError *_err;
    _retval = cast(bool)garrow_boolean_array_builder_append_values(cast(GArrowBooleanArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.boolean_array_builder.BooleanArrayBuilder]
class BooleanArrayBuilderGidBuilderImpl(T) : arrow.array_builder.ArrayBuilderGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.boolean_array_builder.BooleanArrayBuilder]
final class BooleanArrayBuilderGidBuilder : BooleanArrayBuilderGidBuilderImpl!BooleanArrayBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BooleanArrayBuilder build()
  {
    return new BooleanArrayBuilder(cast(void*)createGObject(BooleanArrayBuilder._getGType), Yes.Take);
  }
}
