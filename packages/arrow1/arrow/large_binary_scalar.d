/// Module for [LargeBinaryScalar] class
module arrow.large_binary_scalar;

import arrow.base_binary_scalar;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class LargeBinaryScalar : arrow.base_binary_scalar.BaseBinaryScalar
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
    return cast(void function())garrow_large_binary_scalar_get_type != &gidSymbolNotFound ? garrow_large_binary_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeBinaryScalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.large_binary_scalar.LargeBinaryScalar]
  Returns: New builder object
  */
  static LargeBinaryScalarGidBuilder builder()
  {
    return new LargeBinaryScalarGidBuilder;
  }

  /** */
  this(arrow.buffer.Buffer value)
  {
    GArrowLargeBinaryScalar* _cretval;
    _cretval = garrow_large_binary_scalar_new(value ? cast(GArrowBuffer*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

class LargeBinaryScalarGidBuilderImpl(T) : arrow.base_binary_scalar.BaseBinaryScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.large_binary_scalar.LargeBinaryScalar]
final class LargeBinaryScalarGidBuilder : LargeBinaryScalarGidBuilderImpl!LargeBinaryScalarGidBuilder
{
  LargeBinaryScalar build()
  {
    return new LargeBinaryScalar(cast(void*)createGObject(LargeBinaryScalar._getGType), Yes.Take);
  }
}
