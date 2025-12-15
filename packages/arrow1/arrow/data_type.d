/// Module for [DataType] class
module arrow.data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class DataType : gobject.object.ObjectWrap
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
    return cast(void function())garrow_data_type_get_type != &gidSymbolNotFound ? garrow_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataType self()
  {
    return this;
  }

  /** */
  static arrow.data_type.DataType import_(void* cAbiSchema)
  {
    GArrowDataType* _cretval;
    GError *_err;
    _cretval = garrow_data_type_import(cAbiSchema, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.data_type.DataType otherDataType)
  {
    bool _retval;
    _retval = cast(bool)garrow_data_type_equal(cast(GArrowDataType*)this._cPtr, otherDataType ? cast(GArrowDataType*)otherDataType._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  void* export_()
  {
    GError *_err;
    auto _retval = garrow_data_type_export(cast(GArrowDataType*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.types.Type getId()
  {
    GArrowType _cretval;
    _cretval = garrow_data_type_get_id(cast(GArrowDataType*)this._cPtr);
    arrow.types.Type _retval = cast(arrow.types.Type)_cretval;
    return _retval;
  }

  /** */
  string getName()
  {
    char* _cretval;
    _cretval = garrow_data_type_get_name(cast(GArrowDataType*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_data_type_to_string(cast(GArrowDataType*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
