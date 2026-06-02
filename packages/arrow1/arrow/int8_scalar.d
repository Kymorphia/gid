/// Module for [Int8Scalar] class
module arrow.int8_scalar;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Int8Scalar : arrow.scalar.Scalar
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_int8_scalar_get_type != &gidSymbolNotFound ? garrow_int8_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int8Scalar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.int8_scalar.Int8Scalar]
      Returns: New builder object
  */
  static Int8ScalarGidBuilder builder() nothrow
  {
    return new Int8ScalarGidBuilder;
  }

  /** */
  this(byte value) nothrow
  {
    GArrowInt8Scalar* _cretval;
    _cretval = garrow_int8_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  byte getValue() nothrow
  {
    byte _retval;
    _retval = garrow_int8_scalar_get_value(cast(GArrowInt8Scalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.int8_scalar.Int8Scalar]
class Int8ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.int8_scalar.Int8Scalar]
final class Int8ScalarGidBuilder : Int8ScalarGidBuilderImpl!Int8ScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Int8Scalar build() nothrow
  {
    return new Int8Scalar(cast(void*)createGObject(Int8Scalar._getGType), Yes.Take);
  }
}
