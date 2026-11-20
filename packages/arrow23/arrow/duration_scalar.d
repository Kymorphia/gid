/// Module for [DurationScalar] class
module arrow.duration_scalar;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.duration_data_type;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class DurationScalar : arrow.scalar.Scalar
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_duration_scalar_get_type != &gidSymbolNotFound ? garrow_duration_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowDurationScalar";
  }

  /** Returns `this`, for use in `with` statements. */
  override DurationScalar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.duration_scalar.DurationScalar]
      Returns: New builder object
  */
  static DurationScalarGidBuilder builder() nothrow
  {
    return new DurationScalarGidBuilder;
  }

  /** */
  this(arrow.duration_data_type.DurationDataType dataType, long value) nothrow
  {
    GArrowDurationScalar* _cretval;
    _cretval = garrow_duration_scalar_new(dataType ? cast(GArrowDurationDataType*)dataType._cPtr(No.Dup) : null, value);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue() nothrow
  {
    long _retval;
    _retval = garrow_duration_scalar_get_value(cast(GArrowDurationScalar*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.duration_scalar.DurationScalar]
class DurationScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.duration_scalar.DurationScalar]
final class DurationScalarGidBuilder : DurationScalarGidBuilderImpl!DurationScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DurationScalar build() nothrow
  {
    return new DurationScalar(cast(void*)createGObject(DurationScalar._getGType), Yes.Take);
  }
}
