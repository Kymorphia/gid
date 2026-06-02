/// Module for [SqlStatementUpdate] class
module gda.sql_statement_update;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class SqlStatementUpdate
{
  GdaSqlStatementUpdate _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementUpdate*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property string onConflict() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlStatementUpdate*)this._cPtr).onConflict);
  }

  /** */
  @property void onConflict(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlStatementUpdate*)this._cPtr).onConflict);
    dToC(propval, cast(void*)&(cast(GdaSqlStatementUpdate*)this._cPtr).onConflict);
  }
}
