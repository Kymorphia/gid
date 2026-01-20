/// Module for [SqlTable] class
module gda.sql_table;

import gda.c.functions;
import gda.c.types;
import gda.meta_db_object;
import gda.types;
import gid.gid;
import gobject.value;

/**
    This structure represents the name of a table.
*/
class SqlTable
{
  GdaSqlTable _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_table.SqlTable");

    _cInstance = *cast(GdaSqlTable*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property string tableName()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlTable*)this._cPtr).tableName);
  }

  /** */
  @property void tableName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlTable*)this._cPtr).tableName);
    dToC(propval, cast(void*)&(cast(GdaSqlTable*)this._cPtr).tableName);
  }

  /** */
  @property gda.meta_db_object.MetaDbObject validityMetaObject()
  {
    return new gda.meta_db_object.MetaDbObject(cast(GdaMetaDbObject*)(cast(GdaSqlTable*)this._cPtr).validityMetaObject, No.Take);
  }

  /**
      Creates a new string representing a table. You need to free the returned string
      using [glib.global.gfree];
      Returns: a new string with the name of the field or "null" in case table is invalid.
  */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_table_serialize(cast(GdaSqlTable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Sets the table's name using the string held by value. When call, value is freed using
      [gda.global.valueFree].
  
      Params:
        value = a #GValue holding a string to take from
  */
  void takeName(gobject.value.Value value)
  {
    gda_sql_table_take_name(cast(GdaSqlTable*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }
}
