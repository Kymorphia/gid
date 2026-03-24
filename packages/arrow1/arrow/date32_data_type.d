/// Module for [Date32DataType] class
module arrow.date32_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Date32DataType : arrow.temporal_data_type.TemporalDataType
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
    return cast(void function())garrow_date32_data_type_get_type != &gidSymbolNotFound ? garrow_date32_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Date32DataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.date32_data_type.Date32DataType]
  Returns: New builder object
  */
  static Date32DataTypeGidBuilder builder()
  {
    return new Date32DataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowDate32DataType* _cretval;
    _cretval = garrow_date32_data_type_new();
    this(_cretval, Yes.Take);
  }
}

class Date32DataTypeGidBuilderImpl(T) : arrow.temporal_data_type.TemporalDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.date32_data_type.Date32DataType]
final class Date32DataTypeGidBuilder : Date32DataTypeGidBuilderImpl!Date32DataTypeGidBuilder
{
  Date32DataType build()
  {
    return new Date32DataType(cast(void*)createGObject(Date32DataType._getGType), Yes.Take);
  }
}
