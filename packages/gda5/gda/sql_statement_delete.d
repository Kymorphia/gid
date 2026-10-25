/// Module for [SqlStatementDelete] class
module gda.sql_statement_delete;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class SqlStatementDelete
{
  GdaSqlStatementDelete _cInstance;

  /**
      Create a `sql_statement_delete.SqlStatementDelete` wrap type.
  */
  this() nothrow
  {
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementDelete*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }
}
