/// Module for [DataModelIter] class
module gda.data_model_iter;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.holder;
import gda.set;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.value;

/** */
class DataModelIter : gda.set.Set
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
    return cast(void function())gda_data_model_iter_get_type != &gidSymbolNotFound ? gda_data_model_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataModelIter self()
  {
    return this;
  }

  /** */
  @property int currentRow()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("current-row");
  }

  /** */
  @property void currentRow(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("current-row", propval);
  }

  /** */
  @property gda.data_model.DataModel dataModel()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.data_model.DataModel)("data-model");
  }

  /** */
  @property void dataModel(gda.data_model.DataModel propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.data_model.DataModel)("data-model", propval);
  }

  /** */
  @property gda.data_model.DataModel forcedModel()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.data_model.DataModel)("forced-model");
  }

  /** */
  @property void forcedModel(gda.data_model.DataModel propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.data_model.DataModel)("forced-model", propval);
  }

  /** */
  @property bool updateModel()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("update-model");
  }

  /** */
  @property void updateModel(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("update-model", propval);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_data_model_iter_error_quark();
    return _retval;
  }

  /**
      Get the column number in the #GdaDataModel for which iter is an iterator as
      represented by the param parameter
  
      Params:
        param = a #GdaHolder object, listed in iter
      Returns: the column number, or param is not valid
  
      Deprecated: not very useful
  */
  int getColumnForParam(gda.holder.Holder param)
  {
    int _retval;
    _retval = gda_data_model_iter_get_column_for_param(cast(GdaDataModelIter*)this._cPtr, param ? cast(GdaHolder*)param._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Fetch a pointer to the #GdaHolder object which is synchronized with data at
      column col
  
      Params:
        col = the requested column
      Returns: the #GdaHolder, or null if an error occurred
  */
  gda.holder.Holder getHolderForField(int col)
  {
    GdaHolder* _cretval;
    _cretval = gda_data_model_iter_get_holder_for_field(cast(GdaDataModelIter*)this._cPtr, col);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.holder.Holder)(cast(GdaHolder*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the row which iter represents in the data model
      Returns: the row number, or -1 if iter is invalid
  */
  int getRow()
  {
    int _retval;
    _retval = gda_data_model_iter_get_row(cast(GdaDataModelIter*)this._cPtr);
    return _retval;
  }

  /**
      Get the value stored at the column col in iter. The returned value must not be modified.
  
      Params:
        col = the requested column
      Returns: the #GValue, or null if the value could not be fetched
  */
  gobject.value.Value getValueAt(int col)
  {
    const(GValue)* _cretval;
    _cretval = gda_data_model_iter_get_value_at(cast(GdaDataModelIter*)this._cPtr, col);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the value stored at the column col in iter. The returned value must not be modified.
  
      Params:
        col = the requested column
      Returns: the #GValue, or null if the value could not be fetched
      Throws: [DataModelIterException]
  */
  gobject.value.Value getValueAtE(int col)
  {
    const(GValue)* _cretval;
    GError *_err;
    _cretval = gda_data_model_iter_get_value_at_e(cast(GdaDataModelIter*)this._cPtr, col, &_err);
    if (_err)
      throw new DataModelIterException(_err);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the value stored at the column field_name in iter
  
      Params:
        fieldName = the requested column name
      Returns: the #GValue, or null
  */
  gobject.value.Value getValueForField(string fieldName)
  {
    const(GValue)* _cretval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    _cretval = gda_data_model_iter_get_value_for_field(cast(GdaDataModelIter*)this._cPtr, _fieldName);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Declare all the parameters in iter invalid, without modifying the
      #GdaDataModel iter is for or changing the row it represents. This method
      is for internal usage. Note that for [gda.data_model_iter.DataModelIter.isValid] to return false,
      it is also necessary to set the "current-row" property to -1.
  */
  void invalidateContents()
  {
    gda_data_model_iter_invalidate_contents(cast(GdaDataModelIter*)this._cPtr);
  }

  /**
      Tells if iter is a valid iterator (if it actually corresponds to a valid row in the model)
      Returns: TRUE if iter is valid
  */
  override bool isValid()
  {
    bool _retval;
    _retval = cast(bool)gda_data_model_iter_is_valid(cast(GdaDataModelIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves iter one row further than where it already is
      (synchronizes the values of the parameters in iter with the values at the new row).
      
      If the iterator was on the data model's last row, then it can't be moved forward
      anymore, and the returned value is false; note also that the "current-row" property
      is set to -1 (which means that [gda.data_model_iter.DataModelIter.isValid] would return false)
      
      This function can return false if it was not allowed to be moved (as it emits the
      "validate-set" signal before being moved).
      
      When this function returns true, then iter has actually been moved to the next row,
      but some values may not have been read correctly in the row, in which case the
      correcsponding #GdaHolder will be left invalid.
      Returns: true if the iterator is now at the next row
  */
  bool moveNext()
  {
    bool _retval;
    _retval = cast(bool)gda_data_model_iter_move_next(cast(GdaDataModelIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves iter one row before where it already is (synchronizes the values of the parameters in iter
      with the values at the new row).
      
      If the iterator was on the data model's first row, then it can't be moved backwards
      anymore, and the returned value is false; note also that the "current-row" property
      is set to -1 (which means that [gda.data_model_iter.DataModelIter.isValid] would return false).
      
      This function can return false if it was not allowed to be moved (as it emits the
      "validate-set" signal before being moved).
      
      When this function returns true, then iter has actually been moved to the next row,
      but some values may not have been read correctly in the row, in which case the
      correcsponding #GdaHolder will be left invalid.
      Returns: true if the iterator is now at the previous row
  */
  bool movePrev()
  {
    bool _retval;
    _retval = cast(bool)gda_data_model_iter_move_prev(cast(GdaDataModelIter*)this._cPtr);
    return _retval;
  }

  /**
      Synchronizes the values of the parameters in iter with the values at the row row.
      
      If row is not a valid row, then the returned value is false, and the "current-row"
      property is set to -1 (which means that [gda.data_model_iter.DataModelIter.isValid] would return false),
      with the exception that if row is -1, then the returned value is true.
      
      This function can return false if it was not allowed to be moved (as it emits the
      "validate-set" signal before being moved).
      
      When this function returns true, then iter has actually been moved to the next row,
      but some values may not have been read correctly in the row, in which case the
      correcsponding #GdaHolder will be left invalid.
  
      Params:
        row = the row to set iter to
      Returns: true if no error occurred
  */
  bool moveToRow(int row)
  {
    bool _retval;
    _retval = cast(bool)gda_data_model_iter_move_to_row(cast(GdaDataModelIter*)this._cPtr, row);
    return _retval;
  }

  /**
      Sets a value in iter, at the column specified by col
  
      Params:
        col = the column number
        value = a #GValue (not null)
      Returns: TRUE if no error occurred
      Throws: [DataModelIterException]
  */
  bool setValueAt(int col, gobject.value.Value value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_model_iter_set_value_at(cast(GdaDataModelIter*)this._cPtr, col, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new DataModelIterException(_err);
    return _retval;
  }

  /**
      Connect to `EndOfData` signal.
  
      Gets emitted when iter has reached the end of available data (which means the previous
      row it was on was the last one).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.data_model_iter.DataModelIter dataModelIter))
  
          `dataModelIter` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEndOfData(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.data_model_iter.DataModelIter)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("end-of-data", closure, after);
  }

  /**
      Connect to `RowChanged` signal.
  
      Gets emitted when the row iter is currently pointing has changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int row, gda.data_model_iter.DataModelIter dataModelIter))
  
          `row` the new iter's row (optional)
  
          `dataModelIter` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.data_model_iter.DataModelIter)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-changed", closure, after);
  }
}

class DataModelIterException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.data_model_iter.DataModelIter.errorQuark, cast(int)code, msg);
  }

  alias Code = DataModelIterError;
}
