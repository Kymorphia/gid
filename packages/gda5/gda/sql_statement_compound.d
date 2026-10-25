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

  /**
      Create a `sql_statement_compound.SqlStatementCompound` wrap type.
      Params:
        compoundType = 
  */
  this(gda.types.SqlStatementCompoundType compoundType = gda.types.SqlStatementCompoundType.init) nothrow
  {
    this.compoundType = compoundType;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementCompound*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
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

  /** */
  @property void*[] stmtList() nothrow
  {
    return gSListToD!(void*)((cast(GdaSqlStatementCompound*)this._cPtr).stmtList);
  }
}
