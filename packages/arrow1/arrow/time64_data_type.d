/// Module for [Time64DataType] class
module arrow.time64_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.time_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class Time64DataType : arrow.time_data_type.TimeDataType
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
    return cast(void function())garrow_time64_data_type_get_type != &gidSymbolNotFound ? garrow_time64_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Time64DataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.time64_data_type.Time64DataType]
      Returns: New builder object
  */
  static Time64DataTypeGidBuilder builder()
  {
    return new Time64DataTypeGidBuilder;
  }

  /** */
  this(arrow.types.TimeUnit unit)
  {
    GArrowTime64DataType* _cretval;
    GError *_err;
    _cretval = garrow_time64_data_type_new(unit, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.time64_data_type.Time64DataType]
class Time64DataTypeGidBuilderImpl(T) : arrow.time_data_type.TimeDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.time64_data_type.Time64DataType]
final class Time64DataTypeGidBuilder : Time64DataTypeGidBuilderImpl!Time64DataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Time64DataType build()
  {
    return new Time64DataType(cast(void*)createGObject(Time64DataType._getGType), Yes.Take);
  }
}
