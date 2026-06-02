/// Module for [BaseBinaryScalar] class
module arrow.base_binary_scalar;

public import gid.basictypes;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class BaseBinaryScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_base_binary_scalar_get_type != &gidSymbolNotFound ? garrow_base_binary_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseBinaryScalar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.base_binary_scalar.BaseBinaryScalar]
      Returns: New builder object
  */
  static BaseBinaryScalarGidBuilder builder() nothrow
  {
    return new BaseBinaryScalarGidBuilder;
  }

  /** */
  arrow.buffer.Buffer getValue() nothrow
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_base_binary_scalar_get_value(cast(GArrowBaseBinaryScalar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.base_binary_scalar.BaseBinaryScalar]
class BaseBinaryScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{

  /**
      Set `value` property.
      Params:
        propval = The value of the scalar.
      Returns: Builder instance for fluent chaining
  */
  T value(arrow.buffer.Buffer propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [arrow.base_binary_scalar.BaseBinaryScalar]
final class BaseBinaryScalarGidBuilder : BaseBinaryScalarGidBuilderImpl!BaseBinaryScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BaseBinaryScalar build() nothrow
  {
    return new BaseBinaryScalar(cast(void*)createGObject(BaseBinaryScalar._getGType), No.Take);
  }
}
