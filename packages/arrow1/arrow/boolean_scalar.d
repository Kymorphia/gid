/// Module for [BooleanScalar] class
module arrow.boolean_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class BooleanScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_boolean_scalar_get_type != &gidSymbolNotFound ? garrow_boolean_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BooleanScalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.boolean_scalar.BooleanScalar]
  Returns: New builder object
  */
  static BooleanScalarGidBuilder builder()
  {
    return new BooleanScalarGidBuilder;
  }

  /** */
  this(bool value)
  {
    GArrowBooleanScalar* _cretval;
    _cretval = garrow_boolean_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  bool getValue()
  {
    bool _retval;
    _retval = cast(bool)garrow_boolean_scalar_get_value(cast(GArrowBooleanScalar*)this._cPtr);
    return _retval;
  }
}

class BooleanScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.boolean_scalar.BooleanScalar]
final class BooleanScalarGidBuilder : BooleanScalarGidBuilderImpl!BooleanScalarGidBuilder
{
  BooleanScalar build()
  {
    return new BooleanScalar(cast(void*)createGObject(BooleanScalar._getGType), Yes.Take);
  }
}
