/// Module for [Time32DataType] class
module arrow.time32_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.time_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class Time32DataType : arrow.time_data_type.TimeDataType
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
    return cast(void function())garrow_time32_data_type_get_type != &gidSymbolNotFound ? garrow_time32_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Time32DataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.time32_data_type.Time32DataType]
  Returns: New builder object
  */
  static Time32DataTypeGidBuilder builder()
  {
    return new Time32DataTypeGidBuilder;
  }

  /** */
  this(arrow.types.TimeUnit unit)
  {
    GArrowTime32DataType* _cretval;
    GError *_err;
    _cretval = garrow_time32_data_type_new(unit, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

class Time32DataTypeGidBuilderImpl(T) : arrow.time_data_type.TimeDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.time32_data_type.Time32DataType]
final class Time32DataTypeGidBuilder : Time32DataTypeGidBuilderImpl!Time32DataTypeGidBuilder
{
  Time32DataType build()
  {
    return new Time32DataType(cast(void*)createGObject(Time32DataType._getGType), Yes.Take);
  }
}
