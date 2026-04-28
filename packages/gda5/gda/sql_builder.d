/// Module for [SqlBuilder] class
module gda.sql_builder;

import gda.c.functions;
import gda.c.types;
import gda.data_handler;
import gda.statement;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gobject.value;

/** */
class SqlBuilder : gobject.object.ObjectWrap
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
    return cast(void function())gda_sql_builder_get_type != &gidSymbolNotFound ? gda_sql_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SqlBuilder self()
  {
    return this;
  }

  /**
      Get builder for [gda.sql_builder.SqlBuilder]
      Returns: New builder object
  */
  static SqlBuilderGidBuilder builder()
  {
    return new SqlBuilderGidBuilder;
  }

  /**
      Create a new #GdaSqlBuilder object to build #GdaStatement or #GdaSqlStatement
      objects of type stmt_type
  
      Params:
        stmtType = the type of statement to build
      Returns: the newly created object, or null if an error occurred (such as unsupported
        statement type)
  */
  this(gda.types.SqlStatementType stmtType)
  {
    GdaSqlBuilder* _cretval;
    _cretval = gda_sql_builder_new(stmtType);
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_sql_builder_error_quark();
    return _retval;
  }

  /**
      Creates a new CASE ... WHEN ... THEN ... ELSE ... END expression. The WHEN expression and the THEN
      expression IDs are taken from the when_array and then_array at the same index, for each index inferior to
      args_size.
  
      Params:
        testExpr = the expression ID representing the test of the CASE, or `0`
        elseExpr = the expression ID representing the ELSE expression, or `0`
        whenArray = an array containing each WHEN expression ID, having at least args_size elements
        thenArray = an array containing each THEN expression ID, having at least args_size elements
      Returns: the ID of the new expression, or `0` if there was an error
  */
  gda.types.SqlBuilderId addCase(gda.types.SqlBuilderId testExpr, gda.types.SqlBuilderId elseExpr, gda.types.SqlBuilderId[] whenArray, gda.types.SqlBuilderId[] thenArray)
  {
    gda.types.SqlBuilderId _retval;
    int _argsSize;
    if (whenArray)
      _argsSize = cast(int)whenArray.length;

    auto _whenArray = whenArray.ptr ? cast(const(GdaSqlBuilderId)*)whenArray.ptr : [GdaSqlBuilderId.init].ptr;
    if (thenArray)
      _argsSize = cast(int)thenArray.length;

    auto _thenArray = thenArray.ptr ? cast(const(GdaSqlBuilderId)*)thenArray.ptr : [GdaSqlBuilderId.init].ptr;
    _retval = gda_sql_builder_add_case_v(cast(GdaSqlBuilder*)this._cPtr, testExpr, elseExpr, _whenArray, _thenArray, _argsSize);
    return _retval;
  }

  /**
      Builds a new expression which represents a condition (or operation).
  
      Params:
        op = type of condition
        op1 = the ID of the 1st argument (not 0)
        op2 = the ID of the 2nd argument (may be `0` if op needs only one operand)
        op3 = the ID of the 3rd argument (may be `0` if op needs only one or two operand)
      Returns: the ID of the new expression, or `0` if there was an error
  */
  gda.types.SqlBuilderId addCond(gda.types.SqlOperatorType op, gda.types.SqlBuilderId op1, gda.types.SqlBuilderId op2, gda.types.SqlBuilderId op3)
  {
    gda.types.SqlBuilderId _retval;
    _retval = gda_sql_builder_add_cond(cast(GdaSqlBuilder*)this._cPtr, op, op1, op2, op3);
    return _retval;
  }

  /**
      Builds a new expression which represents a condition (or operation).
      
      As a side case, if ops_ids_size is 1,
      then op is ignored, and the returned ID represents op_ids[0] (this avoids any problem for example
      when op is GDA_SQL_OPERATOR_TYPE_AND and there is in fact only one operand).
  
      Params:
        op = type of condition
        opIds = an array of ID for the arguments (not `0`)
      Returns: the ID of the new expression, or `0` if there was an error
  */
  gda.types.SqlBuilderId addCondV(gda.types.SqlOperatorType op, gda.types.SqlBuilderId[] opIds)
  {
    gda.types.SqlBuilderId _retval;
    int _opIdsSize;
    if (opIds)
      _opIdsSize = cast(int)opIds.length;

    auto _opIds = opIds.ptr ? cast(const(GdaSqlBuilderId)*)opIds.ptr : [GdaSqlBuilderId.init].ptr;
    _retval = gda_sql_builder_add_cond_v(cast(GdaSqlBuilder*)this._cPtr, op, _opIds, _opIdsSize);
    return _retval;
  }

  /**
      Defines an expression in builder which may be reused to build other parts of a statement.
      
      The new expression will contain the value passed as the value argument.
      
      If value's type is a string then it is possible to customize how the value has to be interpreted by passing a
      specific #GdaDataHandler object as dh. This feature is very rarely used and the dh argument should generally
      be null.
  
      Params:
        dh = deprecated useless argument, just pass null
        value = value to set the expression to, or null or a GDA_TYPE_NULL value to represent an SQL NULL
      Returns: the ID of the new expression, or `0` if there was an error
  */
  gda.types.SqlBuilderId addExprValue(gda.data_handler.DataHandler dh = null, gobject.value.Value value = null)
  {
    gda.types.SqlBuilderId _retval;
    _retval = gda_sql_builder_add_expr_value(cast(GdaSqlBuilder*)this._cPtr, dh ? cast(GdaDataHandler*)(cast(gobject.object.ObjectWrap)dh)._cPtr(No.Dup) : null, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Defines an expression representing a field in builder,
      which may be reused to build other parts of a statement,
      for instance as a parameter to [gda.sql_builder.SqlBuilder.addCond] or
      [gda.sql_builder.SqlBuilder.addFieldValueId].
      
      Calling this with a null table_name is equivalent to calling [gda.sql_builder.SqlBuilder.addId].
      
      For SELECT queries, see [gda.sql_builder.SqlBuilder.selectAddField].
  
      Params:
        fieldName = a field name
        tableName = a table name, or null
      Returns: the ID of the new expression, or `0` if there was an error
  */
  gda.types.SqlBuilderId addFieldId(string fieldName, string tableName = null)
  {
    gda.types.SqlBuilderId _retval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    const(char)* _tableName = tableName.toCString(No.Alloc);
    _retval = gda_sql_builder_add_field_id(cast(GdaSqlBuilder*)this._cPtr, _fieldName, _tableName);
    return _retval;
  }

  /**
      Valid only for: INSERT, UPDATE statements.
      
      Specifies that the field represented by field_name will be set to the value identified
      by value
  
      Params:
        fieldName = a field name
        value = value to set the field to, or null or a GDA_TYPE_NULL value to represent an SQL NULL
  */
  void addFieldValueAsGvalue(string fieldName, gobject.value.Value value = null)
  {
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    gda_sql_builder_add_field_value_as_gvalue(cast(GdaSqlBuilder*)this._cPtr, _fieldName, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Valid only for: INSERT, UPDATE, SELECT statements
      <itemizedlist>
      <listitem><para>For UPDATE: specifies that the field represented by field_id will be set to the value identified
         by value_id.</para></listitem>
      <listitem><para>For SELECT: add a selected item to the statement, and if value_id is not `0`, then use it as an
         alias</para></listitem>
      <listitem><para>For INSERT: if field_id represents an SQL identifier (obtained using [gda.sql_builder.SqlBuilder.addId]): then if
         value_id is not `0` then specifies that the field represented by field_id will be set to the
         value identified by value_id, otherwise just specifies a named field to be given a value.
         If field_id represents a sub SELECT (obtained using [gda.sql_builder.SqlBuilder.addSubSelect]), then
         this method call defines the sub SELECT from which values to insert are taken.</para></listitem>
      </itemizedlist>
      
      See also [gda.sql_builder.SqlBuilder.addFieldValue] and [gda.sql_builder.SqlBuilder.addFieldValueAsGvalue].
  
      Params:
        fieldId = the ID of the field's name or definition
        valueId = the ID of the value to set the field to, or `0`
  */
  void addFieldValueId(gda.types.SqlBuilderId fieldId, gda.types.SqlBuilderId valueId)
  {
    gda_sql_builder_add_field_value_id(cast(GdaSqlBuilder*)this._cPtr, fieldId, valueId);
  }

  /**
      Builds a new expression which represents a function applied to some arguments
  
      Params:
        funcName = the functions's name
        args = an array of IDs representing the function's arguments
      Returns: the ID of the new expression, or `0` if there was an error
  */
  gda.types.SqlBuilderId addFunction(string funcName, gda.types.SqlBuilderId[] args)
  {
    gda.types.SqlBuilderId _retval;
    const(char)* _funcName = funcName.toCString(No.Alloc);
    int _argsSize;
    if (args)
      _argsSize = cast(int)args.length;

    auto _args = args.ptr ? cast(const(GdaSqlBuilderId)*)args.ptr : [GdaSqlBuilderId.init].ptr;
    _retval = gda_sql_builder_add_function_v(cast(GdaSqlBuilder*)this._cPtr, _funcName, _args, _argsSize);
    return _retval;
  }

  /**
      Defines an expression representing an identifier in builder,
      which may be reused to build other parts of a statement,
      for instance as a parameter to [gda.sql_builder.SqlBuilder.addCond] or
      [gda.sql_builder.SqlBuilder.addFieldValueId].
      
      The new expression will contain the str literal.
      For example:
      <programlisting>
      gda_sql_builder_add_id (b, "name")
      gda_sql_builder_add_id (b, "date")
      </programlisting>
      
      will be rendered as SQL as:
      <programlisting>
      name
      "date"
      </programlisting>
      
      because "date" is an SQL reserved keyword.
      
      For fields, see [gda.sql_builder.SqlBuilder.addFieldId].
  
      Params:
        str = a string
      Returns: the ID of the new expression, or `0` if there was an error
  */
  gda.types.SqlBuilderId addId(string str)
  {
    gda.types.SqlBuilderId _retval;
    const(char)* _str = str.toCString(No.Alloc);
    _retval = gda_sql_builder_add_id(cast(GdaSqlBuilder*)this._cPtr, _str);
    return _retval;
  }

  /**
      Defines a parameter in builder which may be reused to build other parts of a statement.
      
      The new expression will contain the string literal.
      For example:
      <programlisting>
      gda_sql_builder_add_param (b, "age", G_TYPE_INT, FALSE)
      </programlisting>
      
      will be rendered as SQL as:
      <programlisting><![CDATA[
      ##age::int
      ]]>
      </programlisting>
  
      Params:
        paramName = parameter's name
        type = parameter's type
        nullok = TRUE if the parameter can be set to null
      Returns: the ID of the new expression, or `0` if there was an error
  */
  gda.types.SqlBuilderId addParam(string paramName, gobject.types.GType type, bool nullok)
  {
    gda.types.SqlBuilderId _retval;
    const(char)* _paramName = paramName.toCString(No.Alloc);
    _retval = gda_sql_builder_add_param(cast(GdaSqlBuilder*)this._cPtr, _paramName, type, nullok);
    return _retval;
  }

  /**
      Add a sub select to a COMPOUND statement
  
      Params:
        subselect = a #GdaSqlBuilder, which has to be a SELECT or compound SELECT. This will be copied.
  */
  void compoundAddSubSelectFromBuilder(gda.sql_builder.SqlBuilder subselect)
  {
    gda_sql_builder_compound_add_sub_select_from_builder(cast(GdaSqlBuilder*)this._cPtr, subselect ? cast(GdaSqlBuilder*)subselect._cPtr(No.Dup) : null);
  }

  /**
      Changes the type of compound which builder is making, for a COMPOUND statement
  
      Params:
        compoundType = a type of compound
  */
  void compoundSetType(gda.types.SqlStatementCompoundType compoundType)
  {
    gda_sql_builder_compound_set_type(cast(GdaSqlBuilder*)this._cPtr, compoundType);
  }

  /**
      Creates a new #GdaStatement statement from builder's contents.
      Returns: a new #GdaStatement object, or null if an error occurred
      Throws: [SqlBuilderException]
  */
  gda.statement.Statement getStatement()
  {
    GdaStatement* _cretval;
    GError *_err;
    _cretval = gda_sql_builder_get_statement(cast(GdaSqlBuilder*)this._cPtr, &_err);
    if (_err)
      throw new SqlBuilderException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.statement.Statement)(cast(GdaStatement*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Imports the an expression located in query into builder.
  
      Params:
        query = a #GdaSqlBuilder object to get expression from
        exprId = a #GdaSqlBuilderId of the expression in query
      Returns: the ID of the new expression, or `0` if there was an error
  */
  gda.types.SqlBuilderId importExpressionFromBuilder(gda.sql_builder.SqlBuilder query, gda.types.SqlBuilderId exprId)
  {
    gda.types.SqlBuilderId _retval;
    _retval = gda_sql_builder_import_expression_from_builder(cast(GdaSqlBuilder*)this._cPtr, query ? cast(GdaSqlBuilder*)query._cPtr(No.Dup) : null, exprId);
    return _retval;
  }

  /**
      Alter a join in a SELECT statement to make its condition use equal field
      values in the fields named field_name in both tables, via the USING keyword.
  
      Params:
        joinId = the ID of the join to modify (not `0`)
        fieldName = the name of the field to use in the join condition (not null)
  */
  void joinAddField(gda.types.SqlBuilderId joinId, string fieldName)
  {
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    gda_sql_builder_join_add_field(cast(GdaSqlBuilder*)this._cPtr, joinId, _fieldName);
  }

  /**
      Valid only for: SELECT statements.
      
      Add a selected selected item to the SELECT statement.
      
      For non-SELECT statements, see [gda.sql_builder.SqlBuilder.addFieldId].
  
      Params:
        fieldName = a field name
        tableName = a table name, or null
        alias_ = an alias (eg. for the "AS" clause), or null
      Returns: the ID of the added field, or `0` if there was an error
  */
  gda.types.SqlBuilderId selectAddField(string fieldName, string tableName = null, string alias_ = null)
  {
    gda.types.SqlBuilderId _retval;
    const(char)* _fieldName = fieldName.toCString(No.Alloc);
    const(char)* _tableName = tableName.toCString(No.Alloc);
    const(char)* _alias_ = alias_.toCString(No.Alloc);
    _retval = gda_sql_builder_select_add_field(cast(GdaSqlBuilder*)this._cPtr, _fieldName, _tableName, _alias_);
    return _retval;
  }

  /**
      Adds a new target to a SELECT statement
  
      Params:
        tableName = the name of the target table
        alias_ = the alias to give to the target, or null
      Returns: the ID of the new target, or `0` if there was an error
  */
  gda.types.SqlBuilderId selectAddTarget(string tableName, string alias_ = null)
  {
    gda.types.SqlBuilderId _retval;
    const(char)* _tableName = tableName.toCString(No.Alloc);
    const(char)* _alias_ = alias_.toCString(No.Alloc);
    _retval = gda_sql_builder_select_add_target(cast(GdaSqlBuilder*)this._cPtr, _tableName, _alias_);
    return _retval;
  }

  /**
      Adds a new target to a SELECT statement. If there already exists a target representing
      the same table and the same alias (or with the same absence of alias) then the same target
      ID is returned instead of the ID of a new target.
  
      Params:
        tableId = the ID of the expression holding a table reference (not `0`)
        alias_ = the alias to give to the target, or null
      Returns: the ID of the new (or existing) target, or `0` if there was an error
  */
  gda.types.SqlBuilderId selectAddTargetId(gda.types.SqlBuilderId tableId, string alias_ = null)
  {
    gda.types.SqlBuilderId _retval;
    const(char)* _alias_ = alias_.toCString(No.Alloc);
    _retval = gda_sql_builder_select_add_target_id(cast(GdaSqlBuilder*)this._cPtr, tableId, _alias_);
    return _retval;
  }

  /**
      Valid only for: SELECT statements
      
      Adds the expr_id expression to the GROUP BY clause's expressions list
  
      Params:
        exprId = the ID of the expression to set use in the GROUP BY clause, or 0 to unset any previous GROUP BY clause
  */
  void selectGroupBy(gda.types.SqlBuilderId exprId)
  {
    gda_sql_builder_select_group_by(cast(GdaSqlBuilder*)this._cPtr, exprId);
  }

  /**
      Adds a new ORDER BY expression to a SELECT statement.
  
      Params:
        exprId = the ID of the expression to use during sorting (not `0`)
        asc = true for an ascending sorting
        collationName = name of the collation to use when sorting, or null
  */
  void selectOrderBy(gda.types.SqlBuilderId exprId, bool asc, string collationName = null)
  {
    const(char)* _collationName = collationName.toCString(No.Alloc);
    gda_sql_builder_select_order_by(cast(GdaSqlBuilder*)this._cPtr, exprId, asc, _collationName);
  }

  /**
      Defines (if distinct is true) or removes (if distinct is false) a DISTINCT clause
      for a SELECT statement.
      
      If distinct is true, then the ID of an expression can be specified as the expr_id argument:
      if not `0`, this is the expression used to apply the DISTINCT clause on (the resuting SQL
      will then usually be "... DISTINCT ON &lt;expression&gt;...").
  
      Params:
        distinct = set to true to have the DISTINCT requirement
        exprId = the ID of the DISTINCT ON expression, or `0` if no expression is to be used. It is ignored
                    if distinct is false.
  */
  void selectSetDistinct(bool distinct, gda.types.SqlBuilderId exprId)
  {
    gda_sql_builder_select_set_distinct(cast(GdaSqlBuilder*)this._cPtr, distinct, exprId);
  }

  /**
      Valid only for: SELECT statements
      
      Sets the HAVING condition of the statement
  
      Params:
        condId = the ID of the expression to set as HAVING condition, or 0 to unset any previous HAVING condition
  */
  void selectSetHaving(gda.types.SqlBuilderId condId)
  {
    gda_sql_builder_select_set_having(cast(GdaSqlBuilder*)this._cPtr, condId);
  }

  /**
      If limit_count_expr_id is not `0`, defines the maximum number of rows in the #GdaDataModel
      resulting from the execution of the built statement. In this case, the offset from which the
      rows must be collected can be defined by the limit_offset_expr_id expression if not `0` (note that
      this feature may not be supported by all the database providers).
      
      If limit_count_expr_id is `0`, then removes any LIMIT which may have been imposed by a previous
      call to this method.
  
      Params:
        limitCountExprId = the ID of the LIMIT expression, or `0`
        limitOffsetExprId = the ID of the OFFSET expression, or `0`
  */
  void selectSetLimit(gda.types.SqlBuilderId limitCountExprId, gda.types.SqlBuilderId limitOffsetExprId)
  {
    gda_sql_builder_select_set_limit(cast(GdaSqlBuilder*)this._cPtr, limitCountExprId, limitOffsetExprId);
  }

  /**
      Valid only for: INSERT, UPDATE, DELETE statements
      
      Sets the name of the table on which the built statement operates.
  
      Params:
        tableName = a table name
  */
  void setTable(string tableName)
  {
    const(char)* _tableName = tableName.toCString(No.Alloc);
    gda_sql_builder_set_table(cast(GdaSqlBuilder*)this._cPtr, _tableName);
  }

  /**
      Valid only for: UPDATE, DELETE, SELECT statements
      
      Sets the WHERE condition of the statement
  
      Params:
        condId = the ID of the expression to set as WHERE condition, or 0 to unset any previous WHERE condition
  */
  void setWhere(gda.types.SqlBuilderId condId)
  {
    gda_sql_builder_set_where(cast(GdaSqlBuilder*)this._cPtr, condId);
  }
}

/// Fluent builder implementation template for [gda.sql_builder.SqlBuilder]
class SqlBuilderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gda.sql_builder.SqlBuilder]
final class SqlBuilderGidBuilder : SqlBuilderGidBuilderImpl!SqlBuilderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SqlBuilder build()
  {
    return new SqlBuilder(cast(void*)createGObject(SqlBuilder._getGType), Yes.Take);
  }
}

class SqlBuilderException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.sql_builder.SqlBuilder.errorQuark, cast(int)code, msg);
  }

  alias Code = SqlBuilderError;
}
