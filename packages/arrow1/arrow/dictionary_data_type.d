/// Module for [DictionaryDataType] class
module arrow.dictionary_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class DictionaryDataType : arrow.fixed_width_data_type.FixedWidthDataType
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_dictionary_data_type_get_type != &gidSymbolNotFound ? garrow_dictionary_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DictionaryDataType self()
  {
    return this;
  }

  /** */
  this(arrow.data_type.DataType indexDataType, arrow.data_type.DataType valueDataType, bool ordered)
  {
    GArrowDictionaryDataType* _cretval;
    _cretval = garrow_dictionary_data_type_new(indexDataType ? cast(GArrowDataType*)indexDataType.cPtr(No.Dup) : null, valueDataType ? cast(GArrowDataType*)valueDataType.cPtr(No.Dup) : null, ordered);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.data_type.DataType getIndexDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_dictionary_data_type_get_index_data_type(cast(GArrowDictionaryDataType*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_dictionary_data_type_get_value_data_type(cast(GArrowDictionaryDataType*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool isOrdered()
  {
    bool _retval;
    _retval = garrow_dictionary_data_type_is_ordered(cast(GArrowDictionaryDataType*)cPtr);
    return _retval;
  }
}
