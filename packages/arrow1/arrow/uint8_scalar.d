/// Module for [UInt8Scalar] class
module arrow.uint8_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class UInt8Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_uint8_scalar_get_type != &gidSymbolNotFound ? garrow_uint8_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt8Scalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.uint8_scalar.UInt8Scalar]
  Returns: New builder object
  */
  static UInt8ScalarGidBuilder builder()
  {
    return new UInt8ScalarGidBuilder;
  }

  /** */
  this(ubyte value)
  {
    GArrowUInt8Scalar* _cretval;
    _cretval = garrow_uint8_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  ubyte getValue()
  {
    ubyte _retval;
    _retval = garrow_uint8_scalar_get_value(cast(GArrowUInt8Scalar*)this._cPtr);
    return _retval;
  }
}

class UInt8ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uint8_scalar.UInt8Scalar]
final class UInt8ScalarGidBuilder : UInt8ScalarGidBuilderImpl!UInt8ScalarGidBuilder
{
  UInt8Scalar build()
  {
    return new UInt8Scalar(cast(void*)createGObject(UInt8Scalar._getGType), Yes.Take);
  }
}
