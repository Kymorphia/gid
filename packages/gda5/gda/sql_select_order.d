/// Module for [SqlSelectOrder] class
module gda.sql_select_order;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.sql_expr;
import gda.types;
import gid.gid;

/**
    This structure represents the ordering of a SELECT statement.
*/
class SqlSelectOrder
{
  GdaSqlSelectOrder _cInstance;

  /**
      Create a `sql_select_order.SqlSelectOrder` wrap type.
      Params:
        expr = expression to order on
        asc = TRUE is ordering is ascending
        collationName = name of the collation to use for ordering
  */
  this(gda.sql_expr.SqlExpr expr = gda.sql_expr.SqlExpr.init, bool asc = bool.init, string collationName = string.init) nothrow
  {
    this.expr = expr;
    this.asc = asc;
    this.collationName = collationName;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlSelectOrder*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  private gda.sql_expr.SqlExpr _exprRef; // Keeps borrowed field value alive

  /**
      Get `expr` field.
      Returns: expression to order on
  */
  @property gda.sql_expr.SqlExpr expr() nothrow
  {
    return cToD!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlSelectOrder*)this._cPtr).expr);
  }

  /**
      Set `expr` field.
      Params:
        propval = expression to order on
  */
  @property void expr(gda.sql_expr.SqlExpr propval) nothrow
  {
    _exprRef = propval;
    (cast(GdaSqlSelectOrder*)this._cPtr).expr = propval ? cast(GdaSqlExpr*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `asc` field.
      Returns: TRUE is ordering is ascending
  */
  @property bool asc() nothrow
  {
    return cast(bool)(cast(GdaSqlSelectOrder*)this._cPtr).asc;
  }

  /**
      Set `asc` field.
      Params:
        propval = TRUE is ordering is ascending
  */
  @property void asc(bool propval) nothrow
  {
    (cast(GdaSqlSelectOrder*)this._cPtr).asc = propval;
  }

  /**
      Get `collationName` field.
      Returns: name of the collation to use for ordering
  */
  @property string collationName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlSelectOrder*)this._cPtr).collationName);
  }

  /**
      Set `collationName` field.
      Params:
        propval = name of the collation to use for ordering
  */
  @property void collationName(string propval) nothrow
  {
    (cast(GdaSqlSelectOrder*)this._cPtr).collationName = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Creates a new string description of the ORDER BY clause used in a SELECT statement.
      Returns: a new string with the description of the ORDER BY or "null" in case order is invalid.
  */
  string serialize() nothrow
  {
    char* _cretval;
    _cretval = gda_sql_select_order_serialize(cast(GdaSqlSelectOrder*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
