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

  /**
      Create a `sql_statement_update.SqlStatementUpdate` wrap type.
      Params:
        onConflict = 
  */
  this(string onConflict = string.init) nothrow
  {
    this.onConflict = onConflict;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementUpdate*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /** */
  @property string onConflict() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlStatementUpdate*)this._cPtr).onConflict);
  }

  /** */
  @property void onConflict(string propval) nothrow
  {
    (cast(GdaSqlStatementUpdate*)this._cPtr).onConflict = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /** */
  @property void*[] fieldsList() nothrow
  {
    return gSListToD!(void*)((cast(GdaSqlStatementUpdate*)this._cPtr).fieldsList);
  }

  /** */
  @property void*[] exprList() nothrow
  {
    return gSListToD!(void*)((cast(GdaSqlStatementUpdate*)this._cPtr).exprList);
  }
}
