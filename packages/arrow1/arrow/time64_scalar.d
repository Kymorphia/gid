/// Module for [Time64Scalar] class
module arrow.time64_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.time64_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Time64Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_time64_scalar_get_type != &gidSymbolNotFound ? garrow_time64_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Time64Scalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.time64_scalar.Time64Scalar]
      Returns: New builder object
  */
  static Time64ScalarGidBuilder builder()
  {
    return new Time64ScalarGidBuilder;
  }

  /** */
  this(arrow.time64_data_type.Time64DataType dataType, long value)
  {
    GArrowTime64Scalar* _cretval;
    _cretval = garrow_time64_scalar_new(dataType ? cast(GArrowTime64DataType*)dataType._cPtr(No.Dup) : null, value);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue()
  {
    long _retval;
    _retval = garrow_time64_scalar_get_value(cast(GArrowTime64Scalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.time64_scalar.Time64Scalar]
class Time64ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.time64_scalar.Time64Scalar]
final class Time64ScalarGidBuilder : Time64ScalarGidBuilderImpl!Time64ScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Time64Scalar build()
  {
    return new Time64Scalar(cast(void*)createGObject(Time64Scalar._getGType), Yes.Take);
  }
}
