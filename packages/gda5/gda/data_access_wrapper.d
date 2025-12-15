/// Module for [DataAccessWrapper] class
module gda.data_access_wrapper;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.data_model_mixin;
import gda.types;
import gid.gid;
import gobject.object;

/** */
class DataAccessWrapper : gobject.object.ObjectWrap, gda.data_model.DataModel
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
    return cast(void function())gda_data_access_wrapper_get_type != &gidSymbolNotFound ? gda_data_access_wrapper_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataAccessWrapper self()
  {
    return this;
  }

  mixin DataModelT!();

  /**
      Creates a new #GdaDataModel object which buffers the rows of model. This object is useful
      only if model can only be accessed using cursor based method.
  
      Params:
        model = a #GdaDataModel
      Returns: a pointer to the newly created #GdaDataModel.
  */
  static gda.data_model.DataModel new_(gda.data_model.DataModel model)
  {
    GdaDataModel* _cretval;
    _cretval = gda_data_access_wrapper_new(model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      wrapper will report as many columns as mapping_size, and for each value at position 'i' in mapping,
      wrapper will report the 'i'th column, mapped to the wrapped data model column at position mapping[i].
      For example if mapping is {3, 4, 0}, then wrapper will report 3 columns, respectively mapped to the 4th,
      5th and 1st columns of the wrapped data model (as column numbers start at 0).
      
      If mapping is null, then no mapping is done and wrapper's columns will be the same as the wrapped
      data model.
      
      If a column in mapping does not exist in the wrapped data model, then it is simply ignored (no error
      reported).
      
      Please note that if wrapper has already been used and if the wrapped data model offers a cursor forward
      access mode, then this method will return false and no action will be done.
      
      If the mapping is applied, then any existing iterator will be invalid, and wrapper is reset as if it
      had just been created.
  
      Params:
        mapping = an array of #gint which represents the mapping between wrapper's columns
          and the columns of the wrapped data model
      Returns: true if the mapping actually changed
  */
  bool setMapping(int[] mapping = null)
  {
    bool _retval;
    int _mappingSize;
    if (mapping)
      _mappingSize = cast(int)mapping.length;

    auto _mapping = cast(const(int)*)mapping.ptr;
    _retval = cast(bool)gda_data_access_wrapper_set_mapping(cast(GdaDataAccessWrapper*)this._cPtr, _mapping, _mappingSize);
    return _retval;
  }
}
