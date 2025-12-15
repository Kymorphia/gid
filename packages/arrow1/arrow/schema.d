/// Module for [Schema] class
module arrow.schema;

import arrow.c.functions;
import arrow.c.types;
import arrow.field;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Schema : gobject.object.ObjectWrap
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
    return cast(void function())garrow_schema_get_type != &gidSymbolNotFound ? garrow_schema_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Schema self()
  {
    return this;
  }

  /** */
  this(arrow.field.Field[] fields)
  {
    GArrowSchema* _cretval;
    auto _fields = gListFromD!(arrow.field.Field)(fields);
    scope(exit) containerFree!(GList*, arrow.field.Field, GidOwnership.None)(_fields);
    _cretval = garrow_schema_new(_fields);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.schema.Schema import_(void* cAbiSchema)
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = garrow_schema_import(cAbiSchema, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.schema.Schema addField(uint i, arrow.field.Field field)
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = garrow_schema_add_field(cast(GArrowSchema*)this._cPtr, i, field ? cast(GArrowField*)field._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.schema.Schema otherSchema)
  {
    bool _retval;
    _retval = cast(bool)garrow_schema_equal(cast(GArrowSchema*)this._cPtr, otherSchema ? cast(GArrowSchema*)otherSchema._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  void* export_()
  {
    GError *_err;
    auto _retval = garrow_schema_export(cast(GArrowSchema*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.field.Field getField(uint i)
  {
    GArrowField* _cretval;
    _cretval = garrow_schema_get_field(cast(GArrowSchema*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.field.Field getFieldByName(string name)
  {
    GArrowField* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = garrow_schema_get_field_by_name(cast(GArrowSchema*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  int getFieldIndex(string name)
  {
    int _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = garrow_schema_get_field_index(cast(GArrowSchema*)this._cPtr, _name);
    return _retval;
  }

  /** */
  arrow.field.Field[] getFields()
  {
    GList* _cretval;
    _cretval = garrow_schema_get_fields(cast(GArrowSchema*)this._cPtr);
    auto _retval = gListToD!(arrow.field.Field, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  string[string] getMetadata()
  {
    GHashTable* _cretval;
    _cretval = garrow_schema_get_metadata(cast(GArrowSchema*)this._cPtr);
    auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  /** */
  bool hasMetadata()
  {
    bool _retval;
    _retval = cast(bool)garrow_schema_has_metadata(cast(GArrowSchema*)this._cPtr);
    return _retval;
  }

  /** */
  uint nFields()
  {
    uint _retval;
    _retval = garrow_schema_n_fields(cast(GArrowSchema*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.schema.Schema removeField(uint i)
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = garrow_schema_remove_field(cast(GArrowSchema*)this._cPtr, i, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.schema.Schema replaceField(uint i, arrow.field.Field field)
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = garrow_schema_replace_field(cast(GArrowSchema*)this._cPtr, i, field ? cast(GArrowField*)field._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_schema_to_string(cast(GArrowSchema*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string toStringMetadata(bool showMetadata)
  {
    char* _cretval;
    _cretval = garrow_schema_to_string_metadata(cast(GArrowSchema*)this._cPtr, showMetadata);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  arrow.schema.Schema withMetadata(string[string] metadata)
  {
    GArrowSchema* _cretval;
    auto _metadata = gHashTableFromD!(string, string)(metadata);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_metadata);
    _cretval = garrow_schema_with_metadata(cast(GArrowSchema*)this._cPtr, _metadata);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }
}
