/// Module for [SqlCase] class
module gda.sql_case;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.sql_expr;
import gda.types;
import gid.gid;

/**
    This structure represents a CASE WHEN... construct
*/
class SqlCase
{
  GdaSqlCase _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlCase*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `baseExpr` field.
      Returns: expression to test
  */
  @property gda.sql_expr.SqlExpr baseExpr() nothrow
  {
    return cToD!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlCase*)this._cPtr).baseExpr);
  }

  /**
      Set `baseExpr` field.
      Params:
        propval = expression to test
  */
  @property void baseExpr(gda.sql_expr.SqlExpr propval) nothrow
  {
    cValueFree!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlCase*)this._cPtr).baseExpr);
    dToC(propval, cast(void*)&(cast(GdaSqlCase*)this._cPtr).baseExpr);
  }

  /**
      Get `elseExpr` field.
      Returns: default expression for the CASE
  */
  @property gda.sql_expr.SqlExpr elseExpr() nothrow
  {
    return cToD!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlCase*)this._cPtr).elseExpr);
  }

  /**
      Set `elseExpr` field.
      Params:
        propval = default expression for the CASE
  */
  @property void elseExpr(gda.sql_expr.SqlExpr propval) nothrow
  {
    cValueFree!(gda.sql_expr.SqlExpr)(cast(void*)(cast(GdaSqlCase*)this._cPtr).elseExpr);
    dToC(propval, cast(void*)&(cast(GdaSqlCase*)this._cPtr).elseExpr);
  }

  /**
      Creates a new string representing a CASE clause. You need to free the returned string
      using [glib.global.gfree];
      Returns: a new string with the description of the CASE clause or "null" in case sc is invalid.
  */
  string serialize() nothrow
  {
    char* _cretval;
    _cretval = gda_sql_case_serialize(cast(GdaSqlCase*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
