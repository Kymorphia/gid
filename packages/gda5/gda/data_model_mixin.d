/// Module for [DataModel] interface mixin
module gda.data_model_mixin;

public import gda.data_model_iface_proxy;
public import gda.c.functions;
public import gda.c.types;
public import gda.column;
public import gda.data_model_array;
public import gda.data_model_iter;
public import gda.set;
public import gda.types;
public import gid.gid;
public import glib.error;
public import glib.types;
public import gobject.dclosure;
public import gobject.object;
public import gobject.types;
public import gobject.value;
public import libxml2.types;

/** */
template DataModelT()
{


  /**
      Adds the data from an XML node to the given data model (see the DTD for that node
      in the $prefix/share/libgda/dtd/libgda-array.dtd file).
      
      Upon errors FALSE will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
  
      Params:
        node = an XML node representing a &lt;gda_array_data&gt; XML node.
      Returns: true if successful, false otherwise.
      Throws: [DataModelException]
  */
  override bool addDataFromXmlNode(libxml2.types.NodePtr node)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_model_add_data_from_xml_node(cast(GdaDataModel*)this._cPtr, node, &_err);
    if (_err)
      throw new DataModelException(_err);
    return _retval;
  }

  /**
      Appends a row to the data model (the new row will possibly have NULL values for all columns,
      or some other values depending on the data model implementation)
      
      Upon errors -1 will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
      Returns: the number of the added row, or -1 if an error occurred
      Throws: [DataModelException]
  */
  override int appendRow()
  {
    int _retval;
    GError *_err;
    _retval = gda_data_model_append_row(cast(GdaDataModel*)this._cPtr, &_err);
    if (_err)
      throw new DataModelException(_err);
    return _retval;
  }

  /**
      Appends a row to the given data model. If any value in values is actually null, then
      it is considered as a default value. If values is null then all values are set to their default value.
      
      Upon errors -1 will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
  
      Params:
        values = #GList of #GValue* representing the row to add.  The
                   length must match model's column count.  These #GValue
              are value-copied (the user is still responsible for freeing them).
      Returns: the number of the added row, or -1 if an error occurred
      Throws: [DataModelException]
  */
  override int appendValues(gobject.value.Value[] values = null)
  {
    int _retval;
    auto _values = gListFromD!(gobject.value.Value)(values);
    scope(exit) containerFree!(const(GList)*, gobject.value.Value, GidOwnership.None)(_values);
    GError *_err;
    _retval = gda_data_model_append_values(cast(GdaDataModel*)this._cPtr, _values, &_err);
    if (_err)
      throw new DataModelException(_err);
    return _retval;
  }

  /**
      Makes a copy of src into a new #GdaDataModelArray object
      Returns: a new data model, or null if an error occurred
      Throws: [DataModelException]
  */
  override gda.data_model_array.DataModelArray arrayCopyModel()
  {
    GdaDataModelArray* _cretval;
    GError *_err;
    _cretval = gda_data_model_array_copy_model(cast(GdaDataModel*)this._cPtr, &_err);
    if (_err)
      throw new DataModelException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model_array.DataModelArray)(cast(GdaDataModelArray*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Like [gda.data_model.DataModel.arrayCopyModel], makes a copy of src, but copies only some
      columns.
  
      Params:
        cols = array of src's columns to copy into the new array, not null
      Returns: a new data model, or null if an error occurred
      Throws: [DataModelException]
  */
  override gda.data_model_array.DataModelArray arrayCopyModelExt(int[] cols)
  {
    GdaDataModelArray* _cretval;
    int _ncols;
    if (cols)
      _ncols = cast(int)cols.length;

    auto _cols = cast(int*)cols.ptr;
    GError *_err;
    _cretval = gda_data_model_array_copy_model_ext(cast(GdaDataModel*)this._cPtr, _ncols, _cols, &_err);
    if (_err)
      throw new DataModelException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model_array.DataModelArray)(cast(GdaDataModelArray*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new iterator object #GdaDataModelIter object which can be used to iterate through
      rows in model. The new #GdaDataModelIter does not hold any reference to model (ie. if model
      is destroyed at some point, the new iterator will become useless but in any case it will not prevent
      the data model from being destroyed).
      
      Depending on the data model's implementation, a new #GdaDataModelIter object may be created,
      or a reference to an already existing #GdaDataModelIter may be returned. For example if model only
      supports being accessed using a forward moving cursor (say a the result of a SELECT executed by SQLite
      with a cursor access mode specified), then this method will always return the same iterator.
      
      If a new #GdaDataModelIter is created, then the row it represents is undefined.
      
      For models which can be accessed
      randomly, any row can be set using [gda.data_model_iter.DataModelIter.moveToRow],
      and for models which are accessible sequentially only then use
      [gda.data_model_iter.DataModelIter.moveNext] (and [gda.data_model_iter.DataModelIter.movePrev] if
      supported).
      
      Note: for the #GdaDataProxy data model (which proxies any #GdaDataModel for modifications and
      has twice the number of columns of the proxied data model), this method will create an iterator
      in which only the columns of the proxied data model appear. If you need to have a #GdaDataModelIter
      in which all the proxy's columns appear, create it using:
      <programlisting><![CDATA[iter = g_object_new (GDA_TYPE_DATA_MODEL_ITER, "data-model", proxy, NULL);]]></programlisting>
      Returns: a #GdaDataModelIter object, or null if an error occurred
  */
  override gda.data_model_iter.DataModelIter createIter()
  {
    GdaDataModelIter* _cretval;
    _cretval = gda_data_model_create_iter(cast(GdaDataModel*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model_iter.DataModelIter)(cast(GdaDataModelIter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Queries the underlying data model implementation for a description
      of a given column. That description is returned in the form of
      a #GdaColumn structure, which contains all the information
      about the given column in the data model.
      
      WARNING: the returned #GdaColumn object belongs to the model model and
      and should not be destroyed; any modification will affect the whole data model.
  
      Params:
        col = column number.
      Returns: the description of the column.
  */
  override gda.column.Column describeColumn(int col)
  {
    GdaColumn* _cretval;
    _cretval = gda_data_model_describe_column(cast(GdaDataModel*)this._cPtr, col);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.column.Column)(cast(GdaColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Dumps a textual representation of the model to the to_stream stream
      
      The following environment variables can affect the resulting output:
      <itemizedlist>
        <listitem><para>GDA_DATA_MODEL_DUMP_ROW_NUMBERS: if set, the first column of the output will contain row numbers</para></listitem>
        <listitem><para>GDA_DATA_MODEL_DUMP_ATTRIBUTES: if set, also dump the data model's columns' types and value's attributes</para></listitem>
        <listitem><para>GDA_DATA_MODEL_DUMP_TITLE: if set, also dump the data model's title</para></listitem>
        <listitem><para>GDA_DATA_MODEL_NULL_AS_EMPTY: if set, replace the 'NULL' string with an empty string for NULL values </para></listitem>
        <listitem><para>GDA_DATA_MODEL_DUMP_TRUNCATE: if set to a numeric value, truncates the output to the width specified by the value. If the value is -1 then the actual terminal size (if it can be determined) is used</para></listitem>
      </itemizedlist>
  
      Params:
        toStream = where to dump the data model
  */
  override void dump(void* toStream = null)
  {
    gda_data_model_dump(cast(GdaDataModel*)this._cPtr, toStream);
  }

  /**
      Dumps a textual representation of the model into a new string. The main differences with [gda.data_model.DataModel.exportToString] are that
      the formatting options are passed using environment variables, and that the data is dumped regardless of the user locale (e.g. dates
      are not formatted according to the locale).
      
      The following environment variables can affect the resulting output:
      <itemizedlist>
        <listitem><para>GDA_DATA_MODEL_DUMP_ROW_NUMBERS: if set, the first column of the output will contain row numbers</para></listitem>
        <listitem><para>GDA_DATA_MODEL_DUMP_TITLE: if set, also dump the data model's title</para></listitem>
        <listitem><para>GDA_DATA_MODEL_NULL_AS_EMPTY: if set, replace the 'NULL' string with an empty string for NULL values </para></listitem>
        <listitem><para>GDA_DATA_MODEL_DUMP_TRUNCATE: if set to a numeric value, truncates the output to the width specified by the value. If the value is -1 then the actual terminal size (if it can be determined) is used</para></listitem>
      </itemizedlist>
      Returns: a new string.
  */
  override string dumpAsString()
  {
    char* _cretval;
    _cretval = gda_data_model_dump_as_string(cast(GdaDataModel*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Exports data contained in model to the file file; the format is specified using the format argument. Note that
      the date format used is the one used by the connection from which the data model has been made (as the result of a
      SELECT statement), or, for other kinds of data models, the default format (refer to [gda.data_handler.DataHandler.getDefault]) unless
      the "cnc" property has been set and points to a #GdaConnection to use that connection's date format.
      
      Specifically, the parameters in the options list can be:
      <itemizedlist>
        <listitem><para>"SEPARATOR": a string value of which the first character is used as a separator in case of CSV export
                  </para></listitem>
        <listitem><para>"QUOTE": a string value of which the first character is used as a quote character in case of CSV export. The
                  default if not specified is the double quote character</para></listitem>
        <listitem><para>"FIELD_QUOTE": a boolean value which can be set to FALSE if no quote around the individual fields
                  is requeted, in case of CSV export</para></listitem>
        <listitem><para>"NAMES_ON_FIRST_LINE": a boolean value which, if set to true and in case of a CSV or `GDA_DATA_MODEL_IO_TEXT_TABLE` export, will add a first line with the name each exported field (note that "FIELDS_NAME" is also accepted as a synonym)</para></listitem>
        <listitem><para>"NAME": a string value used to name the exported data if the export format is XML or `GDA_DATA_MODEL_IO_TEXT_TABLE`</para></listitem>
        <listitem><para>"OVERWRITE": a boolean value which tells if the file must be over-written if it already exists.</para></listitem>
        <listitem><para>"NULL_AS_EMPTY": a boolean value which, if set to true and in case of a CSV or `GDA_DATA_MODEL_IO_TEXT_TABLE` export, will render and NULL value as the empty string (instead of the 'NULL' string)</para></listitem>
        <listitem><para>"INVALID_AS_NULL": a boolean value which, if set to true, considers any invalid data (for example for the date related values) as NULL</para></listitem>
        <listitem><para>"COLUMN_SEPARATORS": a boolean value which, if set to true, adds a separators lines between each column, if the export format is `GDA_DATA_MODEL_IO_TEXT_TABLE`
                  </para></listitem>
        <listitem><para>"SEPARATOR_LINE": a boolean value which, if set to true, adds an horizontal line between column titles and values, if the export format is `GDA_DATA_MODEL_IO_TEXT_TABLE`
                  </para></listitem>
        <listitem><para>"ROW_NUMBERS": a boolean value which, if set to true, prepends a column with row numbers, if the export format is `GDA_DATA_MODEL_IO_TEXT_TABLE`
                  </para></listitem>
        <listitem><para>"MAX_WIDTH": an integer value which, if greater than 0, makes all the lines truncated to have at most that number of characters, if the export format is `GDA_DATA_MODEL_IO_TEXT_TABLE`
                  </para></listitem>
      </itemizedlist>
      
      Warning: this function uses a #GdaDataModelIter iterator, and if model does not offer a random access
      (check using [gda.data_model.DataModel.getAccessFlags]), the iterator will be the same as normally used
      to access data in model previously to calling this method, and this iterator will be moved (point to
      another row).
      
      Upon errors false will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
  
      Params:
        format = the format in which to export data
        file = the filename to export to
        cols = an array containing which columns of model will be exported, or null for all columns
        rows = an array containing which rows of model will be exported, or null for all rows
        options = list of options for the export
      Returns: TRUE if no error occurred
      Throws: [DataModelException]
  */
  override bool exportToFile(gda.types.DataModelIOFormat format, string file, int[] cols, int[] rows, gda.set.Set options)
  {
    bool _retval;
    const(char)* _file = file.toCString(No.Alloc);
    int _nbCols;
    if (cols)
      _nbCols = cast(int)cols.length;

    auto _cols = cast(const(int)*)cols.ptr;
    int _nbRows;
    if (rows)
      _nbRows = cast(int)rows.length;

    auto _rows = cast(const(int)*)rows.ptr;
    GError *_err;
    _retval = cast(bool)gda_data_model_export_to_file(cast(GdaDataModel*)this._cPtr, format, _file, _cols, _nbCols, _rows, _nbRows, options ? cast(GdaSet*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new DataModelException(_err);
    return _retval;
  }

  /**
      Exports data contained in model to a string; the format is specified using the format argument, see the
      [gda.data_model.DataModel.exportToFile] documentation for more information about the options argument (except for the
      "OVERWRITE" option).
      
      Warning: this function uses a #GdaDataModelIter iterator, and if model does not offer a random access
      (check using [gda.data_model.DataModel.getAccessFlags]), the iterator will be the same as normally used
      to access data in model previously to calling this method, and this iterator will be moved (point to
      another row).
      
      See also [gda.data_model.DataModel.dumpAsString];
  
      Params:
        format = the format in which to export data
        cols = an array containing which columns of model will be exported, or null for all columns
        rows = an array containing which rows of model will be exported, or null for all rows
        options = list of options for the export
      Returns: a new string, use [glib.global.gfree] when no longer needed
  */
  override string exportToString(gda.types.DataModelIOFormat format, int[] cols, int[] rows, gda.set.Set options)
  {
    char* _cretval;
    int _nbCols;
    if (cols)
      _nbCols = cast(int)cols.length;

    auto _cols = cast(const(int)*)cols.ptr;
    int _nbRows;
    if (rows)
      _nbRows = cast(int)rows.length;

    auto _rows = cast(const(int)*)rows.ptr;
    _cretval = gda_data_model_export_to_string(cast(GdaDataModel*)this._cPtr, format, _cols, _nbCols, _rows, _nbRows, options ? cast(GdaSet*)options._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Disables notifications of changes on the given data model. To
      re-enable notifications again, you should call the
      #gda_data_model_thaw function.
  */
  override void freeze()
  {
    gda_data_model_freeze(cast(GdaDataModel*)this._cPtr);
  }

  /**
      Get the attributes of model such as how to access the data it contains if it's modifiable, etc.
      Returns: an ORed value of #GdaDataModelAccessFlags flags
  */
  override gda.types.DataModelAccessFlags getAccessFlags()
  {
    GdaDataModelAccessFlags _cretval;
    _cretval = gda_data_model_get_access_flags(cast(GdaDataModel*)this._cPtr);
    gda.types.DataModelAccessFlags _retval = cast(gda.types.DataModelAccessFlags)_cretval;
    return _retval;
  }

  /**
      Get the attributes of the value stored at (row, col) in model, which
      is an ORed value of #GdaValueAttribute flags. As a special case, if
      row is -1, then the attributes returned correspond to a "would be" value
      if a row was added to model.
  
      Params:
        col = a valid column number
        row = a valid row number, or -1
      Returns: the attributes as an ORed value of #GdaValueAttribute
  */
  override gda.types.ValueAttribute getAttributesAt(int col, int row)
  {
    GdaValueAttribute _cretval;
    _cretval = gda_data_model_get_attributes_at(cast(GdaDataModel*)this._cPtr, col, row);
    gda.types.ValueAttribute _retval = cast(gda.types.ValueAttribute)_cretval;
    return _retval;
  }

  /**
      Get the index of the first column named name in model.
  
      Params:
        name = a column name
      Returns: the column index, or -1 if no column named name was found
  */
  override int getColumnIndex(string name)
  {
    int _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = gda_data_model_get_column_index(cast(GdaDataModel*)this._cPtr, _name);
    return _retval;
  }

  /** */
  override string getColumnName(int col)
  {
    const(char)* _cretval;
    _cretval = gda_data_model_get_column_name(cast(GdaDataModel*)this._cPtr, col);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  override string getColumnTitle(int col)
  {
    const(char)* _cretval;
    _cretval = gda_data_model_get_column_title(cast(GdaDataModel*)this._cPtr, col);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  override int getNColumns()
  {
    int _retval;
    _retval = gda_data_model_get_n_columns(cast(GdaDataModel*)this._cPtr);
    return _retval;
  }

  /** */
  override int getNRows()
  {
    int _retval;
    _retval = gda_data_model_get_n_rows(cast(GdaDataModel*)this._cPtr);
    return _retval;
  }

  /**
      Returns the status of notifications changes on the given data model.
      Returns: 
  */
  override bool getNotify()
  {
    bool _retval;
    _retval = cast(bool)gda_data_model_get_notify(cast(GdaDataModel*)this._cPtr);
    return _retval;
  }

  /**
      Upon errors null will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
      
      This method is similar to [gda.data_model.DataModel.getValueAt], except that it also allows one to specify the expected
      #GType of the value to get: if the data model returned a #GValue of a type different than the expected one, then
      this method returns null and an error code.
      
      Note: the same limitations and usage instructions apply as for [gda.data_model.DataModel.getValueAt].
      
      Upon errors null will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
  
      Params:
        col = a valid column number.
        row = a valid row number.
        expectedType = the expected data type of the returned value
        nullok = if TRUE, then NULL values (value of type `GDA_TYPE_NULL`) will not generate any error
      Returns: a #GValue containing the value stored in the given
        position, or null on error (out-of-bound position, wrong data type, etc).
      Throws: [DataModelException]
  */
  override gobject.value.Value getTypedValueAt(int col, int row, gobject.types.GType expectedType, bool nullok)
  {
    const(GValue)* _cretval;
    GError *_err;
    _cretval = gda_data_model_get_typed_value_at(cast(GdaDataModel*)this._cPtr, col, row, expectedType, nullok, &_err);
    if (_err)
      throw new DataModelException(_err);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the data stored in the given position (identified by
      the col and row parameters) on a data model.
      
      Upon errors null will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
      
      This is the main function for accessing data in a model which allows random access to its data.
      To access data in a data model using a cursor, use a #GdaDataModelIter object, obtained using
      [gda.data_model.DataModel.createIter].
      
      Note1: the returned #GValue must not be modified directly (unexpected behaviours may
      occur if you do so).
      
      Note2: the returned value may become invalid as soon as any Libgda part is executed again,
      which means if you want to keep the value, a copy must be made, however it will remain valid
      as long as the only Libgda usage is calling [gda.data_model.DataModel.getValueAt] for different values
      of the same row.
      
      If you want to modify a value stored in a #GdaDataModel, use the [gda.data_model.DataModel.setValueAt] or
      [gda.data_model.DataModel.setValues] methods.
      
      Upon errors null will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
  
      Params:
        col = a valid column number.
        row = a valid row number.
      Returns: a #GValue containing the value stored in the given
        position, or null on error (out-of-bound position, etc).
      Throws: [DataModelException]
  */
  override gobject.value.Value getValueAt(int col, int row)
  {
    const(GValue)* _cretval;
    GError *_err;
    _cretval = gda_data_model_get_value_at(cast(GdaDataModel*)this._cPtr, col, row, &_err);
    if (_err)
      throw new DataModelException(_err);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Moves iter to the row number given by row.
  
      Params:
        iter = a #GdaDataModelIter object.
        row = a row to point to with iter
      Returns: 
  
      Deprecated: use [gda.data_model_iter.DataModelIter.moveToRow] instead
  */
  override bool iterAtRow(gda.data_model_iter.DataModelIter iter, int row)
  {
    bool _retval;
    _retval = cast(bool)gda_data_model_iter_at_row(cast(GdaDataModel*)this._cPtr, iter ? cast(GdaDataModelIter*)iter._cPtr(No.Dup) : null, row);
    return _retval;
  }

  /**
      Moves iter to the next row in model.
  
      Params:
        iter = a #GdaDataModelIter object.
      Returns: 
  
      Deprecated: use [gda.data_model_iter.DataModelIter.moveNext] instead
  */
  override bool iterNext(gda.data_model_iter.DataModelIter iter)
  {
    bool _retval;
    _retval = cast(bool)gda_data_model_iter_next(cast(GdaDataModel*)this._cPtr, iter ? cast(GdaDataModelIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves iter to the next row in model.
  
      Params:
        iter = a #GdaDataModelIter object.
      Returns: 
  
      Deprecated: use [gda.data_model_iter.DataModelIter.movePrev] instead
  */
  override bool iterPrev(gda.data_model_iter.DataModelIter iter)
  {
    bool _retval;
    _retval = cast(bool)gda_data_model_iter_prev(cast(GdaDataModel*)this._cPtr, iter ? cast(GdaDataModelIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Set value to the given column and row pointed by iter in the given model.
  
      Params:
        iter = a #GdaDataModelIter object.
        col = the number of column to set value to
        value = the to use to set on
      Returns: 
      Throws: [DataModelException]
  
      Deprecated: use [gda.data_model_iter.DataModelIter.setValueAt] instead
  */
  override bool iterSetValue(gda.data_model_iter.DataModelIter iter, int col, gobject.value.Value value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_model_iter_set_value(cast(GdaDataModel*)this._cPtr, iter ? cast(GdaDataModelIter*)iter._cPtr(No.Dup) : null, col, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new DataModelException(_err);
    return _retval;
  }

  /**
      Removes a row from the data model.
      
      Upon errors FALSE will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
  
      Params:
        row = the row number to be removed.
      Returns: true if successful, false otherwise.
      Throws: [DataModelException]
  */
  override bool removeRow(int row)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_model_remove_row(cast(GdaDataModel*)this._cPtr, row, &_err);
    if (_err)
      throw new DataModelException(_err);
    return _retval;
  }

  /**
      Emits the 'reset' and 'changed' signal on model.
  */
  override void reset()
  {
    gda_data_model_reset(cast(GdaDataModel*)this._cPtr);
  }

  /**
      Emits the 'row_inserted' and 'changed' signals on model.
      
      This method should only be used by #GdaDataModel implementations to
      signal that a row has been inserted.
  
      Params:
        row = row number.
  */
  override void rowInserted(int row)
  {
    gda_data_model_row_inserted(cast(GdaDataModel*)this._cPtr, row);
  }

  /**
      Emits the 'row_removed' and 'changed' signal on model.
      
      This method should only be used by #GdaDataModel implementations to
      signal that a row has been removed
  
      Params:
        row = row number.
  */
  override void rowRemoved(int row)
  {
    gda_data_model_row_removed(cast(GdaDataModel*)this._cPtr, row);
  }

  /**
      Emits the 'row_updated' and 'changed' signals on model.
      
      This method should only be used by #GdaDataModel implementations to
      signal that a row has been updated.
  
      Params:
        row = row number.
  */
  override void rowUpdated(int row)
  {
    gda_data_model_row_updated(cast(GdaDataModel*)this._cPtr, row);
  }

  /**
      Sends a hint to the data model. The hint may or may not be handled by the data
      model, depending on its implementation
  
      Params:
        hint = a hint to send to the model
        hintValue = an optional value to specify the hint, or null
  */
  override void sendHint(gda.types.DataModelHint hint, gobject.value.Value hintValue = null)
  {
    gda_data_model_send_hint(cast(GdaDataModel*)this._cPtr, hint, hintValue ? cast(const(GValue)*)hintValue._cPtr(No.Dup) : null);
  }

  /**
      Sets the name of the given col in model, and if its title is not set, also sets the
      title to name.
  
      Params:
        col = column number
        name = name for the given column.
  */
  override void setColumnName(int col, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gda_data_model_set_column_name(cast(GdaDataModel*)this._cPtr, col, _name);
  }

  /**
      Sets the title of the given col in model.
  
      Params:
        col = column number
        title = title for the given column.
  */
  override void setColumnTitle(int col, string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gda_data_model_set_column_title(cast(GdaDataModel*)this._cPtr, col, _title);
  }

  /**
      Enable or disable notifications changes on the given data model.
  
      Params:
        doNotifyChanges = Set to TRUE if you require notifications.
  
      Deprecated: use [gda.data_model.DataModel.freeze] and [gda.data_model.DataModel.thaw] instead
  */
  override void setNotify(bool doNotifyChanges)
  {
    gda_data_model_set_notify(cast(GdaDataModel*)this._cPtr, doNotifyChanges);
  }

  /**
      Modifies a value in model, at (col, row).
      
      Upon errors FALSE will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
  
      Params:
        col = column number.
        row = row number.
        value = a #GValue (not null)
      Returns: TRUE if the value in the data model has been updated and no error occurred
      Throws: [DataModelException]
  */
  override bool setValueAt(int col, int row, gobject.value.Value value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_model_set_value_at(cast(GdaDataModel*)this._cPtr, col, row, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new DataModelException(_err);
    return _retval;
  }

  /**
      In a similar way to [gda.data_model.DataModel.setValueAt], this method modifies a data model's contents
      by setting several values at once.
      
      If any value in values is actually null, then the value in the corresponding column is left
      unchanged.
       
      Upon errors FALSE will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
  
      Params:
        row = row number.
        values = a list of #GValue (or null), one for at most the number of columns of model
      Returns: true if the value in the data model has been updated and no error occurred
      Throws: [DataModelException]
  */
  override bool setValues(int row, gobject.value.Value[] values = null)
  {
    bool _retval;
    auto _values = gListFromD!(gobject.value.Value)(values);
    scope(exit) containerFree!(GList*, gobject.value.Value, GidOwnership.None)(_values);
    GError *_err;
    _retval = cast(bool)gda_data_model_set_values(cast(GdaDataModel*)this._cPtr, row, _values, &_err);
    if (_err)
      throw new DataModelException(_err);
    return _retval;
  }

  /**
      Re-enables notifications of changes on the given data model.
  */
  override void thaw()
  {
    gda_data_model_thaw(cast(GdaDataModel*)this._cPtr);
  }

  /**
      Connect to `AccessChanged` signal.
  
      Gets emitted when model's access flags have changed. Use
        [gda.data_model.DataModel.getAccessFlags] to get the access flags.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.data_model.DataModel dataModel))
  
          `dataModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAccessChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.data_model.DataModel)))
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
    return connectSignalClosure("access-changed", closure, after);
  }

  /**
      Connect to `Changed` signal.
  
      Gets emitted when any value in model has been changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.data_model.DataModel dataModel))
  
          `dataModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.data_model.DataModel)))
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
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `Reset` signal.
  
      Gets emitted when model's contents has been completely reset (the number and
        type of columns may also have changed)
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.data_model.DataModel dataModel))
  
          `dataModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReset(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.data_model.DataModel)))
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
    return connectSignalClosure("reset", closure, after);
  }

  /**
      Connect to `RowInserted` signal.
  
      Gets emitted when a row has been inserted in model
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int row, gda.data_model.DataModel dataModel))
  
          `row` the row number (optional)
  
          `dataModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowInserted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.data_model.DataModel)))
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
    return connectSignalClosure("row-inserted", closure, after);
  }

  /**
      Connect to `RowRemoved` signal.
  
      Gets emitted when a row has been removed from model
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int row, gda.data_model.DataModel dataModel))
  
          `row` the row number (optional)
  
          `dataModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.data_model.DataModel)))
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
    return connectSignalClosure("row-removed", closure, after);
  }

  /**
      Connect to `RowUpdated` signal.
  
      Gets emitted when a row has been modified in model
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int row, gda.data_model.DataModel dataModel))
  
          `row` the row number (optional)
  
          `dataModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowUpdated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.data_model.DataModel)))
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
    return connectSignalClosure("row-updated", closure, after);
  }
}
