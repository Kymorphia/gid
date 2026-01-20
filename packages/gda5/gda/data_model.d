/// Module for [DataModel] interface
module gda.data_model;

public import gda.data_model_iface_proxy;
import gda.c.functions;
import gda.c.types;
import gda.column;
import gda.data_model_array;
import gda.data_model_iter;
import gda.set;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gobject.value;
import libxml2.types;

/** */
interface DataModel
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_data_model_get_type != &gidSymbolNotFound ? gda_data_model_get_type() : cast(GType)0;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_data_model_error_quark();
    return _retval;
  }

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
  bool addDataFromXmlNode(libxml2.types.NodePtr node);

  /**
      Appends a row to the data model (the new row will possibly have NULL values for all columns,
      or some other values depending on the data model implementation)
      
      Upon errors -1 will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
      Returns: the number of the added row, or -1 if an error occurred
      Throws: [DataModelException]
  */
  int appendRow();

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
  int appendValues(gobject.value.Value[] values = null);

  /**
      Makes a copy of src into a new #GdaDataModelArray object
      Returns: a new data model, or null if an error occurred
      Throws: [DataModelException]
  */
  gda.data_model_array.DataModelArray arrayCopyModel();

  /**
      Like [gda.data_model.DataModel.arrayCopyModel], makes a copy of src, but copies only some
      columns.
  
      Params:
        cols = array of src's columns to copy into the new array, not null
      Returns: a new data model, or null if an error occurred
      Throws: [DataModelException]
  */
  gda.data_model_array.DataModelArray arrayCopyModelExt(int[] cols);

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
  gda.data_model_iter.DataModelIter createIter();

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
  gda.column.Column describeColumn(int col);

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
  void dump(void* toStream = null);

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
  string dumpAsString();

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
  bool exportToFile(gda.types.DataModelIOFormat format, string file, int[] cols, int[] rows, gda.set.Set options);

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
  string exportToString(gda.types.DataModelIOFormat format, int[] cols, int[] rows, gda.set.Set options);

  /**
      Disables notifications of changes on the given data model. To
      re-enable notifications again, you should call the
      #gda_data_model_thaw function.
  */
  void freeze();

  /**
      Get the attributes of model such as how to access the data it contains if it's modifiable, etc.
      Returns: an ORed value of #GdaDataModelAccessFlags flags
  */
  gda.types.DataModelAccessFlags getAccessFlags();

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
  gda.types.ValueAttribute getAttributesAt(int col, int row);

  /**
      Get the index of the first column named name in model.
  
      Params:
        name = a column name
      Returns: the column index, or -1 if no column named name was found
  */
  int getColumnIndex(string name);

  /** */
  string getColumnName(int col);

  /** */
  string getColumnTitle(int col);

  /** */
  int getNColumns();

  /** */
  int getNRows();

  /**
      Returns the status of notifications changes on the given data model.
      Returns: 
  */
  bool getNotify();

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
  gobject.value.Value getTypedValueAt(int col, int row, gobject.types.GType expectedType, bool nullok);

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
  gobject.value.Value getValueAt(int col, int row);

  /**
      Moves iter to the row number given by row.
  
      Params:
        iter = a #GdaDataModelIter object.
        row = a row to point to with iter
      Returns: 
  
      Deprecated: use [gda.data_model_iter.DataModelIter.moveToRow] instead
  */
  bool iterAtRow(gda.data_model_iter.DataModelIter iter, int row);

  /**
      Moves iter to the next row in model.
  
      Params:
        iter = a #GdaDataModelIter object.
      Returns: 
  
      Deprecated: use [gda.data_model_iter.DataModelIter.moveNext] instead
  */
  bool iterNext(gda.data_model_iter.DataModelIter iter);

  /**
      Moves iter to the next row in model.
  
      Params:
        iter = a #GdaDataModelIter object.
      Returns: 
  
      Deprecated: use [gda.data_model_iter.DataModelIter.movePrev] instead
  */
  bool iterPrev(gda.data_model_iter.DataModelIter iter);

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
  bool iterSetValue(gda.data_model_iter.DataModelIter iter, int col, gobject.value.Value value);

  /**
      Removes a row from the data model.
      
      Upon errors FALSE will be returned and error will be assigned a
      #GError from the #GDA_DATA_MODEL_ERROR domain.
  
      Params:
        row = the row number to be removed.
      Returns: true if successful, false otherwise.
      Throws: [DataModelException]
  */
  bool removeRow(int row);

  /**
      Emits the 'reset' and 'changed' signal on model.
  */
  void reset();

  /**
      Emits the 'row_inserted' and 'changed' signals on model.
      
      This method should only be used by #GdaDataModel implementations to
      signal that a row has been inserted.
  
      Params:
        row = row number.
  */
  void rowInserted(int row);

  /**
      Emits the 'row_removed' and 'changed' signal on model.
      
      This method should only be used by #GdaDataModel implementations to
      signal that a row has been removed
  
      Params:
        row = row number.
  */
  void rowRemoved(int row);

  /**
      Emits the 'row_updated' and 'changed' signals on model.
      
      This method should only be used by #GdaDataModel implementations to
      signal that a row has been updated.
  
      Params:
        row = row number.
  */
  void rowUpdated(int row);

  /**
      Sends a hint to the data model. The hint may or may not be handled by the data
      model, depending on its implementation
  
      Params:
        hint = a hint to send to the model
        hintValue = an optional value to specify the hint, or null
  */
  void sendHint(gda.types.DataModelHint hint, gobject.value.Value hintValue = null);

  /**
      Sets the name of the given col in model, and if its title is not set, also sets the
      title to name.
  
      Params:
        col = column number
        name = name for the given column.
  */
  void setColumnName(int col, string name);

  /**
      Sets the title of the given col in model.
  
      Params:
        col = column number
        title = title for the given column.
  */
  void setColumnTitle(int col, string title);

  /**
      Enable or disable notifications changes on the given data model.
  
      Params:
        doNotifyChanges = Set to TRUE if you require notifications.
  
      Deprecated: use [gda.data_model.DataModel.freeze] and [gda.data_model.DataModel.thaw] instead
  */
  void setNotify(bool doNotifyChanges);

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
  bool setValueAt(int col, int row, gobject.value.Value value);

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
  bool setValues(int row, gobject.value.Value[] values = null);

  /**
      Re-enables notifications of changes on the given data model.
  */
  void thaw();

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
  ulong connectAccessChanged(T)(T callback, Flag!"After" after = No.After);

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
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After);

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
  ulong connectReset(T)(T callback, Flag!"After" after = No.After);

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
  ulong connectRowInserted(T)(T callback, Flag!"After" after = No.After);

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
  ulong connectRowRemoved(T)(T callback, Flag!"After" after = No.After);

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
  ulong connectRowUpdated(T)(T callback, Flag!"After" after = No.After);
}

class DataModelException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.data_model.DataModel.errorQuark, cast(int)code, msg);
  }

  alias Code = DataModelError;
}
