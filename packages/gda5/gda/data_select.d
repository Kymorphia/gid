/// Module for [DataSelect] class
module gda.data_select;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.data_model;
import gda.data_model_mixin;
import gda.pstmt;
import gda.statement;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.object;

/** */
class DataSelect : gobject.object.ObjectWrap, gda.data_model.DataModel
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
    return cast(void function())gda_data_select_get_type != &gidSymbolNotFound ? gda_data_select_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DataSelect self()
  {
    return this;
  }

  /** */
  @property bool autoReset()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("auto-reset");
  }

  /** */
  @property void autoReset(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("auto-reset", propval);
  }

  /** */
  @property gda.statement.Statement deleteStmt()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.statement.Statement)("delete-stmt");
  }

  /** */
  @property void deleteStmt(gda.statement.Statement propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.statement.Statement)("delete-stmt", propval);
  }

  /**
      Get `executionDelay` property.
      Returns: This property stores the execution delay which has been necessary to obtain the data
  */
  @property double executionDelay()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("execution-delay");
  }

  /**
      Set `executionDelay` property.
      Params:
        propval = This property stores the execution delay which has been necessary to obtain the data
  */
  @property void executionDelay(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("execution-delay", propval);
  }

  /** */
  @property gda.statement.Statement insertStmt()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.statement.Statement)("insert-stmt");
  }

  /** */
  @property void insertStmt(gda.statement.Statement propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.statement.Statement)("insert-stmt", propval);
  }

  /** */
  @property gda.pstmt.PStmt preparedStmt()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.pstmt.PStmt)("prepared-stmt");
  }

  /** */
  @property void preparedStmt(gda.pstmt.PStmt propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.pstmt.PStmt)("prepared-stmt", propval);
  }

  /** */
  @property gda.statement.Statement selectStmt()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.statement.Statement)("select-stmt");
  }

  /** */
  @property bool storeAllRows()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("store-all-rows");
  }

  /** */
  @property void storeAllRows(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("store-all-rows", propval);
  }

  /** */
  @property gda.statement.Statement updateStmt()
  {
    return gobject.object.ObjectWrap.getProperty!(gda.statement.Statement)("update-stmt");
  }

  /** */
  @property void updateStmt(gda.statement.Statement propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.statement.Statement)("update-stmt", propval);
  }

  mixin DataModelT!();

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_data_select_error_quark();
    return _retval;
  }

  /**
      Computes correct attributes for each of model's columns, which includes the "NOT NULL" attribute, the
      default value, the precision and scale for numeric values.
      Returns: TRUE if no error occurred
      Throws: [DataSelectException]
  */
  bool computeColumnsAttributes()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_select_compute_columns_attributes(cast(GdaDataSelect*)this._cPtr, &_err);
    if (_err)
      throw new DataSelectException(_err);
    return _retval;
  }

  /**
      Makes model try to compute INSERT, UPDATE and DELETE statements to be used when modifying model's contents.
      Note: any modification statement set using [gda.data_select.DataSelect.setModificationStatement] will first be unset
      
      This function is similar to calling [gda.data_select.DataSelect.computeModificationStatementsExt] with
      cond_type set to `GDA_DATA_SELECT_COND_PK`
      Returns: true if no error occurred. If false is returned, then some modification statement may still have been computed
      Throws: [DataSelectException]
  */
  bool computeModificationStatements()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_select_compute_modification_statements(cast(GdaDataSelect*)this._cPtr, &_err);
    if (_err)
      throw new DataSelectException(_err);
    return _retval;
  }

  /**
      Makes model try to compute INSERT, UPDATE and DELETE statements to be used when modifying model's contents.
      Note: any modification statement set using [gda.data_select.DataSelect.setModificationStatement] will first be unset
  
      Params:
        condType = the type of condition for the modifications where one row only should be identified
      Returns: true if no error occurred. If false is returned, then some modification statement may still have been computed
      Throws: [DataSelectException]
  */
  bool computeModificationStatementsExt(gda.types.DataSelectConditionType condType)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_select_compute_modification_statements_ext(cast(GdaDataSelect*)this._cPtr, condType, &_err);
    if (_err)
      throw new DataSelectException(_err);
    return _retval;
  }

  /**
      Offers the same features as [gda.data_select.DataSelect.setRowSelectionCondition] but the expression
      is computed from the meta data associated to the connection being used when model was created.
      
      NOTE1: make sure the meta data associated to the connection is up to date before using this
      method, see [gda.connection.Connection.updateMetaStore].
      
      NOTE2: if the SELECT statement from which model has been created uses more than one table, or
      if the table used does not have any primary key, then this method will fail
      Returns: TRUE if no error occurred.
      Throws: [DataSelectException]
  */
  bool computeRowSelectionCondition()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_select_compute_row_selection_condition(cast(GdaDataSelect*)this._cPtr, &_err);
    if (_err)
      throw new DataSelectException(_err);
    return _retval;
  }

  /**
      Get a pointer to the #GdaConnection object which was used when model was created
      (and which may be used internally by model).
      Returns: a pointer to the #GdaConnection, or null
  */
  gda.connection.Connection getConnection()
  {
    GdaConnection* _cretval;
    _cretval = gda_data_select_get_connection(cast(GdaDataSelect*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.connection.Connection)(cast(GdaConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Use this method to make sure all the data contained in the data model are stored on the client
      side (and that no subsquent call to the server will be necessary to access that data), at the cost of
      a higher memory consumption.
      
      This method is useful in the following situations:
      <itemizedlist>
        <listitem><para>You need to disconnect from the server and continue to use the data in the data model</para></listitem>
        <listitem><para>You need to make sure the data in the data model can be used even though the connection to the server may be used for other purposes (for example executing other queries)</para></listitem>
      </itemizedlist>
      
      Note that this method will fail if:
      <itemizedlist>
        <listitem><para>the data model contains any blobs (because blobs reading requires acces to the server);
          binary values are Ok, though.</para></listitem>
        <listitem><para>the data model has been modified since it was created</para></listitem>
      </itemizedlist>
      Returns: true if no error occurred
      Throws: [DataSelectException]
  */
  bool prepareForOffline()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_select_prepare_for_offline(cast(GdaDataSelect*)this._cPtr, &_err);
    if (_err)
      throw new DataSelectException(_err);
    return _retval;
  }

  /**
      Requests that model be re-run to have an updated result. If an error occurs,
      then model will not be changed.
      Returns: true if no error occurred
      Throws: [DataSelectException]
  */
  bool rerun()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_select_rerun(cast(GdaDataSelect*)this._cPtr, &_err);
    if (_err)
      throw new DataSelectException(_err);
    return _retval;
  }

  /**
      Informs model that it should allow modifications to the data in some columns and some rows
      using mod_stmt to propagate those modifications into the database.
      
      If mod_stmt is:
      <itemizedlist>
       <listitem><para>an UPDATE statement, then all the rows in model will be writable</para></listitem>
       <listitem><para>a DELETE statement, then it will be possible to delete rows in model</para></listitem>
       <listitem><para>in INSERT statement, then it will be possible to add some rows to model</para></listitem>
       <listitem><para>any other statement, then this method will return an error</para></listitem>
      </itemizedlist>
      
      This method can be called several times to specify different types of modification statements.
      
      Each modification statement will be executed when one or more values are modified in the data model;
      each statement should then include variables which will be set to either the old value or the
      new value of a column at the specified modified row (but can also contain other variables). Each variable
      named as "+&lt;number&gt;" will be mapped to the new value of the number'th column (starting at 0), and
      each variable named as "-&lt;number&gt;" will be mapped to the old value of the number'th column.
      
      Examples of the SQL equivalent of each statement are (for example if "mytable" has the "id" field as
      primary key, and if that field is auto incremented and if the data model is the result of
      executing "<![CDATA[SELECT * from mytable]]>").
      
      <itemizedlist>
       <listitem><para>"<![CDATA[INSERT INTO mytable (name) VALUES (##+1::string)]]>": the column ID can not be set
        for new rows</para></listitem>
       <listitem><para>"<![CDATA[DELETE FROM mytable WHERE id=##-0::int]]>"</para></listitem>
       <listitem><para>"<![CDATA[UPDATE mytable SET name=##+1::string WHERE id=##-0::int]]>": the column ID cannot be
        modified</para></listitem>
      </itemizedlist>
      
      Also see the [gda.data_select.DataSelect.setRowSelectionConditionSql] for more information about the WHERE
      part of the UPDATE and DELETE statement types.
      
      If mod_stmt is an UPDATE or DELETE statement then it should have a WHERE part which identifies
      a unique row in model (please note that this property can't be checked but may result
      in model behaving in an unpredictable way).
      
      NOTE1: However, if the [gda.data_select.DataSelect.setRowSelectionCondition]
      or [gda.data_select.DataSelect.setRowSelectionConditionSql] have been successfully be called before, the WHERE
      part of mod_stmt <emphasis>WILL</emphasis> be modified to use the row selection condition specified through one of
      these methods (please not that it is then possible to avoid specifying a WHERE part in mod_stmt then).
      
      NOTE2: if [gda.data_select.DataSelect.setRowSelectionCondition]
      or [gda.data_select.DataSelect.setRowSelectionConditionSql] have not yet been successfully be called before, then
      the WHERE part of mod_stmt will be used as if one of these functions had been called.
  
      Params:
        modStmt = a #GdaStatement (INSERT, UPDATE or DELETE)
      Returns: true if no error occurred.
      Throws: [DataSelectException]
  */
  bool setModificationStatement(gda.statement.Statement modStmt)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_data_select_set_modification_statement(cast(GdaDataSelect*)this._cPtr, modStmt ? cast(GdaStatement*)modStmt._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new DataSelectException(_err);
    return _retval;
  }

  /**
      Offers the same feature as [gda.data_select.DataSelect.setModificationStatement] but using an SQL statement.
  
      Params:
        sql = an SQL text
      Returns: TRUE if no error occurred.
      Throws: [DataSelectException]
  */
  bool setModificationStatementSql(string sql)
  {
    bool _retval;
    const(char)* _sql = sql.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_data_select_set_modification_statement_sql(cast(GdaDataSelect*)this._cPtr, _sql, &_err);
    if (_err)
      throw new DataSelectException(_err);
    return _retval;
  }

  /**
      Specifies the SQL condition corresponding to the WHERE part of a SELECT statement which would
      return only 1 row (the expression of the primary key).
      
      For example for a table created as <![CDATA["CREATE TABLE mytable (part1 int NOT NULL, part2 string NOT NULL,
      name string, PRIMARY KEY (part1, part2))"]]>, and if pmodel corresponds to the execution of the
      <![CDATA["SELECT name, part1, part2 FROM mytable"]]>, then the sensible value for sql_where would be
      <![CDATA["part1 = ##-1::int AND part2 = ##-2::string"]]> because the values of the 'part1' field are located
      in pmodel's column number 1 and the values of the 'part2' field are located
      in pmodel's column number 2 and the primary key is composed of (part1, part2).
      
      For more information about the syntax of the parameters (named <![CDATA["##-1::int"]]> for example), see the
      <link linkend="GdaSqlParser.description">GdaSqlParser</link> documentation, and
      [gda.data_select.DataSelect.setModificationStatement].
  
      Params:
        sqlWhere = an SQL condition (without the WHERE keyword)
      Returns: TRUE if no error occurred
      Throws: [DataSelectException]
  */
  bool setRowSelectionConditionSql(string sqlWhere)
  {
    bool _retval;
    const(char)* _sqlWhere = sqlWhere.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_data_select_set_row_selection_condition_sql(cast(GdaDataSelect*)this._cPtr, _sqlWhere, &_err);
    if (_err)
      throw new DataSelectException(_err);
    return _retval;
  }
}

class DataSelectException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.data_select.DataSelect.errorQuark, cast(int)code, msg);
  }

  alias Code = DataSelectError;
}
