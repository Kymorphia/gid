/// Module for [Int32Scalar] class
module arrow.int32_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Int32Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_int32_scalar_get_type != &gidSymbolNotFound ? garrow_int32_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int32Scalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.int32_scalar.Int32Scalar]
      Returns: New builder object
  */
  static Int32ScalarGidBuilder builder()
  {
    return new Int32ScalarGidBuilder;
  }

  /** */
  this(int value)
  {
    GArrowInt32Scalar* _cretval;
    _cretval = garrow_int32_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  int getValue()
  {
    int _retval;
    _retval = garrow_int32_scalar_get_value(cast(GArrowInt32Scalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.int32_scalar.Int32Scalar]
class Int32ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.int32_scalar.Int32Scalar]
final class Int32ScalarGidBuilder : Int32ScalarGidBuilderImpl!Int32ScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Int32Scalar build()
  {
    return new Int32Scalar(cast(void*)createGObject(Int32Scalar._getGType), Yes.Take);
  }
}
