/// Module for [UInt64Scalar] class
module arrow.uint64_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class UInt64Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_uint64_scalar_get_type != &gidSymbolNotFound ? garrow_uint64_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt64Scalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.uint64_scalar.UInt64Scalar]
  Returns: New builder object
  */
  static UInt64ScalarGidBuilder builder()
  {
    return new UInt64ScalarGidBuilder;
  }

  /** */
  this(ulong value)
  {
    GArrowUInt64Scalar* _cretval;
    _cretval = garrow_uint64_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  ulong getValue()
  {
    ulong _retval;
    _retval = garrow_uint64_scalar_get_value(cast(GArrowUInt64Scalar*)this._cPtr);
    return _retval;
  }
}

class UInt64ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uint64_scalar.UInt64Scalar]
final class UInt64ScalarGidBuilder : UInt64ScalarGidBuilderImpl!UInt64ScalarGidBuilder
{
  UInt64Scalar build()
  {
    return new UInt64Scalar(cast(void*)createGObject(UInt64Scalar._getGType), Yes.Take);
  }
}
