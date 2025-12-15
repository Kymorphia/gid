/// Module for [DataComparator] class
module gda.data_comparator;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.diff;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;

/** */
class DataComparator : gobject.object.ObjectWrap
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
    return cast(void function())gda_data_comparator_get_type != &gidSymbolNotFound ? gda_data_comparator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataComparator self()
  {
    return this;
  }

  /** */
  @property gda.data_model.DataModel newModel()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.data_model.DataModel)("new-model");
  }

  /** */
  @property void newModel(gda.data_model.DataModel propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.data_model.DataModel)("new-model", propval);
  }

  /** */
  @property gda.data_model.DataModel oldModel()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.data_model.DataModel)("old-model");
  }

  /** */
  @property void oldModel(gda.data_model.DataModel propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.data_model.DataModel)("old-model", propval);
  }

  /**
      Creates a new comparator to compute the differences from old_model to new_model: if one applies
      all the computed differences (as #GdaDiff structures) to old_model, the resulting data model
      should have the same contents as new_model.
  
      Params:
        oldModel = Data model to which the modifications should be applied
        newModel = Target data model.
      Returns: a new #GdaDataComparator object
  */
  this(gda.data_model.DataModel oldModel, gda.data_model.DataModel newModel)
  {
    GObject* _cretval;
    _cretval = gda_data_comparator_new(oldModel ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)oldModel)._cPtr(No.Dup) : null, newModel ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)newModel)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_data_comparator_error_quark();
    return _retval;
  }

  /**
      Actually computes the differences between the data models for which comp is defined.
      
      For each difference computed, stored in a #GdaDiff structure, the "diff-computed" signal is emitted.
      If one connects to this signal and returns FALSE in the signal handler, then computing differences will be
      stopped and an error will be returned.
      Returns: TRUE if all the differences have been successfully computed, and FALSE if an error occurred
      Throws: [DataComparatorException]
  */
  bool computeDiff()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_comparator_compute_diff(cast(GdaDataComparator*)this._cPtr, &_err);
    if (_err)
      throw new DataComparatorException(_err);
    return _retval;
  }

  /**
      Get a pointer to the #GdaDiff structure representing the difference which number is pos
  
      Params:
        pos = the requested difference number (starting at 0)
      Returns: a pointer to a #GdaDiff, or null if pos is invalid
  */
  gda.diff.Diff getDiff(int pos)
  {
    const(GdaDiff)* _cretval;
    _cretval = gda_data_comparator_get_diff(cast(GdaDataComparator*)this._cPtr, pos);
    auto _retval = _cretval ? new gda.diff.Diff(cast(GdaDiff*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the number of differences as computed by the last time [gda.data_comparator.DataComparator.computeDiff] was called.
      Returns: the number of computed differences
  */
  int getNDiffs()
  {
    int _retval;
    _retval = gda_data_comparator_get_n_diffs(cast(GdaDataComparator*)this._cPtr);
    return _retval;
  }

  /**
      Defines the columns which will be used as a key when searching data. This is not mandatory but
      will speed things up as less data will be processed.
  
      Params:
        colNumbers = an array of nb_cols values
  */
  void setKeyColumns(int[] colNumbers)
  {
    int _nbCols;
    if (colNumbers)
      _nbCols = cast(int)colNumbers.length;

    auto _colNumbers = cast(const(int)*)colNumbers.ptr;
    gda_data_comparator_set_key_columns(cast(GdaDataComparator*)this._cPtr, _colNumbers, _nbCols);
  }

  /**
      Connect to `DiffComputed` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(void* object, gda.data_comparator.DataComparator dataComparator))
  
          `object`  (optional)
  
          `dataComparator` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDiffComputed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.data_comparator.DataComparator)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("diff-computed", closure, after);
  }
}

class DataComparatorException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.data_comparator.DataComparator.errorQuark, cast(int)code, msg);
  }

  alias Code = DataComparatorError;
}
