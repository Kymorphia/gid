/// Module for [StringDataType] class
module arrow.string_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class StringDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_string_data_type_get_type != &gidSymbolNotFound ? garrow_string_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StringDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.string_data_type.StringDataType]
  Returns: New builder object
  */
  static StringDataTypeGidBuilder builder()
  {
    return new StringDataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowStringDataType* _cretval;
    _cretval = garrow_string_data_type_new();
    this(_cretval, Yes.Take);
  }
}

class StringDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.string_data_type.StringDataType]
final class StringDataTypeGidBuilder : StringDataTypeGidBuilderImpl!StringDataTypeGidBuilder
{
  StringDataType build()
  {
    return new StringDataType(cast(void*)createGObject(StringDataType._getGType), Yes.Take);
  }
}
