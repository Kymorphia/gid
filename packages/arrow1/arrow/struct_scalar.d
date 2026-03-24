/// Module for [StructScalar] class
module arrow.struct_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.struct_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class StructScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_struct_scalar_get_type != &gidSymbolNotFound ? garrow_struct_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StructScalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.struct_scalar.StructScalar]
  Returns: New builder object
  */
  static StructScalarGidBuilder builder()
  {
    return new StructScalarGidBuilder;
  }

  /** */
  this(arrow.struct_data_type.StructDataType dataType, arrow.scalar.Scalar[] value)
  {
    GArrowStructScalar* _cretval;
    auto _value = gListFromD!(arrow.scalar.Scalar)(value);
    scope(exit) containerFree!(GList*, arrow.scalar.Scalar, GidOwnership.None)(_value);
    _cretval = garrow_struct_scalar_new(dataType ? cast(GArrowStructDataType*)dataType._cPtr(No.Dup) : null, _value);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.scalar.Scalar[] getValue()
  {
    GList* _cretval;
    _cretval = garrow_struct_scalar_get_value(cast(GArrowStructScalar*)this._cPtr);
    auto _retval = gListToD!(arrow.scalar.Scalar, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}

class StructScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.struct_scalar.StructScalar]
final class StructScalarGidBuilder : StructScalarGidBuilderImpl!StructScalarGidBuilder
{
  StructScalar build()
  {
    return new StructScalar(cast(void*)createGObject(StructScalar._getGType), Yes.Take);
  }
}
