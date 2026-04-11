/// Module for [FloatScalar] class
module arrow.float_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class FloatScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_float_scalar_get_type != &gidSymbolNotFound ? garrow_float_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FloatScalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.float_scalar.FloatScalar]
      Returns: New builder object
  */
  static FloatScalarGidBuilder builder()
  {
    return new FloatScalarGidBuilder;
  }

  /** */
  this(float value)
  {
    GArrowFloatScalar* _cretval;
    _cretval = garrow_float_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  float getValue()
  {
    float _retval;
    _retval = garrow_float_scalar_get_value(cast(GArrowFloatScalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.float_scalar.FloatScalar]
class FloatScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.float_scalar.FloatScalar]
final class FloatScalarGidBuilder : FloatScalarGidBuilderImpl!FloatScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FloatScalar build()
  {
    return new FloatScalar(cast(void*)createGObject(FloatScalar._getGType), Yes.Take);
  }
}
