/// Module for [Field] class
module arrow.field;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Field : gobject.object.ObjectWrap
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
    return cast(void function())garrow_field_get_type != &gidSymbolNotFound ? garrow_field_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Field self()
  {
    return this;
  }

  /** */
  this(string name, arrow.data_type.DataType dataType)
  {
    GArrowField* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = garrow_field_new(_name, dataType ? cast(GArrowDataType*)dataType._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.field.Field newFull(string name, arrow.data_type.DataType dataType, bool nullable)
  {
    GArrowField* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = garrow_field_new_full(_name, dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, nullable);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.field.Field import_(void* cAbiSchema)
  {
    GArrowField* _cretval;
    GError *_err;
    _cretval = garrow_field_import(cAbiSchema, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.field.Field otherField)
  {
    bool _retval;
    _retval = cast(bool)garrow_field_equal(cast(GArrowField*)this._cPtr, otherField ? cast(GArrowField*)otherField._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  void* export_()
  {
    GError *_err;
    auto _retval = garrow_field_export(cast(GArrowField*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_field_get_data_type(cast(GArrowField*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, No.Take);
    return _retval;
  }

  /** */
  string[string] getMetadata()
  {
    GHashTable* _cretval;
    _cretval = garrow_field_get_metadata(cast(GArrowField*)this._cPtr);
    auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = garrow_field_get_name(cast(GArrowField*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  bool hasMetadata()
  {
    bool _retval;
    _retval = cast(bool)garrow_field_has_metadata(cast(GArrowField*)this._cPtr);
    return _retval;
  }

  /** */
  bool isNullable()
  {
    bool _retval;
    _retval = cast(bool)garrow_field_is_nullable(cast(GArrowField*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.field.Field removeMetadata()
  {
    GArrowField* _cretval;
    _cretval = garrow_field_remove_metadata(cast(GArrowField*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_field_to_string(cast(GArrowField*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string toStringMetadata(bool showMetadata)
  {
    char* _cretval;
    _cretval = garrow_field_to_string_metadata(cast(GArrowField*)this._cPtr, showMetadata);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  arrow.field.Field withMergedMetadata(string[string] metadata)
  {
    GArrowField* _cretval;
    auto _metadata = gHashTableFromD!(string, string)(metadata);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_metadata);
    _cretval = garrow_field_with_merged_metadata(cast(GArrowField*)this._cPtr, _metadata);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.field.Field withMetadata(string[string] metadata)
  {
    GArrowField* _cretval;
    auto _metadata = gHashTableFromD!(string, string)(metadata);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_metadata);
    _cretval = garrow_field_with_metadata(cast(GArrowField*)this._cPtr, _metadata);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }
}
