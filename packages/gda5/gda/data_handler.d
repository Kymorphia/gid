/// Module for [DataHandler] interface
module gda.data_handler;

public import gda.data_handler_iface_proxy;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gobject.value;

/** */
interface DataHandler
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_data_handler_get_type != &gidSymbolNotFound ? gda_data_handler_get_type() : cast(GType)0;
  }

  /**
      Obtain a pointer to a #GdaDataHandler which can manage #GValue values of type for_type. The returned
      data handler will be adapted to use the current locale information (for example dates will be formatted
      taking into account the locale).
      
      The returned pointer is null if there is no default data handler available for the for_type data type
  
      Params:
        forType = a #GType type
      Returns: a #GdaDataHandler which must not be modified or destroyed.
  */
  static gda.data_handler.DataHandler getDefault(gobject.types.GType forType)
  {
    GdaDataHandler* _cretval;
    _cretval = gda_data_handler_get_default(forType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks wether the GdaDataHandler is able to handle the gda type given as argument.
  
      Params:
        type = a #GType
      Returns: true if the gda type can be handled
  */
  bool acceptsGType(gobject.types.GType type);

  /**
      Get a short description of the GdaDataHandler
      Returns: the description
  */
  string getDescr();

  /**
      Creates a new GValue which holds a sane initial value to be used if no value is specifically
      provided. For example for a simple string, this would return a new value containing the "" string.
  
      Params:
        type = a #GType
      Returns: the new #GValue, or null if no such value can be created.
  */
  gobject.value.Value getSaneInitValue(gobject.types.GType type);

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
  string getSqlFromValue(gobject.value.Value value = null);

  /**
      Creates a new string which is a "user friendly" representation of the given value
      (in the user's locale, specially for the dates). If the value is
      NULL or is of type GDA_TYPE_NULL, the returned string is a copy of "" (empty string).
      
      Note: the returned value will be in the current locale representation.
  
      Params:
        value = the value to be converted to a string, or null
      Returns: the new string, or null if an error occurred
  */
  string getStrFromValue(gobject.value.Value value = null);

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
  gobject.value.Value getValueFromSql(string sql, gobject.types.GType type);

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
  gobject.value.Value getValueFromStr(string str, gobject.types.GType type);
}

interface DataHandlerGidBuilderImpl(T)
{
}
