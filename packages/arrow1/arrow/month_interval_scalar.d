/// Module for [MonthIntervalScalar] class
module arrow.month_interval_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class MonthIntervalScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_month_interval_scalar_get_type != &gidSymbolNotFound ? garrow_month_interval_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MonthIntervalScalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.month_interval_scalar.MonthIntervalScalar]
      Returns: New builder object
  */
  static MonthIntervalScalarGidBuilder builder()
  {
    return new MonthIntervalScalarGidBuilder;
  }

  /** */
  this(int value)
  {
    GArrowMonthIntervalScalar* _cretval;
    _cretval = garrow_month_interval_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  int getValue()
  {
    int _retval;
    _retval = garrow_month_interval_scalar_get_value(cast(GArrowMonthIntervalScalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.month_interval_scalar.MonthIntervalScalar]
class MonthIntervalScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.month_interval_scalar.MonthIntervalScalar]
final class MonthIntervalScalarGidBuilder : MonthIntervalScalarGidBuilderImpl!MonthIntervalScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MonthIntervalScalar build()
  {
    return new MonthIntervalScalar(cast(void*)createGObject(MonthIntervalScalar._getGType), Yes.Take);
  }
}
