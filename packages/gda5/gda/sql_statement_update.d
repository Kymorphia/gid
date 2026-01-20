/// Module for [SqlStatementUpdate] class
module gda.sql_statement_update;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class SqlStatementUpdate
{
  GdaSqlStatementUpdate _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_statement_update.SqlStatementUpdate");

    _cInstance = *cast(GdaSqlStatementUpdate*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property string onConflict()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlStatementUpdate*)this._cPtr).onConflict);
  }

  /** */
  @property void onConflict(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlStatementUpdate*)this._cPtr).onConflict);
    dToC(propval, cast(void*)&(cast(GdaSqlStatementUpdate*)this._cPtr).onConflict);
  }
}
