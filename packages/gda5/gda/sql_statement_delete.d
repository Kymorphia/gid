/// Module for [SqlStatementDelete] class
module gda.sql_statement_delete;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class SqlStatementDelete
{
  GdaSqlStatementDelete _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_statement_delete.SqlStatementDelete");

    _cInstance = *cast(GdaSqlStatementDelete*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }
}
