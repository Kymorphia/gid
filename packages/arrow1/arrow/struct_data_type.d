/// Module for [StructDataType] class
module arrow.struct_data_type;

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
class StructDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_struct_data_type_get_type != &gidSymbolNotFound ? garrow_struct_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StructDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.struct_data_type.StructDataType]
      Returns: New builder object
  */
  static StructDataTypeGidBuilder builder() nothrow
  {
    return new StructDataTypeGidBuilder;
  }

  /** */
  this(arrow.field.Field[] fields) nothrow
  {
    GArrowStructDataType* _cretval;
    auto _fields = gListFromD!(arrow.field.Field)(fields);
    scope(exit) containerFree!(GList*, arrow.field.Field, GidOwnership.None)(_fields);
    _cretval = garrow_struct_data_type_new(_fields);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.field.Field getField(int i) nothrow
  {
    GArrowField* _cretval;
    _cretval = garrow_struct_data_type_get_field(cast(GArrowStructDataType*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.field.Field getFieldByName(string name) nothrow
  {
    GArrowField* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = garrow_struct_data_type_get_field_by_name(cast(GArrowStructDataType*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  int getFieldIndex(string name) nothrow
  {
    int _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = garrow_struct_data_type_get_field_index(cast(GArrowStructDataType*)this._cPtr, _name);
    return _retval;
  }

  /** */
  arrow.field.Field[] getFields() nothrow
  {
    GList* _cretval;
    _cretval = garrow_struct_data_type_get_fields(cast(GArrowStructDataType*)this._cPtr);
    auto _retval = gListToD!(arrow.field.Field, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  int getNFields() nothrow
  {
    int _retval;
    _retval = garrow_struct_data_type_get_n_fields(cast(GArrowStructDataType*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.struct_data_type.StructDataType]
class StructDataTypeGidBuilderImpl(T) : arrow.data_type.DataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.struct_data_type.StructDataType]
final class StructDataTypeGidBuilder : StructDataTypeGidBuilderImpl!StructDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StructDataType build() nothrow
  {
    return new StructDataType(cast(void*)createGObject(StructDataType._getGType), Yes.Take);
  }
}
