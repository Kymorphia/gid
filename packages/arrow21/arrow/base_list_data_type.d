/// Module for [BaseListDataType] class
module arrow.base_list_data_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.field;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class BaseListDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_base_list_data_type_get_type != &gidSymbolNotFound ? garrow_base_list_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowBaseListDataType";
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseListDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.base_list_data_type.BaseListDataType]
      Returns: New builder object
  */
  static BaseListDataTypeGidBuilder builder() nothrow
  {
    return new BaseListDataTypeGidBuilder;
  }

  /** */
  arrow.field.Field getField() nothrow
  {
    GArrowField* _cretval;
    _cretval = garrow_base_list_data_type_get_field(cast(GArrowBaseListDataType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.base_list_data_type.BaseListDataType]
class BaseListDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.base_list_data_type.BaseListDataType]
final class BaseListDataTypeGidBuilder : BaseListDataTypeGidBuilderImpl!BaseListDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BaseListDataType build() nothrow
  {
    return new BaseListDataType(cast(void*)createGObject(BaseListDataType._getGType), Yes.Take);
  }
}
