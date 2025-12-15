/// Module for [DataHandler] interface mixin
module gda.data_handler_mixin;

public import gda.data_handler_iface_proxy;
public import gda.c.functions;
public import gda.c.types;
public import gda.types;
public import gid.gid;
public import gobject.object;
public import gobject.types;
public import gobject.value;

/** */
template DataHandlerT()
{


  /**
      Checks wether the GdaDataHandler is able to handle the gda type given as argument.
  
      Params:
        type = a #GType
      Returns: true if the gda type can be handled
  */
  override bool acceptsGType(gobject.types.GType type)
  {
    bool _retval;
    _retval = cast(bool)gda_data_handler_accepts_g_type(cast(GdaDataHandler*)this._cPtr, type);
    return _retval;
  }

  /**
      Get a short description of the GdaDataHandler
      Returns: the description
  */
  override string getDescr()
  {
    const(char)* _cretval;
    _cretval = gda_data_handler_get_descr(cast(GdaDataHandler*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Creates a new GValue which holds a sane initial value to be used if no value is specifically
      provided. For example for a simple string, this would return a new value containing the "" string.
  
      Params:
        type = a #GType
      Returns: the new #GValue, or null if no such value can be created.
  */
  override gobject.value.Value getSaneInitValue(gobject.types.GType type)
  {
    GValue* _cretval;
    _cretval = gda_data_handler_get_sane_init_value(cast(GdaDataHandler*)this._cPtr, type);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new string which is an SQL representation of the given value, the returned string
      can be used directly in an SQL statement. For example if value is a G_TYPE_STRING, then
      the returned string will be correctly quoted. Note however that it is a better practice
      to use variables in statements instead of value literals, see
      the <link linkend="GdaSqlParser.description">GdaSqlParser</link> for more information.
      
      If the value is NULL or is of type GDA_TYPE_NULL,
      or is a G_TYPE_STRING and [gobject.value.Value.getString] returns null, the returned string is "NULL".
  
      Params:
        value = the value to be converted to a string, or null
      Returns: the new string, or null if an error occurred
  */
  override string getSqlFromValue(gobject.value.Value value = null)
  {
    char* _cretval;
    _cretval = gda_data_handler_get_sql_from_value(cast(GdaDataHandler*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a new string which is a "user friendly" representation of the given value
      (in the user's locale, specially for the dates). If the value is
      NULL or is of type GDA_TYPE_NULL, the returned string is a copy of "" (empty string).
      
      Note: the returned value will be in the current locale representation.
  
      Params:
        value = the value to be converted to a string, or null
      Returns: the new string, or null if an error occurred
  */
  override string getStrFromValue(gobject.value.Value value = null)
  {
    char* _cretval;
    _cretval = gda_data_handler_get_str_from_value(cast(GdaDataHandler*)this._cPtr, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a new GValue which represents the SQL value given as argument. This is
      the opposite of the function [gda.data_handler.DataHandler.getSqlFromValue]. The type argument
      is used to determine the real data type requested for the returned value.
      
      If the sql string is null, then the returned GValue is of type GDA_TYPE_NULL;
      if the sql string does not correspond to a valid SQL string for the requested type, then
      the null is returned.
  
      Params:
        sql = an SQL string, or null
        type = a GType
      Returns: the new #GValue or null on error
  */
  override gobject.value.Value getValueFromSql(string sql, gobject.types.GType type)
  {
    GValue* _cretval;
    const(char)* _sql = sql.toCString(No.Alloc);
    _cretval = gda_data_handler_get_value_from_sql(cast(GdaDataHandler*)this._cPtr, _sql, type);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new GValue which represents the str value given as argument. This is
      the opposite of the function [gda.data_handler.DataHandler.getStrFromValue]. The type argument
      is used to determine the real data type requested for the returned value.
      
      If the str string is null, then the returned GValue is of type GDA_TYPE_NULL;
      if the str string does not correspond to a valid string for the requested type, then
      null is returned.
      
      Note: the str string must be in the current locale representation
  
      Params:
        str = a string or null
        type = a GType
      Returns: the new #GValue or null on error
  */
  override gobject.value.Value getValueFromStr(string str, gobject.types.GType type)
  {
    GValue* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gda_data_handler_get_value_from_str(cast(GdaDataHandler*)this._cPtr, _str, type);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
