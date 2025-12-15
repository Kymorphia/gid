/// Module for [DataProxy] class
module gda.data_proxy;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.data_model_mixin;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.value;

/** */
class DataProxy : gobject.object.ObjectWrap, gda.data_model.DataModel
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
    return cast(void function())gda_data_proxy_get_type != &gidSymbolNotFound ? gda_data_proxy_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataProxy self()
  {
    return this;
  }

  /**
      Get `cacheChanges` property.
      Returns: Defines how changes kept in the data proxy are handled when the proxied data model
      is changed (using the "model" property). The default is to silently discard all the
      changes, but if this property is set to true, then the changes are cached.
      
      If set to true, each cached change will be re-applied to a newly set proxied data model if
      the change's number of columns match the proxied data model's number of columns and based on:
      <itemizedlist>
        <listitem><para>the contents of the proxied data model's modified row for updates and deletes</para></listitem>
        <listitem><para>the inserts are always kept</para></listitem>
      </itemizedlist>
  */
  @property bool cacheChanges()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("cache-changes");
  }

  /**
      Set `cacheChanges` property.
      Params:
        propval = Defines how changes kept in the data proxy are handled when the proxied data model
        is changed (using the "model" property). The default is to silently discard all the
        changes, but if this property is set to true, then the changes are cached.
        
        If set to true, each cached change will be re-applied to a newly set proxied data model if
        the change's number of columns match the proxied data model's number of columns and based on:
        <itemizedlist>
          <listitem><para>the contents of the proxied data model's modified row for updates and deletes</para></listitem>
          <listitem><para>the inserts are always kept</para></listitem>
        </itemizedlist>
  */
  @property void cacheChanges(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("cache-changes", propval);
  }

  /** */
  @property bool deferSync()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("defer-sync");
  }

  /** */
  @property void deferSync(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("defer-sync", propval);
  }

  /** */
  @property gda.data_model.DataModel model()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.data_model.DataModel)("model");
  }

  /** */
  @property void model(gda.data_model.DataModel propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.data_model.DataModel)("model", propval);
  }

  /** */
  @property bool prependNullEntry()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("prepend-null-entry");
  }

  /** */
  @property void prependNullEntry(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("prepend-null-entry", propval);
  }

  /** */
  @property int sampleSize()
  {
    return getSampleSize();
  }

  /** */
  @property void sampleSize(int propval)
  {
    return setSampleSize(propval);
  }

  mixin DataModelT!();

  /**
      Creates a new proxy for model. For bindings use gda_data_proxy_new_with_data_model.
  
      Params:
        model = Data model to be proxied
      Returns: a new #GdaDataProxy object
  */
  this(gda.data_model.DataModel model)
  {
    GObject* _cretval;
    _cretval = gda_data_proxy_new(model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new proxy for model. This is the preferred method to create
      #GdaDataProxy objects by bindings.
  
      Params:
        model = Data model to be proxied
      Returns: a new #GdaDataProxy object
  */
  static gda.data_proxy.DataProxy newWithDataModel(gda.data_model.DataModel model)
  {
    GdaDataProxy* _cretval;
    _cretval = gda_data_proxy_new_with_data_model(model ? cast(GdaDataModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_proxy.DataProxy)(cast(GdaDataProxy*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_data_proxy_error_quark();
    return _retval;
  }

  /**
      Alters the attributes of the value stored at (proxy_row, col) in proxy. the alter_flags
      can only contain the GDA_VALUE_ATTR_IS_NULL, GDA_VALUE_ATTR_IS_DEFAULT and GDA_VALUE_ATTR_IS_UNCHANGED
      flags (other flags are ignored).
  
      Params:
        proxyRow = A proxy row number
        col = a valid column number
        alterFlags = flags to alter the attributes
  */
  void alterValueAttributes(int proxyRow, int col, gda.types.ValueAttribute alterFlags)
  {
    gda_data_proxy_alter_value_attributes(cast(GdaDataProxy*)this._cPtr, proxyRow, col, alterFlags);
  }

  /**
      Apply all the changes stored in the proxy to the proxied data model. The changes are done row
      after row, and if an error
      occurs, then it is possible that not all the changes to all the rows have been applied.
      Returns: TRUE if no error occurred
      Throws: [DataProxyException]
  */
  bool applyAllChanges()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_proxy_apply_all_changes(cast(GdaDataProxy*)this._cPtr, &_err);
    if (_err)
      throw new DataProxyException(_err);
    return _retval;
  }

  /**
      Commits the modified data in the proxy back into the #GdaDataModel.
  
      Params:
        proxyRow = the row number to commit
      Returns: TRUE if no error occurred.
      Throws: [DataProxyException]
  */
  bool applyRowChanges(int proxyRow)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_proxy_apply_row_changes(cast(GdaDataProxy*)this._cPtr, proxyRow, &_err);
    if (_err)
      throw new DataProxyException(_err);
    return _retval;
  }

  /**
      Cancel all the changes stored in the proxy (the proxy will be reset to its state
      as it was just after creation). Note that if there are some cached changes (i.e. not applied
      to the current proxied data model), then these cached changes are not cleared (set the "cache-changes"
      property to false for this).
      Returns: TRUE if no error occurred
  */
  bool cancelAllChanges()
  {
    bool _retval;
    _retval = cast(bool)gda_data_proxy_cancel_all_changes(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /**
      Resets data at the corresponding row and column. If proxy_row corresponds to a new row, then
      that new row is deleted from proxy.
  
      Params:
        proxyRow = the row to cancel changes
        col = the column to cancel changes, or less than 0 to cancel any change on the row row
  */
  void cancelRowChanges(int proxyRow, int col)
  {
    gda_data_proxy_cancel_row_changes(cast(GdaDataProxy*)this._cPtr, proxyRow, col);
  }

  /**
      Marks the row proxy_row to be deleted
  
      Params:
        proxyRow = A proxy row number
  */
  void delete_(int proxyRow)
  {
    gda_data_proxy_delete(cast(GdaDataProxy*)this._cPtr, proxyRow);
  }

  /**
      Get the current filter expression used by proxy.
      Returns: the current filter expression or null if no filter has been set
  */
  string getFilterExpr()
  {
    const(char)* _cretval;
    _cretval = gda_data_proxy_get_filter_expr(cast(GdaDataProxy*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the total number of filtered rows in proxy if a filter has been applied. As new rows
      (rows added to the proxy and not yet added to the proxied data model) and rows to remove
      (rows marked for removal but not yet removed from the proxied data model) are also filtered,
      the returned number also contains references to new rows and rows to be removed.
      Returns: the number of filtered rows in proxy, or -1 if no filter has been applied
  */
  int getFilteredNRows()
  {
    int _retval;
    _retval = gda_data_proxy_get_filtered_n_rows(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of rows which have been modified in the proxy (the sum of rows existing in
      the proxied data model which have been modified, and new rows).
      Returns: the number of modified rows
  */
  int getNModifiedRows()
  {
    int _retval;
    _retval = gda_data_proxy_get_n_modified_rows(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of rows which have been added to proxy and which are not part of
      the proxied data model.
      Returns: the number of new rows
  */
  int getNNewRows()
  {
    int _retval;
    _retval = gda_data_proxy_get_n_new_rows(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /**
      Fetch the #GdaDataModel which proxy does proxy
      Returns: the proxied data model
  */
  gda.data_model.DataModel getProxiedModel()
  {
    GdaDataModel* _cretval;
    _cretval = gda_data_proxy_get_proxied_model(cast(GdaDataProxy*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the number of columns in the proxied data model
      Returns: the number of columns, or -1 if an error occurred
  */
  int getProxiedModelNCols()
  {
    int _retval;
    _retval = gda_data_proxy_get_proxied_model_n_cols(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of rows in the proxied data model
      Returns: the number of rows, or -1 if the number of rows is not known
  */
  int getProxiedModelNRows()
  {
    int _retval;
    _retval = gda_data_proxy_get_proxied_model_n_rows(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /**
      Get the proxy's proxied model row corresponding to proxy_row
  
      Params:
        proxyRow = A proxy row number
      Returns: the proxied model's row, or -1 if proxy row which only exists proxy
  */
  int getProxiedModelRow(int proxyRow)
  {
    int _retval;
    _retval = gda_data_proxy_get_proxied_model_row(cast(GdaDataProxy*)this._cPtr, proxyRow);
    return _retval;
  }

  /**
      Get the number of the last row to be available in proxy (in reference to the proxied data model)
      Returns: the number of the last proxied model's row.
  */
  int getSampleEnd()
  {
    int _retval;
    _retval = gda_data_proxy_get_sample_end(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /**
      Get the size of each chunk of data displayed at a time.
      Returns: the chunk (or sample) size, or 0 if chunking is disabled.
  */
  int getSampleSize()
  {
    int _retval;
    _retval = gda_data_proxy_get_sample_size(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of the first row to be available in proxy (in reference to the proxied data model)
      Returns: the number of the first proxied model's row.
  */
  int getSampleStart()
  {
    int _retval;
    _retval = gda_data_proxy_get_sample_start(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /**
      Get the attributes of the value stored at (proxy_row, col) in proxy, which
      is an ORed value of #GdaValueAttribute flags
  
      Params:
        proxyRow = a proxy row
        col = a valid proxy column
      Returns: a #GdaValueAttribute with the value's attributes at given position
  */
  gda.types.ValueAttribute getValueAttributes(int proxyRow, int col)
  {
    GdaValueAttribute _cretval;
    _cretval = gda_data_proxy_get_value_attributes(cast(GdaDataProxy*)this._cPtr, proxyRow, col);
    gda.types.ValueAttribute _retval = cast(gda.types.ValueAttribute)_cretval;
    return _retval;
  }

  /**
      Retrieve a whole list of values from the proxy data model. This function
      calls gda_data_proxy_get_value()
      for each column index specified in cols_index, and generates a #GSList on the way.
  
      Params:
        proxyRow = a proxy row
        colsIndex = array containing the columns for which the values are requested
      Returns: a new list of values (the list must be freed, not the values),
        or null if an error occurred
  */
  gobject.value.Value[] getValues(int proxyRow, int[] colsIndex)
  {
    GSList* _cretval;
    int _nCols;
    if (colsIndex)
      _nCols = cast(int)colsIndex.length;

    auto _colsIndex = cast(int*)colsIndex.ptr;
    _cretval = gda_data_proxy_get_values(cast(GdaDataProxy*)this._cPtr, proxyRow, _colsIndex, _nCols);
    auto _retval = gSListToD!(gobject.value.Value, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Tells if proxy contains any modifications not applied to the proxied data model.
      Returns: TRUE if there are some modifications in proxy
  */
  bool hasChanged()
  {
    bool _retval;
    _retval = cast(bool)gda_data_proxy_has_changed(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /** */
  bool isReadOnly()
  {
    bool _retval;
    _retval = cast(bool)gda_data_proxy_is_read_only(cast(GdaDataProxy*)this._cPtr);
    return _retval;
  }

  /**
      Tells if the row number proxy_row has changed
  
      Params:
        proxyRow = A proxy row number
      Returns: TRUE if the row has changed
  */
  bool rowHasChanged(int proxyRow)
  {
    bool _retval;
    _retval = cast(bool)gda_data_proxy_row_has_changed(cast(GdaDataProxy*)this._cPtr, proxyRow);
    return _retval;
  }

  /**
      Tells if the row number proxy_row is marked to be deleted.
  
      Params:
        proxyRow = A proxy row number
      Returns: TRUE if the row is marked to be deleted
  */
  bool rowIsDeleted(int proxyRow)
  {
    bool _retval;
    _retval = cast(bool)gda_data_proxy_row_is_deleted(cast(GdaDataProxy*)this._cPtr, proxyRow);
    return _retval;
  }

  /**
      Tells if the row number proxy_row is a row which has been inserted in proxy
      (and is thus not in the proxied data model).
  
      Params:
        proxyRow = A proxy row number
      Returns: TRUE if the row is an inserted row
  */
  bool rowIsInserted(int proxyRow)
  {
    bool _retval;
    _retval = cast(bool)gda_data_proxy_row_is_inserted(cast(GdaDataProxy*)this._cPtr, proxyRow);
    return _retval;
  }

  /**
      Sets a filter among the rows presented by proxy. The filter is defined by a filter expression
      which can be any SQL valid expression using proxy's columns. For instance if proxy has the "id" and
      "name" columns, then a filter can be "length(name) < 5" to filter only the rows where the length of the
      name is strictly inferior to 5, or "id >= 1000 and id < 2000 order by name limit 50" to filter only the rows where the id
      is between 1000 and 2000, ordered by name and limited to 50 rows.
      
      Note about column names: real column names can be used (double quoted if necessary), but columns can also be named
      "_&lt;column number&gt;" with column numbers starting at 1.
      
      Note that any previous filter expression is replaced with the new filter_expr if no error occurs
      (if an error occurs, then any previous filter is left unchanged).
  
      Params:
        filterExpr = an SQL based expression which will filter the contents of proxy, or null to remove any previous filter
      Returns: TRUE if no error occurred
      Throws: [DataProxyException]
  */
  bool setFilterExpr(string filterExpr = null)
  {
    bool _retval;
    const(char)* _filterExpr = filterExpr.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_data_proxy_set_filter_expr(cast(GdaDataProxy*)this._cPtr, _filterExpr, &_err);
    if (_err)
      throw new DataProxyException(_err);
    return _retval;
  }

  /**
      Orders by the col column
  
      Params:
        col = the column number to order from
      Returns: TRUE if no error occurred
      Throws: [DataProxyException]
  */
  bool setOrderingColumn(int col)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_proxy_set_ordering_column(cast(GdaDataProxy*)this._cPtr, col, &_err);
    if (_err)
      throw new DataProxyException(_err);
    return _retval;
  }

  /**
      Sets the size of each chunk of data to display: the maximum number of rows which
      can be "displayed" at a time (the maximum number of rows which proxy pretends to have).
      The default value is arbitrary 300 as it is big enough to
      be able to display quite a lot of data, but small enough to avoid too much data
      displayed at the same time.
      
      Note: the rows which have been added but not yet committed will always be displayed
      regardless of the current chunk of data, and the modified rows which are not visible
      when the displayed chunk of data changes are still held as modified rows.
      
      To remove the chunking of the data to display, simply pass sample_size the `0` value.
  
      Params:
        sampleSize = the requested size of a chunk, or 0
  */
  void setSampleSize(int sampleSize)
  {
    gda_data_proxy_set_sample_size(cast(GdaDataProxy*)this._cPtr, sampleSize);
  }

  /**
      Sets the number of the first row to be available in proxy (in reference to the proxied data model)
  
      Params:
        sampleStart = the number of the first row to be displayed
  */
  void setSampleStart(int sampleStart)
  {
    gda_data_proxy_set_sample_start(cast(GdaDataProxy*)this._cPtr, sampleStart);
  }

  /**
      Remove the "to be deleted" mark at the row proxy_row, if it existed.
  
      Params:
        proxyRow = A proxy row number
  */
  void undelete(int proxyRow)
  {
    gda_data_proxy_undelete(cast(GdaDataProxy*)this._cPtr, proxyRow);
  }

  /**
      Connect to `FilterChanged` signal.
  
      Gets emitted when proxy's filter has been changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.data_proxy.DataProxy dataProxy))
  
          `dataProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFilterChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.data_proxy.DataProxy)))
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
    return connectSignalClosure("filter-changed", closure, after);
  }

  /**
      Connect to `RowChangesApplied` signal.
  
      Gets emitted when proxy has committed a row change to the proxied data model.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int row, int proxiedRow, gda.data_proxy.DataProxy dataProxy))
  
          `row` the proxy's row (optional)
  
          `proxiedRow` the proxied data model's row (optional)
  
          `dataProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowChangesApplied(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gda.data_proxy.DataProxy)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-changes-applied", closure, after);
  }

  /**
      Connect to `RowDeleteChanged` signal.
  
      Gets emitted whenever a row has been marked to be deleted, or has been unmarked to be deleted
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int row, bool toBeDeleted, gda.data_proxy.DataProxy dataProxy))
  
          `row` the concerned proxy's row (optional)
  
          `toBeDeleted` tells if the row is marked to be deleted (optional)
  
          `dataProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowDeleteChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gda.data_proxy.DataProxy)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-delete-changed", closure, after);
  }

  /**
      Connect to `SampleChanged` signal.
  
      Gets emitted whenever proxy's sample size has been changed. sample_start and sample_end are
      in reference to the proxied data model.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int sampleStart, int sampleEnd, gda.data_proxy.DataProxy dataProxy))
  
          `sampleStart` the first row of the sample (optional)
  
          `sampleEnd` the last row of the sample (optional)
  
          `dataProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSampleChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gda.data_proxy.DataProxy)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("sample-changed", closure, after);
  }

  /**
      Connect to `SampleSizeChanged` signal.
  
      Gets emitted whenever proxy's sample size has been changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int sampleSize, gda.data_proxy.DataProxy dataProxy))
  
          `sampleSize` the new sample size (optional)
  
          `dataProxy` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSampleSizeChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.data_proxy.DataProxy)))
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
    return connectSignalClosure("sample-size-changed", closure, after);
  }

  /**
      Connect to `ValidateRowChanges` signal.
  
      Gets emitted when proxy is about to commit a row change to the proxied data model. If any
      callback returns a non null value, then the change commit fails with the returned #GError
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D glib.error.ErrorWrap callback(int row, int proxiedRow, gda.data_proxy.DataProxy dataProxy))
  
          `row` the proxy's row (optional)
  
          `proxiedRow` the proxied data model's row (optional)
  
          `dataProxy` the instance the signal is connected to (optional)
  
          `Returns` a new #GError if validation failed, or null
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValidateRowChanges(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == glib.error.ErrorWrap)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gda.data_proxy.DataProxy)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(glib.error.ErrorWrap)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("validate-row-changes", closure, after);
  }
}

class DataProxyException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.data_proxy.DataProxy.errorQuark, cast(int)code, msg);
  }

  alias Code = DataProxyError;
}
