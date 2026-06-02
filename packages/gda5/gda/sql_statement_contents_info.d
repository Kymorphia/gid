/// Module for [SqlStatementContentsInfo] class
module gda.sql_statement_contents_info;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/**
    Contents' infos
*/
class SqlStatementContentsInfo
{
  GdaSqlStatementContentsInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlStatementContentsInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.types.SqlStatementType type() nothrow
  {
    return cast(gda.types.SqlStatementType)(cast(GdaSqlStatementContentsInfo*)this._cPtr).type;
  }

  /** */
  @property void type(gda.types.SqlStatementType propval) nothrow
  {
    (cast(GdaSqlStatementContentsInfo*)this._cPtr).type = cast(GdaSqlStatementType)propval;
  }

  /** */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlStatementContentsInfo*)this._cPtr).name);
  }

  /** */
  @property void name(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlStatementContentsInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GdaSqlStatementContentsInfo*)this._cPtr).name);
  }

  /** Function alias for field `construct` */
  alias ConstructFuncType = extern(C) void* function();

  /** */
  @property ConstructFuncType construct() nothrow
  {
    return (cast(GdaSqlStatementContentsInfo*)this._cPtr).construct;
  }

  /** Function alias for field `free` */
  alias FreeFuncType = extern(C) void function(void* stm);

  /** */
  @property FreeFuncType free() nothrow
  {
    return (cast(GdaSqlStatementContentsInfo*)this._cPtr).free;
  }

  /** Function alias for field `copy` */
  alias CopyFuncType = extern(C) void* function(void* stm);

  /** */
  @property CopyFuncType copy() nothrow
  {
    return (cast(GdaSqlStatementContentsInfo*)this._cPtr).copy;
  }

  /** Function alias for field `serialize` */
  alias SerializeFuncType = extern(C) char* function(void* stm);

  /** */
  @property SerializeFuncType serialize() nothrow
  {
    return (cast(GdaSqlStatementContentsInfo*)this._cPtr).serialize;
  }
}
