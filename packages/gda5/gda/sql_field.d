/// Module for [SqlField] class
module gda.sql_field;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.meta_table_column;
import gda.types;
import gid.gid;
import gobject.value;

/**
    any:
    This structure represents the name of a table's field.
*/
class SqlField
{
  GdaSqlField _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaSqlField*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property string fieldName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlField*)this._cPtr).fieldName);
  }

  /** */
  @property void fieldName(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlField*)this._cPtr).fieldName);
    dToC(propval, cast(void*)&(cast(GdaSqlField*)this._cPtr).fieldName);
  }

  /** */
  @property gda.meta_table_column.MetaTableColumn validityMetaTableColumn() nothrow
  {
    return new gda.meta_table_column.MetaTableColumn(cast(GdaMetaTableColumn*)(cast(GdaSqlField*)this._cPtr).validityMetaTableColumn, No.Take);
  }

  /**
      Creates a new string representing a field. You need to free the returned string
      using [glib.global.gfree];
      Returns: a new string with the name of the field or "null" in case field is invalid.
  */
  string serialize() nothrow
  {
    char* _cretval;
    _cretval = gda_sql_field_serialize(cast(GdaSqlField*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Sets the field's name using the string held by value. When call, value is freed using
      #[gda.global.valueFree].
  
      Params:
        value = a #GValue holding a string to take from
  */
  void takeName(gobject.value.Value value) nothrow
  {
    gda_sql_field_take_name(cast(GdaSqlField*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }
}
