/// Module for [SqlStatementCompound] class
module gda.sql_statement_compound;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class SqlStatementCompound
{
  GdaSqlStatementCompound _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_statement_compound.SqlStatementCompound");

    _cInstance = *cast(GdaSqlStatementCompound*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.types.SqlStatementCompoundType compoundType()
  {
    return cast(gda.types.SqlStatementCompoundType)(cast(GdaSqlStatementCompound*)this._cPtr).compoundType;
  }

  /** */
  @property void compoundType(gda.types.SqlStatementCompoundType propval)
  {
    (cast(GdaSqlStatementCompound*)this._cPtr).compoundType = cast(GdaSqlStatementCompoundType)propval;
  }
}
