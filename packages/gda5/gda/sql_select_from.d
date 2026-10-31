/// Module for [SqlSelectFrom] class
module gda.sql_select_from;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.sql_select_join;
import gda.sql_select_target;
import gda.types;
import gid.gid;

/**
    This structure represents the FROM clause of a SELECT statement, it lists targets and joins
*/
class SqlSelectFrom
{
  GdaSqlSelectFrom _cInstance;

  /**
      Create a `sql_select_from.SqlSelectFrom` wrap type.
  */
  this() nothrow
  {
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlSelectFrom*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `targets` field.
      Returns: list of #GdaSqlSelectTarget
  */
  @property gda.sql_select_target.SqlSelectTarget[] targets() nothrow
  {
    return gSListToD!(gda.sql_select_target.SqlSelectTarget)((cast(GdaSqlSelectFrom*)this._cPtr).targets);
  }

  /**
      Get `joins` field.
      Returns: list of #GdaSqlSelectJoin
  */
  @property gda.sql_select_join.SqlSelectJoin[] joins() nothrow
  {
    return gSListToD!(gda.sql_select_join.SqlSelectJoin)((cast(GdaSqlSelectFrom*)this._cPtr).joins);
  }

  /**
      Creates a new string description of the FROM clause used in a SELECT statement.
      Returns: a new string with the description of the FROM or "null" in case from is invalid.
  */
  string serialize() nothrow
  {
    char* _cretval;
    _cretval = gda_sql_select_from_serialize(cast(GdaSqlSelectFrom*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
