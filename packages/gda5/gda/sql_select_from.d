/// Module for [SqlSelectFrom] class
module gda.sql_select_from;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/**
    This structure represents the FROM clause of a SELECT statement, it lists targets and joins
*/
class SqlSelectFrom
{
  GdaSqlSelectFrom _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_select_from.SqlSelectFrom");

    _cInstance = *cast(GdaSqlSelectFrom*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Creates a new string description of the FROM clause used in a SELECT statement.
      Returns: a new string with the description of the FROM or "null" in case from is invalid.
  */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_select_from_serialize(cast(GdaSqlSelectFrom*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
