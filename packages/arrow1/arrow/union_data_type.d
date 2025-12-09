/// Module for [UnionDataType] class
module arrow.union_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.field;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class UnionDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_union_data_type_get_type != &gidSymbolNotFound ? garrow_union_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnionDataType self()
  {
    return this;
  }

  /** */
  arrow.field.Field getField(int i)
  {
    GArrowField* _cretval;
    _cretval = garrow_union_data_type_get_field(cast(GArrowUnionDataType*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.field.Field)(cast(GArrowField*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.field.Field[] getFields()
  {
    GList* _cretval;
    _cretval = garrow_union_data_type_get_fields(cast(GArrowUnionDataType*)this._cPtr);
    auto _retval = gListToD!(arrow.field.Field, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  int getNFields()
  {
    int _retval;
    _retval = garrow_union_data_type_get_n_fields(cast(GArrowUnionDataType*)this._cPtr);
    return _retval;
  }

  /** */
  byte[] getTypeCodes()
  {
    byte* _cretval;
    size_t _cretlength;
    _cretval = garrow_union_data_type_get_type_codes(cast(GArrowUnionDataType*)this._cPtr, &_cretlength);
    byte[] _retval;

    if (_cretval)
    {
      _retval = cast(byte[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}
