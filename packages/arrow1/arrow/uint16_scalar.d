/// Module for [UInt16Scalar] class
module arrow.uint16_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class UInt16Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_uint16_scalar_get_type != &gidSymbolNotFound ? garrow_uint16_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt16Scalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.uint16_scalar.UInt16Scalar]
      Returns: New builder object
  */
  static UInt16ScalarGidBuilder builder()
  {
    return new UInt16ScalarGidBuilder;
  }

  /** */
  this(ushort value)
  {
    GArrowUInt16Scalar* _cretval;
    _cretval = garrow_uint16_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  ushort getValue()
  {
    ushort _retval;
    _retval = garrow_uint16_scalar_get_value(cast(GArrowUInt16Scalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.uint16_scalar.UInt16Scalar]
class UInt16ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uint16_scalar.UInt16Scalar]
final class UInt16ScalarGidBuilder : UInt16ScalarGidBuilderImpl!UInt16ScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UInt16Scalar build()
  {
    return new UInt16Scalar(cast(void*)createGObject(UInt16Scalar._getGType), Yes.Take);
  }
}
