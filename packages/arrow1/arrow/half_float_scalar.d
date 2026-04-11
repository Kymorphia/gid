/// Module for [HalfFloatScalar] class
module arrow.half_float_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class HalfFloatScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_half_float_scalar_get_type != &gidSymbolNotFound ? garrow_half_float_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HalfFloatScalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.half_float_scalar.HalfFloatScalar]
      Returns: New builder object
  */
  static HalfFloatScalarGidBuilder builder()
  {
    return new HalfFloatScalarGidBuilder;
  }

  /** */
  this(ushort value)
  {
    GArrowHalfFloatScalar* _cretval;
    _cretval = garrow_half_float_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  ushort getValue()
  {
    ushort _retval;
    _retval = garrow_half_float_scalar_get_value(cast(GArrowHalfFloatScalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.half_float_scalar.HalfFloatScalar]
class HalfFloatScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.half_float_scalar.HalfFloatScalar]
final class HalfFloatScalarGidBuilder : HalfFloatScalarGidBuilderImpl!HalfFloatScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HalfFloatScalar build()
  {
    return new HalfFloatScalar(cast(void*)createGObject(HalfFloatScalar._getGType), Yes.Take);
  }
}
