/// Module for [SqlStatementUnknown] class
module gda.sql_statement_unknown;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/**
    Represents any statement which type is not identified (any DDL statement or database specific dialect)
*/
class SqlStatementUnknown
{
  GdaSqlStatementUnknown _cInstance;

  /**
      Create a `sql_statement_unknown.SqlStatementUnknown` wrap type.
  */
  this() nothrow
  {
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementUnknown*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `expressions` field.
      Returns: a list of #GdaSqlExpr pointers
  */
  @property void*[] expressions() nothrow
  {
    return gSListToD!(void*)((cast(GdaSqlStatementUnknown*)this._cPtr).expressions);
  }
}
