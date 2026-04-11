/// Module for [Decimal256Scalar] class
module arrow.decimal256_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal256;
import arrow.decimal256_data_type;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Decimal256Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_decimal256_scalar_get_type != &gidSymbolNotFound ? garrow_decimal256_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal256Scalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.decimal256_scalar.Decimal256Scalar]
      Returns: New builder object
  */
  static Decimal256ScalarGidBuilder builder()
  {
    return new Decimal256ScalarGidBuilder;
  }

  /** */
  this(arrow.decimal256_data_type.Decimal256DataType dataType, arrow.decimal256.Decimal256 value)
  {
    GArrowDecimal256Scalar* _cretval;
    _cretval = garrow_decimal256_scalar_new(dataType ? cast(GArrowDecimal256DataType*)dataType._cPtr(No.Dup) : null, value ? cast(GArrowDecimal256*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.decimal256.Decimal256 getValue()
  {
    GArrowDecimal256* _cretval;
    _cretval = garrow_decimal256_scalar_get_value(cast(GArrowDecimal256Scalar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.decimal256.Decimal256)(cast(GArrowDecimal256*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.decimal256_scalar.Decimal256Scalar]
class Decimal256ScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{

  /**
      Set `value` property.
      Params:
        propval = The value of the scalar.
      Returns: Builder instance for fluent chaining
  */
  T value(arrow.decimal256.Decimal256 propval)
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [arrow.decimal256_scalar.Decimal256Scalar]
final class Decimal256ScalarGidBuilder : Decimal256ScalarGidBuilderImpl!Decimal256ScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Decimal256Scalar build()
  {
    return new Decimal256Scalar(cast(void*)createGObject(Decimal256Scalar._getGType), Yes.Take);
  }
}
