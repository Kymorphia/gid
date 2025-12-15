/// Module for [SqlSelectOrder] class
module gda.sql_select_order;

import gda.c.functions;
import gda.c.types;
import gda.sql_any_part;
import gda.sql_expr;
import gda.types;
import gid.gid;

/**
    This structure represents the ordering of a SELECT statement.
*/
class SqlSelectOrder
{
  GdaSqlSelectOrder cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_select_order.SqlSelectOrder");

    cInstance = *cast(GdaSqlSelectOrder*)ptr;

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
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)&(cast(GdaSqlSelectOrder*)this._cPtr).any, No.Take);
  }

  /**
      Get `expr` field.
      Returns: expression to order on
  */
  @property gda.sql_expr.SqlExpr expr()
  {
    return cToD!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlSelectOrder*)this._cPtr).expr);
  }

  /**
      Set `expr` field.
      Params:
        propval = expression to order on
  */
  @property void expr(gda.sql_expr.SqlExpr propval)
  {
    cValueFree!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlSelectOrder*)this._cPtr).expr);
    dToC(propval, cast(void*)&(cast(GdaSqlSelectOrder*)this._cPtr).expr);
  }

  /**
      Get `asc` field.
      Returns: TRUE is ordering is ascending
  */
  @property bool asc()
  {
    return cast(bool)(cast(GdaSqlSelectOrder*)this._cPtr).asc;
  }

  /**
      Set `asc` field.
      Params:
        propval = TRUE is ordering is ascending
  */
  @property void asc(bool propval)
  {
    (cast(GdaSqlSelectOrder*)this._cPtr).asc = propval;
  }

  /**
      Get `collationName` field.
      Returns: name of the collation to use for ordering
  */
  @property string collationName()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlSelectOrder*)this._cPtr).collationName);
  }

  /**
      Set `collationName` field.
      Params:
        propval = name of the collation to use for ordering
  */
  @property void collationName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlSelectOrder*)this._cPtr).collationName);
    dToC(propval, cast(void*)&(cast(GdaSqlSelectOrder*)this._cPtr).collationName);
  }

  /**
      Creates a new string description of the ORDER BY clause used in a SELECT statement.
      Returns: a new string with the description of the ORDER BY or "null" in case order is invalid.
  */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_select_order_serialize(cast(GdaSqlSelectOrder*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
