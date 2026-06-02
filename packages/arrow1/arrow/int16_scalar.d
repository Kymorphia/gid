/// Module for [Int16Scalar] class
module arrow.int16_scalar;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Int16Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_int16_scalar_get_type != &gidSymbolNotFound ? garrow_int16_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int16Scalar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.int16_scalar.Int16Scalar]
      Returns: New builder object
  */
  static Int16ScalarGidBuilder builder() nothrow
  {
    return new Int16ScalarGidBuilder;
  }

  /** */
  this(short value) nothrow
  {
    GArrowInt16Scalar* _cretval;
    _cretval = garrow_int16_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  short getValue() nothrow
  {
    short _retval;
    _retval = garrow_int16_scalar_get_value(cast(GArrowInt16Scalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.int16_scalar.Int16Scalar]
class Int16ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.int16_scalar.Int16Scalar]
final class Int16ScalarGidBuilder : Int16ScalarGidBuilderImpl!Int16ScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Int16Scalar build() nothrow
  {
    return new Int16Scalar(cast(void*)createGObject(Int16Scalar._getGType), Yes.Take);
  }
}
