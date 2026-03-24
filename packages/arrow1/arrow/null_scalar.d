/// Module for [NullScalar] class
module arrow.null_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class NullScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_null_scalar_get_type != &gidSymbolNotFound ? garrow_null_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NullScalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.null_scalar.NullScalar]
  Returns: New builder object
  */
  static NullScalarGidBuilder builder()
  {
    return new NullScalarGidBuilder;
  }

  /** */
  this()
  {
    GArrowNullScalar* _cretval;
    _cretval = garrow_null_scalar_new();
    this(_cretval, Yes.Take);
  }
}

class NullScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.null_scalar.NullScalar]
final class NullScalarGidBuilder : NullScalarGidBuilderImpl!NullScalarGidBuilder
{
  NullScalar build()
  {
    return new NullScalar(cast(void*)createGObject(NullScalar._getGType), Yes.Take);
  }
}
