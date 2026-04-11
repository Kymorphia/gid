/// Module for [UInt32Scalar] class
module arrow.uint32_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class UInt32Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_uint32_scalar_get_type != &gidSymbolNotFound ? garrow_uint32_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt32Scalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.uint32_scalar.UInt32Scalar]
      Returns: New builder object
  */
  static UInt32ScalarGidBuilder builder()
  {
    return new UInt32ScalarGidBuilder;
  }

  /** */
  this(uint value)
  {
    GArrowUInt32Scalar* _cretval;
    _cretval = garrow_uint32_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  uint getValue()
  {
    uint _retval;
    _retval = garrow_uint32_scalar_get_value(cast(GArrowUInt32Scalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.uint32_scalar.UInt32Scalar]
class UInt32ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uint32_scalar.UInt32Scalar]
final class UInt32ScalarGidBuilder : UInt32ScalarGidBuilderImpl!UInt32ScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UInt32Scalar build()
  {
    return new UInt32Scalar(cast(void*)createGObject(UInt32Scalar._getGType), Yes.Take);
  }
}
