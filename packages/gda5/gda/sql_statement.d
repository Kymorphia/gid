/// Module for [SqlStatement] class
module gda.sql_statement;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.meta_struct;
import gda.types;
import gid.gid;
import glib.error;
import gobject.boxed;
import gobject.value;

/**
    This structure is the top level structure encapsulating several type of statements.
*/
class SqlStatement : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_sql_statement_get_type != &gidSymbolNotFound ? gda_sql_statement_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SqlStatement self()
  {
    return this;
  }

  /** */
  @property string sql()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlStatement*)this._cPtr).sql);
  }

  /** */
  @property void sql(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlStatement*)this._cPtr).sql);
    dToC(propval, cast(void*)&(cast(GdaSqlStatement*)this._cPtr).sql);
  }

  /**
      Get `stmtType` field.
      Returns: type of statement
  */
  @property gda.types.SqlStatementType stmtType()
  {
    return cast(gda.types.SqlStatementType)(cast(GdaSqlStatement*)this._cPtr).stmtType;
  }

  /**
      Set `stmtType` field.
      Params:
        propval = type of statement
  */
  @property void stmtType(gda.types.SqlStatementType propval)
  {
    (cast(GdaSqlStatement*)this._cPtr).stmtType = cast(GdaSqlStatementType)propval;
  }

  /** */
  @property gda.meta_struct.MetaStruct validityMetaStruct()
  {
    return cToD!(gda.meta_struct.MetaStruct)(cast(void*)(cast(GdaSqlStatement*)this._cPtr).validityMetaStruct);
  }

  /** */
  @property void validityMetaStruct(gda.meta_struct.MetaStruct propval)
  {
    cValueFree!(gda.meta_struct.MetaStruct)(cast(void*)(cast(GdaSqlStatement*)this._cPtr).validityMetaStruct);
    dToC(propval, cast(void*)&(cast(GdaSqlStatement*)this._cPtr).validityMetaStruct);
  }

  /**
      Use this function to create a #GdaSqlStatement of the specified type type.
  
      Params:
        type = type of statement to create
      Returns: a new #GdaSqlStatement
  */
  this(gda.types.SqlStatementType type)
  {
    GdaSqlStatement* _cretval;
    _cretval = gda_sql_statement_new(type);
    this(_cretval, Yes.Take);
  }

  /**
      Cleans any data set by a previous call to [gda.sql_statement.SqlStatement.checkValidity].
  */
  void checkClean()
  {
    gda_sql_statement_check_clean(cast(GdaSqlStatement*)this._cPtr);
  }

  /**
      Checks for any error in stmt's structure to make sure the statement is valid
      (for example a SELECT statement must at least return a column, a DELETE statement must specify which table
      is targeted).
      Returns: TRUE if no error occurred
      Throws: [ErrorWrap]
  */
  bool checkStructure()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_sql_statement_check_structure(cast(GdaSqlStatement*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      If cnc is not null, then checks that all the database objects referenced in the statement actually
      exist in the connection's database (for example the table being updated in a UPDATE statement must exist in the
      connection's database for the check to succeed). This method fills the stmt-&gt;validity_meta_struct attribute.
      
      If cnc is null, then remove any information from a previous call to this method stored in stmt. In this case,
      the stmt-&gt;validity_meta_struct attribute is cleared.
      
      Also note that some parts of stmt may be modified: for example leading and trailing spaces in aliases or
      objects names will be removed.
  
      Params:
        cnc = a #GdaConnection object, or null
      Returns: TRUE if no error occurred
      Throws: [ErrorWrap]
  */
  bool checkValidity(gda.connection.Connection cnc = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_sql_statement_check_validity(cast(GdaSqlStatement*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      If mstruct is not null, then checks that all the database objects referenced in the statement i
      actually referenced in mstruct
       (for example the table being updated in a UPDATE statement must exist in the
      connection's database for the check to succeed).
      This method sets the stmt-&gt;validity_meta_struct attribute to mstruct.
      
      If mstruct is null, then remove any information from a previous call to this method stored in stmt. In this case,
      the stmt-&gt;validity_meta_struct attribute is cleared.
      
      Also note that some parts of stmt may be modified: for example leading and trailing spaces in aliases or
      objects names will be removed.
  
      Params:
        mstruct = a #GdaMetaStruct object, or null
      Returns: TRUE if no error occurred
      Throws: [ErrorWrap]
  */
  bool checkValidityM(gda.meta_struct.MetaStruct mstruct = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_sql_statement_check_validity_m(cast(GdaSqlStatement*)this._cPtr, mstruct ? cast(GdaMetaStruct*)mstruct._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Specifies stmt's type of compound
  
      Params:
        type = a #GdaSqlStatementCompoundType value
  */
  void compoundSetType(gda.types.SqlStatementCompoundType type)
  {
    gda_sql_statement_compound_set_type(cast(GdaSqlStatement*)this._cPtr, type);
  }

  /**
      Adds the `s` sub-statement to the `s`tmt compound statement. `s`'s reference is transferred to
      `s`tmt (which means `s`tmt is then responsible for freeing it when no longer needed).
  
      Params:
        s = a #GdaSqlStatement pointer
  */
  void compoundTakeStmt(gda.sql_statement.SqlStatement s)
  {
    gda_sql_statement_compound_take_stmt(cast(GdaSqlStatement*)this._cPtr, s ? cast(GdaSqlStatement*)s._cPtr(Yes.Dup) : null);
  }

  /**
      Creates a copy of stmt.
      Returns: a new #GdaSqlStatement
  */
  gda.sql_statement.SqlStatement copy()
  {
    GdaSqlStatement* _cretval;
    _cretval = gda_sql_statement_copy(cast(GdaSqlStatement*)this._cPtr);
    auto _retval = _cretval ? new gda.sql_statement.SqlStatement(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets the name of the table to delete from in stmt. value's ownership is transferred to
      stmt (which means stmt is then responsible for freeing it when no longer needed).
  
      Params:
        value = a table name as a G_TYPE_STRING #GValue
  */
  void deleteTakeTableName(gobject.value.Value value)
  {
    gda_sql_statement_delete_take_table_name(cast(GdaSqlStatement*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the name of the resolution conflict algorithm used by stmt. value's ownership is transferred to
      stmt (which means stmt is then responsible for freeing it when no longer needed).
  
      Params:
        value = name of the resolution conflict algorithm, as a G_TYPE_STRING #GValue
  */
  void insertTakeOnConflict(gobject.value.Value value)
  {
    gda_sql_statement_insert_take_on_conflict(cast(GdaSqlStatement*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Specifies a SELECT statement, the values inserted will be the result set of select. select's
      ownership is transferred to
      stmt (which means stmt is then responsible for freeing it when no longer needed).
  
      Params:
        select = a SELECT or COMPOUND #GdaSqlStatement pointer
  */
  void insertTakeSelect(gda.sql_statement.SqlStatement select)
  {
    gda_sql_statement_insert_take_select(cast(GdaSqlStatement*)this._cPtr, select ? cast(GdaSqlStatement*)select._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the name of the table to insert into in stmt. value's ownership is transferred to
      stmt (which means stmt is then responsible for freeing it when no longer needed).
  
      Params:
        value = name of the table to insert into, as a G_TYPE_STRING #GValue
  */
  void insertTakeTableName(gobject.value.Value value)
  {
    gda_sql_statement_insert_take_table_name(cast(GdaSqlStatement*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }

  /**
      "Normalizes" (in place) some parts of stmt, which means stmt may be modified.
      At the moment any "*" field in a SELECT statement will be replaced by one
      #GdaSqlSelectField structure for each field in the referenced table.
  
      Params:
        cnc = a #GdaConnection object, or null
      Returns: TRUE if no error occurred
      Throws: [ErrorWrap]
  */
  bool normalize(gda.connection.Connection cnc = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_sql_statement_normalize(cast(GdaSqlStatement*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates a string representation of stmt.
      Returns: a new string
  */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_statement_serialize(cast(GdaSqlStatement*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  void transSetIsolLevel(gda.types.TransactionIsolation level)
  {
    gda_sql_statement_trans_set_isol_level(cast(GdaSqlStatement*)this._cPtr, level);
  }

  /**
      Sets the model of the transaction
      
      value's ownership is transferred to
      stmt (which means stmt is then responsible for freeing it when no longer needed).
  
      Params:
        value = a G_TYPE_STRING value
  */
  void transTakeMode(gobject.value.Value value)
  {
    gda_sql_statement_trans_take_mode(cast(GdaSqlStatement*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the name of the transaction
      
      value's ownership is transferred to
      stmt (which means stmt is then responsible for freeing it when no longer needed).
  
      Params:
        value = a G_TYPE_STRING value
  */
  void transTakeName(gobject.value.Value value)
  {
    gda_sql_statement_trans_take_name(cast(GdaSqlStatement*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the name of the resolution conflict algorithm used by stmt. value's ownership is transferred to
      stmt (which means stmt is then responsible for freeing it when no longer needed).
  
      Params:
        value = name of the resolution conflict algorithm, as a G_TYPE_STRING #GValue
  */
  void updateTakeOnConflict(gobject.value.Value value)
  {
    gda_sql_statement_update_take_on_conflict(cast(GdaSqlStatement*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the name of the table to delete from in stmt.
      
      value's ownership is transferred to
      stmt (which means stmt is then responsible for freeing it when no longer needed).
  
      Params:
        value = a table name, as a G_TYPE_STRING #GValue
  */
  void updateTakeTableName(gobject.value.Value value)
  {
    gda_sql_statement_update_take_table_name(cast(GdaSqlStatement*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }

  /**
      Converts a string to a #GdaSqlStatementType value, see also [gda.sql_statement.SqlStatement.typeToString]
  
      Params:
        type = a string representing a #GdaSqlStatementType type
      Returns: a #GdaSqlStatementType value
  */
  static gda.types.SqlStatementType stringToType(string type)
  {
    GdaSqlStatementType _cretval;
    const(char)* _type = type.toCString(No.Alloc);
    _cretval = gda_sql_statement_string_to_type(_type);
    gda.types.SqlStatementType _retval = cast(gda.types.SqlStatementType)_cretval;
    return _retval;
  }

  /**
      Converts a #GdaSqlStatementType to a string, see also [gda.sql_statement.SqlStatement.stringToType]
  
      Params:
        type = a #GdaSqlStatementType value
      Returns: a constant string
  */
  static string typeToString(gda.types.SqlStatementType type)
  {
    const(char)* _cretval;
    _cretval = gda_sql_statement_type_to_string(type);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
