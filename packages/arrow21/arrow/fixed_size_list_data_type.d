/// Module for [FixedSizeListDataType] class
module arrow.fixed_size_list_data_type;

public import gid.basictypes;
import arrow.base_list_data_type;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.field;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class FixedSizeListDataType : arrow.base_list_data_type.BaseListDataType
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
    return cast(void function())garrow_fixed_size_list_data_type_get_type != &gidSymbolNotFound ? garrow_fixed_size_list_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowFixedSizeListDataType";
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedSizeListDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.fixed_size_list_data_type.FixedSizeListDataType]
      Returns: New builder object
  */
  static FixedSizeListDataTypeGidBuilder builder() nothrow
  {
    return new FixedSizeListDataTypeGidBuilder;
  }

  /** */
  @property int listSize() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("list-size");
  }

  /** */
  static arrow.fixed_size_list_data_type.FixedSizeListDataType newDataType(arrow.data_type.DataType valueType, int listSize) nothrow
  {
    GArrowFixedSizeListDataType* _cretval;
    _cretval = garrow_fixed_size_list_data_type_new_data_type(valueType ? cast(GArrowDataType*)valueType._cPtr(No.Dup) : null, listSize);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.fixed_size_list_data_type.FixedSizeListDataType)(cast(GArrowFixedSizeListDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.fixed_size_list_data_type.FixedSizeListDataType newField(arrow.field.Field field, int listSize) nothrow
  {
    GArrowFixedSizeListDataType* _cretval;
    _cretval = garrow_fixed_size_list_data_type_new_field(field ? cast(GArrowField*)field._cPtr(No.Dup) : null, listSize);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.fixed_size_list_data_type.FixedSizeListDataType)(cast(GArrowFixedSizeListDataType*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.fixed_size_list_data_type.FixedSizeListDataType]
class FixedSizeListDataTypeGidBuilderImpl(T) : arrow.base_list_data_type.BaseListDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.fixed_size_list_data_type.FixedSizeListDataType]
final class FixedSizeListDataTypeGidBuilder : FixedSizeListDataTypeGidBuilderImpl!FixedSizeListDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedSizeListDataType build() nothrow
  {
    return new FixedSizeListDataType(cast(void*)createGObject(FixedSizeListDataType._getGType), Yes.Take);
  }
}
