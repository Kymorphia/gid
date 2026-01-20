/// Module for [SqlExpr] class
module gda.sql_expr;

import gda.c.functions;
import gda.c.types;
import gda.sql_case;
import gda.sql_function;
import gda.sql_operation;
import gda.sql_param_spec;
import gda.sql_statement;
import gda.types;
import gid.gid;
import gobject.boxed;
import gobject.value;

/**
    This structure contains any expression, either as a value (the @value part is set),
    a variable (the @param_spec is set), or as other types of expressions.
    
    Note 1 about the @value field: if the expression represents a string value in the SQL statement,
    the string itself must be represented as it would be in the actual SQL, ie. it should be
    escaped (accordingly to the escaping rules of the database which will use the SQL). For
    example a string representing the <userinput>'joe'</userinput> value should be
    <userinput>"'joe'"</userinput> and not <userinput>"joe"</userinput>.
    
    Note 2 about the @value field: if the expression represents an SQL identifier (such as a table
    or field name), then the @value_is_ident should be set to true, and @value should be a string
    which may contain double quotes around SQL identifiers which also are reserved keywords or which
    are case sensitive.
*/
class SqlExpr : gobject.boxed.Boxed
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
    return cast(void function())gda_sql_expr_get_type != &gidSymbolNotFound ? gda_sql_expr_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SqlExpr self()
  {
    return this;
  }

  /**
      Get `value` field.
      Returns: a #GValue, or null. Please see specific note about this field.
  */
  @property gobject.value.Value value()
  {
    return cToD!(gobject.value.Value)(cast(void*)(cast(GdaSqlExpr*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = a #GValue, or null. Please see specific note about this field.
  */
  @property void value(gobject.value.Value propval)
  {
    cValueFree!(gobject.value.Value)(cast(void*)(cast(GdaSqlExpr*)this._cPtr).value);
    dToC(propval, cast(void*)&(cast(GdaSqlExpr*)this._cPtr).value);
  }

  /**
      Get `paramSpec` field.
      Returns: a #GdaSqlParamSpec, or null if this is not a variable
  */
  @property gda.sql_param_spec.SqlParamSpec paramSpec()
  {
    return new gda.sql_param_spec.SqlParamSpec(cast(GdaSqlParamSpec*)(cast(GdaSqlExpr*)this._cPtr).paramSpec, No.Take);
  }

  /**
      Get `func` field.
      Returns: not null if expression is a function or aggregate
  */
  @property gda.sql_function.SqlFunction func()
  {
    return new gda.sql_function.SqlFunction(cast(GdaSqlFunction*)(cast(GdaSqlExpr*)this._cPtr).func, No.Take);
  }

  /**
      Get `cond` field.
      Returns: not null if expression is a condition or an operation
  */
  @property gda.sql_operation.SqlOperation cond()
  {
    return new gda.sql_operation.SqlOperation(cast(GdaSqlOperation*)(cast(GdaSqlExpr*)this._cPtr).cond, No.Take);
  }

  /**
      Get `caseS` field.
      Returns: not null if expression is a CASE WHEN ... expression
  */
  @property gda.sql_case.SqlCase caseS()
  {
    return new gda.sql_case.SqlCase(cast(GdaSqlCase*)(cast(GdaSqlExpr*)this._cPtr).caseS, No.Take);
  }

  /**
      Get `castAs` field.
      Returns: not null if expression must be cast to another data type
  */
  @property string castAs()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlExpr*)this._cPtr).castAs);
  }

  /**
      Set `castAs` field.
      Params:
        propval = not null if expression must be cast to another data type
  */
  @property void castAs(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlExpr*)this._cPtr).castAs);
    dToC(propval, cast(void*)&(cast(GdaSqlExpr*)this._cPtr).castAs);
  }

  /**
      Get `valueIsIdent` field.
      Returns: Please see specific note about the @value field
  */
  @property bool valueIsIdent()
  {
    return cast(bool)(cast(GdaSqlExpr*)this._cPtr).valueIsIdent;
  }

  /**
      Set `valueIsIdent` field.
      Params:
        propval = Please see specific note about the @value field
  */
  @property void valueIsIdent(bool propval)
  {
    (cast(GdaSqlExpr*)this._cPtr).valueIsIdent = propval;
  }

  /**
      Creates a new string representation of the SQL expression. You need to free the returned string
      using [glib.global.gfree];
      Returns: a new string with the SQL expression or "null" in case expr is invalid.
  */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_expr_serialize(cast(GdaSqlExpr*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Sets the expression's parent to the #GdaSqlStatementSelect held by stmt. After
      calling this function stmt is freed.
  
      Params:
        stmt = a #GdaSqlStatement holding the #GdaSqlStatementSelect to take from
  */
  void takeSelect(gda.sql_statement.SqlStatement stmt)
  {
    gda_sql_expr_take_select(cast(GdaSqlExpr*)this._cPtr, stmt ? cast(GdaSqlStatement*)stmt._cPtr(Yes.Dup) : null);
  }
}
