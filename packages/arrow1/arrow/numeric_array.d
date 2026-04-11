/// Module for [NumericArray] class
module arrow.numeric_array;

import arrow.c.functions;
import arrow.c.types;
import arrow.primitive_array;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class NumericArray : arrow.primitive_array.PrimitiveArray
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
    return cast(void function())garrow_numeric_array_get_type != &gidSymbolNotFound ? garrow_numeric_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NumericArray self()
  {
    return this;
  }

  /**
      Get builder for [arrow.numeric_array.NumericArray]
      Returns: New builder object
  */
  static NumericArrayGidBuilder builder()
  {
    return new NumericArrayGidBuilder;
  }

  /** */
  double mean()
  {
    double _retval;
    GError *_err;
    _retval = garrow_numeric_array_mean(cast(GArrowNumericArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.numeric_array.NumericArray]
class NumericArrayGidBuilderImpl(T) : arrow.primitive_array.PrimitiveArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.numeric_array.NumericArray]
final class NumericArrayGidBuilder : NumericArrayGidBuilderImpl!NumericArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NumericArray build()
  {
    return new NumericArray(cast(void*)createGObject(NumericArray._getGType), No.Take);
  }
}
