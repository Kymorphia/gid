/// Module for [LargeListDataType] class
module arrow.large_list_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.field;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class LargeListDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_large_list_data_type_get_type != &gidSymbolNotFound ? garrow_large_list_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeListDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.large_list_data_type.LargeListDataType]
  Returns: New builder object
  */
  static LargeListDataTypeGidBuilder builder()
  {
    return new LargeListDataTypeGidBuilder;
  }

  /** */
  this(arrow.field.Field field)
  {
    GArrowLargeListDataType* _cretval;
    _cretval = garrow_large_list_data_type_new(field ? cast(GArrowField*)field._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.field.Field getField()
  {
    GArrowField* _cretval;
    _cretval = garrow_large_list_data_type_get_field(cast(GArrowLargeListDataType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }
}

class LargeListDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.large_list_data_type.LargeListDataType]
final class LargeListDataTypeGidBuilder : LargeListDataTypeGidBuilderImpl!LargeListDataTypeGidBuilder
{
  LargeListDataType build()
  {
    return new LargeListDataType(cast(void*)createGObject(LargeListDataType._getGType), Yes.Take);
  }
}
