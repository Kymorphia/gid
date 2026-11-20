/// Module for [DurationDataType] class
module arrow.duration_data_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class DurationDataType : arrow.temporal_data_type.TemporalDataType
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
    return cast(void function())garrow_duration_data_type_get_type != &gidSymbolNotFound ? garrow_duration_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowDurationDataType";
  }

  /** Returns `this`, for use in `with` statements. */
  override DurationDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.duration_data_type.DurationDataType]
      Returns: New builder object
  */
  static DurationDataTypeGidBuilder builder() nothrow
  {
    return new DurationDataTypeGidBuilder;
  }

  /** */
  this(arrow.types.TimeUnit unit) nothrow
  {
    GArrowDurationDataType* _cretval;
    _cretval = garrow_duration_data_type_new(unit);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.types.TimeUnit getUnit() nothrow
  {
    GArrowTimeUnit _cretval;
    _cretval = garrow_duration_data_type_get_unit(cast(GArrowDurationDataType*)this._cPtr);
    arrow.types.TimeUnit _retval = cast(arrow.types.TimeUnit)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.duration_data_type.DurationDataType]
class DurationDataTypeGidBuilderImpl(T) : arrow.temporal_data_type.TemporalDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.duration_data_type.DurationDataType]
final class DurationDataTypeGidBuilder : DurationDataTypeGidBuilderImpl!DurationDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DurationDataType build() nothrow
  {
    return new DurationDataType(cast(void*)createGObject(DurationDataType._getGType), Yes.Take);
  }
}
