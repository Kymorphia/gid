/// Module for [DictionaryDataType] class
module arrow.dictionary_data_type;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class DictionaryDataType : arrow.fixed_width_data_type.FixedWidthDataType
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
    return cast(void function())garrow_dictionary_data_type_get_type != &gidSymbolNotFound ? garrow_dictionary_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DictionaryDataType self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.dictionary_data_type.DictionaryDataType]
      Returns: New builder object
  */
  static DictionaryDataTypeGidBuilder builder() nothrow
  {
    return new DictionaryDataTypeGidBuilder;
  }

  /** */
  this(arrow.data_type.DataType indexDataType, arrow.data_type.DataType valueDataType, bool ordered) nothrow
  {
    GArrowDictionaryDataType* _cretval;
    _cretval = garrow_dictionary_data_type_new(indexDataType ? cast(GArrowDataType*)indexDataType._cPtr(No.Dup) : null, valueDataType ? cast(GArrowDataType*)valueDataType._cPtr(No.Dup) : null, ordered);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.data_type.DataType getIndexDataType() nothrow
  {
    GArrowDataType* _cretval;
    _cretval = garrow_dictionary_data_type_get_index_data_type(cast(GArrowDictionaryDataType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getValueDataType() nothrow
  {
    GArrowDataType* _cretval;
    _cretval = garrow_dictionary_data_type_get_value_data_type(cast(GArrowDictionaryDataType*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool isOrdered() nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_dictionary_data_type_is_ordered(cast(GArrowDictionaryDataType*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.dictionary_data_type.DictionaryDataType]
class DictionaryDataTypeGidBuilderImpl(T) : arrow.fixed_width_data_type.FixedWidthDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.dictionary_data_type.DictionaryDataType]
final class DictionaryDataTypeGidBuilder : DictionaryDataTypeGidBuilderImpl!DictionaryDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DictionaryDataType build() nothrow
  {
    return new DictionaryDataType(cast(void*)createGObject(DictionaryDataType._getGType), Yes.Take);
  }
}
