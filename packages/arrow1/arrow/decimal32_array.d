/// Module for [Decimal32Array] class
module arrow.decimal32_array;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal32;
import arrow.fixed_size_binary_array;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Decimal32Array : arrow.fixed_size_binary_array.FixedSizeBinaryArray
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
    return cast(void function())garrow_decimal32_array_get_type != &gidSymbolNotFound ? garrow_decimal32_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal32Array self()
  {
    return this;
  }

  /**
      Get builder for [arrow.decimal32_array.Decimal32Array]
      Returns: New builder object
  */
  static Decimal32ArrayGidBuilder builder()
  {
    return new Decimal32ArrayGidBuilder;
  }

  /** */
  string formatValue(long i)
  {
    char* _cretval;
    _cretval = garrow_decimal32_array_format_value(cast(GArrowDecimal32Array*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  alias getValue = arrow.fixed_size_binary_array.FixedSizeBinaryArray.getValue;

  /** */
  arrow.decimal32.Decimal32 getValue(long i)
  {
    GArrowDecimal32* _cretval;
    _cretval = garrow_decimal32_array_get_value(cast(GArrowDecimal32Array*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal32.Decimal32)(cast(GArrowDecimal32*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.decimal32_array.Decimal32Array]
class Decimal32ArrayGidBuilderImpl(T) : arrow.fixed_size_binary_array.FixedSizeBinaryArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.decimal32_array.Decimal32Array]
final class Decimal32ArrayGidBuilder : Decimal32ArrayGidBuilderImpl!Decimal32ArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Decimal32Array build()
  {
    return new Decimal32Array(cast(void*)createGObject(Decimal32Array._getGType), No.Take);
  }
}
