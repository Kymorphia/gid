/// Module for [SqlStatementSelect] class
module gda.sql_statement_select;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class SqlStatementSelect
{
  GdaSqlStatementSelect _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementSelect*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property bool distinct() nothrow
  {
    return cast(bool)(cast(GdaSqlStatementSelect*)this._cPtr).distinct;
  }

  /** */
  @property void distinct(bool propval) nothrow
  {
    (cast(GdaSqlStatementSelect*)this._cPtr).distinct = propval;
  }
}
