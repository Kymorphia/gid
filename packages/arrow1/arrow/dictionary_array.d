/// Module for [DictionaryArray] class
module arrow.dictionary_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.dictionary_data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class DictionaryArray : arrow.array.Array
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
    return cast(void function())garrow_dictionary_array_get_type != &gidSymbolNotFound ? garrow_dictionary_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DictionaryArray self()
  {
    return this;
  }

  /**
      Get builder for [arrow.dictionary_array.DictionaryArray]
      Returns: New builder object
  */
  static DictionaryArrayGidBuilder builder()
  {
    return new DictionaryArrayGidBuilder;
  }

  /** */
  @property arrow.array.Array dictionary()
  {
    return getDictionary();
  }

  /** */
  @property arrow.array.Array indices()
  {
    return getIndices();
  }

  /** */
  this(arrow.data_type.DataType dataType, arrow.array.Array indices, arrow.array.Array dictionary)
  {
    GArrowDictionaryArray* _cretval;
    GError *_err;
    _cretval = garrow_dictionary_array_new(dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, indices ? cast(GArrowArray*)indices._cPtr(No.Dup) : null, dictionary ? cast(GArrowArray*)dictionary._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.array.Array getDictionary()
  {
    GArrowArray* _cretval;
    _cretval = garrow_dictionary_array_get_dictionary(cast(GArrowDictionaryArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.dictionary_data_type.DictionaryDataType getDictionaryDataType()
  {
    GArrowDictionaryDataType* _cretval;
    _cretval = garrow_dictionary_array_get_dictionary_data_type(cast(GArrowDictionaryArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.dictionary_data_type.DictionaryDataType)(cast(GArrowDictionaryDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getIndices()
  {
    GArrowArray* _cretval;
    _cretval = garrow_dictionary_array_get_indices(cast(GArrowDictionaryArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.dictionary_array.DictionaryArray]
class DictionaryArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{

  /** */
  T dictionary(arrow.array.Array propval)
  {
    return setProperty("dictionary", propval);
  }

  /** */
  T indices(arrow.array.Array propval)
  {
    return setProperty("indices", propval);
  }
}

/// Fluent builder for [arrow.dictionary_array.DictionaryArray]
final class DictionaryArrayGidBuilder : DictionaryArrayGidBuilderImpl!DictionaryArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DictionaryArray build()
  {
    return new DictionaryArray(cast(void*)createGObject(DictionaryArray._getGType), Yes.Take);
  }
}
