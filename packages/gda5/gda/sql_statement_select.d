/// Module for [SqlStatementSelect] class
module gda.sql_statement_select;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class SqlStatementSelect
{
  GdaSqlStatementSelect cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_statement_select.SqlStatementSelect");

    cInstance = *cast(GdaSqlStatementSelect*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /** */
  @property bool distinct()
  {
    return (cast(GdaSqlStatementSelect*)this._cPtr).distinct;
  }

  /** */
  @property void distinct(bool propval)
  {
    (cast(GdaSqlStatementSelect*)this._cPtr).distinct = propval;
  }
}
