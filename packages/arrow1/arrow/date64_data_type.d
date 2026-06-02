/// Module for [Date64DataType] class
module arrow.date64_data_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Date64DataType : arrow.temporal_data_type.TemporalDataType
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
    return cast(void function())garrow_date64_data_type_get_type != &gidSymbolNotFound ? garrow_date64_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Date64DataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.date64_data_type.Date64DataType]
      Returns: New builder object
  */
  static Date64DataTypeGidBuilder builder() nothrow
  {
    return new Date64DataTypeGidBuilder;
  }

  /** */
  this() nothrow
  {
    GArrowDate64DataType* _cretval;
    _cretval = garrow_date64_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.date64_data_type.Date64DataType]
class Date64DataTypeGidBuilderImpl(T) : arrow.temporal_data_type.TemporalDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.date64_data_type.Date64DataType]
final class Date64DataTypeGidBuilder : Date64DataTypeGidBuilderImpl!Date64DataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Date64DataType build() nothrow
  {
    return new Date64DataType(cast(void*)createGObject(Date64DataType._getGType), Yes.Take);
  }
}
