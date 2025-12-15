/// Module for [SqlAnyPart] class
module gda.sql_any_part;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import glib.error;

/**
    Base structure of which all structures (except #GdaSqlStatement) "inherit". It identifies, for each structure,
    its type and its parent in the structure hierarchy.
*/
class SqlAnyPart
{
  GdaSqlAnyPart cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_any_part.SqlAnyPart");

    cInstance = *cast(GdaSqlAnyPart*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `type` field.
      Returns: type of structure, as a #GdaSqlAnyPartType enum.
  */
  @property gda.types.SqlAnyPartType type()
  {
    return cast(gda.types.SqlAnyPartType)(cast(GdaSqlAnyPart*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = type of structure, as a #GdaSqlAnyPartType enum.
  */
  @property void type(gda.types.SqlAnyPartType propval)
  {
    (cast(GdaSqlAnyPart*)this._cPtr).type = cast(GdaSqlAnyPartType)propval;
  }

  /**
      Get `parent` field.
      Returns: pointer to the parent #GdaSqlAnyPart structure
  */
  @property gda.sql_any_part.SqlAnyPart parent()
  {
    return new gda.sql_any_part.SqlAnyPart(cast(GdaSqlAnyPart*)(cast(GdaSqlAnyPart*)this._cPtr).parent, No.Take);
  }

  /**
      Checks for any error in node's structure to make sure it is valid. This
      is the same as [gda.sql_statement.SqlStatement.checkStructure] but for individual #GdaSqlAnyPart
      parts. This function is mainly for database provider's implementations
      Returns: TRUE if no error occurred
      Throws: [ErrorWrap]
  */
  bool checkStructure()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_sql_any_part_check_structure(cast(GdaSqlAnyPart*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
