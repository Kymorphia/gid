/// Module for [SqlStatementUnknown] class
module gda.sql_statement_unknown;

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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_statement_unknown.SqlStatementUnknown");

    _cInstance = *cast(GdaSqlStatementUnknown*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }
}
