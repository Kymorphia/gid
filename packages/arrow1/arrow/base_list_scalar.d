/// Module for [BaseListScalar] class
module arrow.base_list_scalar;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class BaseListScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_base_list_scalar_get_type != &gidSymbolNotFound ? garrow_base_list_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseListScalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.base_list_scalar.BaseListScalar]
  Returns: New builder object
  */
  static BaseListScalarGidBuilder builder()
  {
    return new BaseListScalarGidBuilder;
  }

  /** */
  arrow.array.Array getValue()
  {
    GArrowArray* _cretval;
    _cretval = garrow_base_list_scalar_get_value(cast(GArrowBaseListScalar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, No.Take);
    return _retval;
  }
}

class BaseListScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{

  /**
      Set `value` property.
      Params:
        propval = The value of the scalar.
      Returns: Builder instance for fluent chaining
  */
  T value(arrow.array.Array propval)
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [arrow.base_list_scalar.BaseListScalar]
final class BaseListScalarGidBuilder : BaseListScalarGidBuilderImpl!BaseListScalarGidBuilder
{
  BaseListScalar build()
  {
    return new BaseListScalar(cast(void*)createGObject(BaseListScalar._getGType), No.Take);
  }
}
