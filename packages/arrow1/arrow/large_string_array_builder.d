/// Module for [LargeStringArrayBuilder] class
module arrow.large_string_array_builder;

import arrow.c.functions;
import arrow.c.types;
import arrow.large_binary_array_builder;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class LargeStringArrayBuilder : arrow.large_binary_array_builder.LargeBinaryArrayBuilder
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
    return cast(void function())garrow_large_string_array_builder_get_type != &gidSymbolNotFound ? garrow_large_string_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeStringArrayBuilder self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowLargeStringArrayBuilder* _cretval;
    _cretval = garrow_large_string_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendString(string value)
  {
    bool _retval;
    const(char)* _value = value.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)garrow_large_string_array_builder_append_string(cast(GArrowLargeStringArrayBuilder*)this._cPtr, _value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendStringLen(string value, long length)
  {
    bool _retval;
    const(char)* _value = value.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)garrow_large_string_array_builder_append_string_len(cast(GArrowLargeStringArrayBuilder*)this._cPtr, _value, length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of strings.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth is_valids is true, the Nth values is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendStrings(string[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    char*[] _tmpvalues;
    foreach (s; values)
      _tmpvalues ~= s.toCString(No.Alloc);
    const(char*)* _values = _tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_large_string_array_builder_append_strings(cast(GArrowLargeStringArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
