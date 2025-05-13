/// Module for [SqlSelectField] class
module gda.sql_select_field;

import gda.c.functions;
import gda.c.types;
import gda.meta_db_object;
import gda.meta_table_column;
import gda.sql_any_part;
import gda.sql_expr;
import gda.types;
import gid.gid;
import gobject.value;

/**
    This structure represents a selected item in a SELECT statement (when executed, the returned data set
    will have one column per selected item). Note that the @table_name and
    @field_name field parts <emphasis>will be</emphasis> overwritten by &LIBGDA;,
    set the value of @expr->value instead.
*/
class SqlSelectField
{
  GdaSqlSelectField cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_select_field.SqlSelectField");

    cInstance = *cast(GdaSqlSelectField*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `any` field.
      Returns: inheritance structure
  */
  @property gda.sql_any_part.SqlAnyPart any()
  {
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)&(cast(GdaSqlSelectField*)this._cPtr).any);
  }

  /**
      Get `expr` field.
      Returns: expression
  */
  @property gda.sql_expr.SqlExpr expr()
  {
    return cToD!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlSelectField*)this._cPtr).expr);
  }

  /**
      Set `expr` field.
      Params:
        propval = expression
  */
  @property void expr(gda.sql_expr.SqlExpr propval)
  {
    cValueFree!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlSelectField*)this._cPtr).expr);
    dToC(propval, cast(void*)&(cast(GdaSqlSelectField*)this._cPtr).expr);
  }

  /**
      Get `fieldName` field.
      Returns: field name part of @expr if @expr represents a field
  */
  @property string fieldName()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlSelectField*)this._cPtr).fieldName);
  }

  /**
      Set `fieldName` field.
      Params:
        propval = field name part of @expr if @expr represents a field
  */
  @property void fieldName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlSelectField*)this._cPtr).fieldName);
    dToC(propval, cast(void*)&(cast(GdaSqlSelectField*)this._cPtr).fieldName);
  }

  /**
      Get `tableName` field.
      Returns: table name part of @expr if @expr represents a field
  */
  @property string tableName()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlSelectField*)this._cPtr).tableName);
  }

  /**
      Set `tableName` field.
      Params:
        propval = table name part of @expr if @expr represents a field
  */
  @property void tableName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlSelectField*)this._cPtr).tableName);
    dToC(propval, cast(void*)&(cast(GdaSqlSelectField*)this._cPtr).tableName);
  }

  /**
      Get `as` field.
      Returns: alias
  */
  @property string as()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlSelectField*)this._cPtr).as);
  }

  /**
      Set `as` field.
      Params:
        propval = alias
  */
  @property void as(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlSelectField*)this._cPtr).as);
    dToC(propval, cast(void*)&(cast(GdaSqlSelectField*)this._cPtr).as);
  }

  /** */
  @property gda.meta_db_object.MetaDbObject validityMetaObject()
  {
    return new gda.meta_db_object.MetaDbObject(cast(GdaMetaDbObject*)(cast(GdaSqlSelectField*)this._cPtr).validityMetaObject);
  }

  /** */
  @property gda.meta_table_column.MetaTableColumn validityMetaTableColumn()
  {
    return new gda.meta_table_column.MetaTableColumn(cast(GdaMetaTableColumn*)(cast(GdaSqlSelectField*)this._cPtr).validityMetaTableColumn);
  }

  /** */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_select_field_serialize(cast(GdaSqlSelectField*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  void takeAlias(gobject.value.Value alias_)
  {
    gda_sql_select_field_take_alias(cast(GdaSqlSelectField*)this._cPtr, alias_ ? cast(GValue*)alias_._cPtr(No.Dup) : null);
  }

  /** */
  void takeStarValue(gobject.value.Value value)
  {
    gda_sql_select_field_take_star_value(cast(GdaSqlSelectField*)this._cPtr, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
