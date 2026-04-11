/// Module for [Int64Scalar] class
module arrow.int64_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Int64Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_int64_scalar_get_type != &gidSymbolNotFound ? garrow_int64_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int64Scalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.int64_scalar.Int64Scalar]
      Returns: New builder object
  */
  static Int64ScalarGidBuilder builder()
  {
    return new Int64ScalarGidBuilder;
  }

  /** */
  this(long value)
  {
    GArrowInt64Scalar* _cretval;
    _cretval = garrow_int64_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue()
  {
    long _retval;
    _retval = garrow_int64_scalar_get_value(cast(GArrowInt64Scalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.int64_scalar.Int64Scalar]
class Int64ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.int64_scalar.Int64Scalar]
final class Int64ScalarGidBuilder : Int64ScalarGidBuilderImpl!Int64ScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Int64Scalar build()
  {
    return new Int64Scalar(cast(void*)createGObject(Int64Scalar._getGType), Yes.Take);
  }
}
