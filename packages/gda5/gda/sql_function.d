/// Module for [SqlFunction] class
module gda.sql_function;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.value;

/**
    This structure represents a function or an aggregate with zero or more arguments.
*/
class SqlFunction
{
  GdaSqlFunction _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_function.SqlFunction");

    _cInstance = *cast(GdaSqlFunction*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `functionName` field.
      Returns: name of the function , in the form [[catalog.]schema.]function_name
  */
  @property string functionName()
  {
    return cToD!(string)(cast(void*)(cast(GdaSqlFunction*)this._cPtr).functionName);
  }

  /**
      Set `functionName` field.
      Params:
        propval = name of the function , in the form [[catalog.]schema.]function_name
  */
  @property void functionName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdaSqlFunction*)this._cPtr).functionName);
    dToC(propval, cast(void*)&(cast(GdaSqlFunction*)this._cPtr).functionName);
  }

  /** */
  void checkClean()
  {
    gda_sql_function_check_clean(cast(GdaSqlFunction*)this._cPtr);
  }

  /**
      Creates a new string representing a function. You need to free the returned string
      using [glib.global.gfree];
      Returns: a new string with the description of the function or "null" in case function is invalid.
  */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_function_serialize(cast(GdaSqlFunction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Sets the function's name using the string held by value. When call, value is freed using
      #[gda.global.valueFree].
  
      Params:
        value = a #GValue holding a string to take from
  */
  void takeName(gobject.value.Value value)
  {
    gda_sql_function_take_name(cast(GdaSqlFunction*)this._cPtr, value ? cast(GValue*)value._cPtr(Yes.Dup) : null);
  }
}
