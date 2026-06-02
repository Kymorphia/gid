/// Module for [StructScalar] class
module arrow.struct_scalar;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_struct_scalar_get_type != &gidSymbolNotFound ? garrow_struct_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StructScalar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.struct_scalar.StructScalar]
      Returns: New builder object
  */
  static StructScalarGidBuilder builder() nothrow
  {
    return new StructScalarGidBuilder;
  }

  /** */
  this(arrow.struct_data_type.StructDataType dataType, arrow.scalar.Scalar[] value) nothrow
  {
    GArrowStructScalar* _cretval;
    auto _value = gListFromD!(arrow.scalar.Scalar)(value);
    scope(exit) containerFree!(GList*, arrow.scalar.Scalar, GidOwnership.None)(_value);
    _cretval = garrow_struct_scalar_new(dataType ? cast(GArrowStructDataType*)dataType._cPtr(No.Dup) : null, _value);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.scalar.Scalar[] getValue() nothrow
  {
    GList* _cretval;
    _cretval = garrow_struct_scalar_get_value(cast(GArrowStructScalar*)this._cPtr);
    auto _retval = gListToD!(arrow.scalar.Scalar, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.struct_scalar.StructScalar]
class StructScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.struct_scalar.StructScalar]
final class StructScalarGidBuilder : StructScalarGidBuilderImpl!StructScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StructScalar build() nothrow
  {
    return new StructScalar(cast(void*)createGObject(StructScalar._getGType), Yes.Take);
  }
}
