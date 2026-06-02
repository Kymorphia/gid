/// Module for [SqlStatementCompound] class
module gda.sql_statement_compound;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class SqlStatementCompound
{
  GdaSqlStatementCompound _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementCompound*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.types.SqlStatementCompoundType compoundType() nothrow
  {
    return cast(gda.types.SqlStatementCompoundType)(cast(GdaSqlStatementCompound*)this._cPtr).compoundType;
  }

  /** */
  @property void compoundType(gda.types.SqlStatementCompoundType propval) nothrow
  {
    (cast(GdaSqlStatementCompound*)this._cPtr).compoundType = cast(GdaSqlStatementCompoundType)propval;
  }
}
