/// Module for [SqlSelectTarget] class
module gda.sql_select_target;

import gda.c.functions;
import gda.c.types;
import gda.meta_db_object;
import gda.sql_expr;
import gda.sql_statement;
import gda.types;
import gid.gid;
import gobject.value;

/**
    This structure represents a target used to fetch data from in a SELECT statement; it can represent a table or
    a sub select. Note that the @table_name
    part <emphasis>will be</emphasis> overwritten by &LIBGDA;,
    set the value of @expr->value instead.
*/
class SqlSelectTarget
{
  GdaSqlSelectTarget _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_select_target.SqlSelectTarget");

    _cInstance = *cast(GdaSqlSelectTarget*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `expr` field.
      Returns: expression
  */
  @property gda.sql_expr.SqlExpr expr()
  {
    return cToD!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlSelectTarget*)this._cPtr).expr);
  }

  /**
      Set `expr` field.
      Params:
        propval = expression
  */
  @property void expr(gda.sql_expr.SqlExpr propval)
  {
    cValueFree!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlSelectTarget*)this._cPtr).expr);
    dToC(propval, cast(void*)&(cast(GdaSqlSelectTarget*)this._cPtr).expr);
  }

  /**
      Get `tableName` field.
      Returns: table name part of @expr if @expr represents a table
  */
  @property string tableName()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlSelectTarget*)this._cPtr).tableName);
  }

  /**
      Set `tableName` field.
      Params:
        propval = table name part of @expr if @expr represents a table
  */
  @property void tableName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlSelectTarget*)this._cPtr).tableName);
    dToC(propval, cast(void*)&(cast(GdaSqlSelectTarget*)this._cPtr).tableName);
  }

  /**
      Get `as` field.
      Returns: alias
  */
  @property string as()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlSelectTarget*)this._cPtr).as);
  }

  /**
      Set `as` field.
      Params:
        propval = alias
  */
  @property void as(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlSelectTarget*)this._cPtr).as);
    dToC(propval, cast(void*)&(cast(GdaSqlSelectTarget*)this._cPtr).as);
  }

  /** */
  @property gda.meta_db_object.MetaDbObject validityMetaObject()
  {
    return new gda.meta_db_object.MetaDbObject(cast(GdaMetaDbObject*)(cast(GdaSqlSelectTarget*)this._cPtr).validityMetaObject, No.Take);
  }

  /**
      Creates a new string representing a target used in a SELECT statement
      after the FROM clause.
      Returns: a new string with the description of the expression or "null" in case field is invalid.
  */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_select_target_serialize(cast(GdaSqlSelectTarget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Sets the target alias (AS) to the string held by alias; after call
      this function alias is freed.
  
      Params:
        alias_ = a #GValue holding the alias string to take from
  */
  void takeAlias(gobject.value.Value alias_)
  {
    gda_sql_select_target_take_alias(cast(GdaSqlSelectTarget*)this._cPtr, alias_ ? cast(GValue*)alias_._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the target to be a SELECT subquery setting target's expression to use
      stmt; after call this function the target owns stmt, then you must not free it.
  
      Params:
        stmt = a #GdaSqlStatement to take
  */
  void takeSelect(gda.sql_statement.SqlStatement stmt)
  {
    gda_sql_select_target_take_select(cast(GdaSqlSelectTarget*)this._cPtr, stmt ? cast(GdaSqlStatement*)stmt._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the target's name using the string stored in value and the expression
      to set its value to point to value; after call this function the target owns
      value, then you must not free it.
  
      Params:
        value = a #GValue to take from
  */
  void takeTableName(gobject.value.Value value)
  {
    gda_sql_select_target_take_table_name(cast(GdaSqlSelectTarget*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }
}
