/// Module for [Decimal64Array] class
module arrow.decimal64_array;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal64;
import arrow.fixed_size_binary_array;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Decimal64Array : arrow.fixed_size_binary_array.FixedSizeBinaryArray
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
    return cast(void function())garrow_decimal64_array_get_type != &gidSymbolNotFound ? garrow_decimal64_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal64Array self()
  {
    return this;
  }

  /**
      Get builder for [arrow.decimal64_array.Decimal64Array]
      Returns: New builder object
  */
  static Decimal64ArrayGidBuilder builder()
  {
    return new Decimal64ArrayGidBuilder;
  }

  /** */
  string formatValue(long i)
  {
    char* _cretval;
    _cretval = garrow_decimal64_array_format_value(cast(GArrowDecimal64Array*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  alias getValue = arrow.fixed_size_binary_array.FixedSizeBinaryArray.getValue;

  /** */
  arrow.decimal64.Decimal64 getValue(long i)
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_array_get_value(cast(GArrowDecimal64Array*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal64.Decimal64)(cast(GArrowDecimal64*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.decimal64_array.Decimal64Array]
class Decimal64ArrayGidBuilderImpl(T) : arrow.fixed_size_binary_array.FixedSizeBinaryArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.decimal64_array.Decimal64Array]
final class Decimal64ArrayGidBuilder : Decimal64ArrayGidBuilderImpl!Decimal64ArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Decimal64Array build()
  {
    return new Decimal64Array(cast(void*)createGObject(Decimal64Array._getGType), No.Take);
  }
}
