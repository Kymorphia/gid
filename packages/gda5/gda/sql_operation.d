/// Module for [SqlOperation] class
module gda.sql_operation;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/**
    This structure represents an operation between one or more operands.
*/
class SqlOperation
{
  GdaSqlOperation _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.sql_operation.SqlOperation");

    _cInstance = *cast(GdaSqlOperation*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.types.SqlOperatorType operatorType()
  {
    return cast(gda.types.SqlOperatorType)(cast(GdaSqlOperation*)this._cPtr).operatorType;
  }

  /** */
  @property void operatorType(gda.types.SqlOperatorType propval)
  {
    (cast(GdaSqlOperation*)this._cPtr).operatorType = cast(GdaSqlOperatorType)propval;
  }

  /**
      Creates a new string representing an operator. You need to free the returned string
      using [glib.global.gfree];
      Returns: a new string with the description of the operator or "null" in case operation is invalid.
  */
  string serialize()
  {
    char* _cretval;
    _cretval = gda_sql_operation_serialize(cast(GdaSqlOperation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns #GdaSqlOperatorType that correspond with the string op.
  
      Params:
        op = a #GdaSqlOperation structure
      Returns: #GdaSqlOperatorType
  */
  static gda.types.SqlOperatorType operatorFromString(string op)
  {
    GdaSqlOperatorType _cretval;
    const(char)* _op = op.toCString(No.Alloc);
    _cretval = gda_sql_operation_operator_from_string(_op);
    gda.types.SqlOperatorType _retval = cast(gda.types.SqlOperatorType)_cretval;
    return _retval;
  }

  /**
      Returns a constant string representing a operator name. You don't need to free
      the returned string.
  
      Params:
        op = a #GdaSqlOperation structure
      Returns: a string with the operator's name or NULL in case op is invalid.
  */
  static string operatorToString(gda.types.SqlOperatorType op)
  {
    const(char)* _cretval;
    _cretval = gda_sql_operation_operator_to_string(op);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
