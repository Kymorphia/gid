/// Module for [ServerProvider] class
module gda.server_provider;

import gda.c.functions;
import gda.c.types;
import gda.connection;
import gda.data_handler;
import gda.server_operation;
import gda.set;
import gda.sql_parser;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.object;
import gobject.types;
import gobject.value;

/** */
class ServerProvider : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_server_provider_get_type != &gidSymbolNotFound ? gda_server_provider_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ServerProvider self()
  {
    return this;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_server_provider_error_quark();
    return _retval;
  }

  /**
      Loads and returns the contents of filename, which is searched in several places
      This function should only be used by database provider's
      implementations
  
      Params:
        instDir = directory where the database provider has been installed
        dataDir = DATA directory to look for ($prefix/share)
        filename = name of the file to load
      Returns: a new string containing filename's contents, or null if not found or if an error occurred
  */
  static string loadFileContents(string instDir, string dataDir, string filename)
  {
    char* _cretval;
    const(char)* _instDir = instDir.toCString(No.Alloc);
    const(char)* _dataDir = dataDir.toCString(No.Alloc);
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gda_server_provider_load_file_contents(_instDir, _dataDir, _filename);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a new #GdaServerOperation object which can be modified in order to perform the type type of
      action. The options can contain:
      <itemizedlist>
       <listitem>named values which ID is a path in the resulting GdaServerOperation object, to initialize some value</listitem>
       <listitem>named values which may change the contents of the GdaServerOperation, see <link linkend="gda-server-op-information-std">this section</link> for more information</listitem>
      </itemizedlist>
  
      Params:
        cnc = a #GdaConnection object which will be used to perform an action, or null
        type = the type of operation requested
        options = a list of parameters or null
      Returns: a new #GdaServerOperation object, or null in the provider does not support the type type of operation or if an error occurred
      Throws: [ServerProviderException]
  */
  gda.server_operation.ServerOperation createOperation(gda.connection.Connection cnc, gda.types.ServerOperationType type, gda.set.Set options = null)
  {
    GdaServerOperation* _cretval;
    GError *_err;
    _cretval = gda_server_provider_create_operation(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, type, options ? cast(GdaSet*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ServerProviderException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.server_operation.ServerOperation)(cast(GdaServerOperation*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GdaSqlParser object which is adapted to provider (and possibly depending on
      cnc for the actual database version).
      
      If prov does not have its own parser, then null is returned, and a general SQL parser can be obtained
      using [gda.sql_parser.SqlParser.new_].
  
      Params:
        cnc = a #GdaConnection, or null
      Returns: a new #GdaSqlParser object, or null.
  */
  gda.sql_parser.SqlParser createParser(gda.connection.Connection cnc = null)
  {
    GdaSqlParser* _cretval;
    _cretval = gda_server_provider_create_parser(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.sql_parser.SqlParser)(cast(GdaSqlParser*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Escapes str for use within an SQL command (to avoid SQL injection attacks). Note that the returned value still needs
      to be enclosed in single quotes before being used in an SQL statement.
  
      Params:
        cnc = a #GdaConnection object, or null
        str = a string to escape
      Returns: a new string suitable to use in SQL statements
  */
  string escapeString(gda.connection.Connection cnc, string str)
  {
    char* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gda_server_provider_escape_string(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _str);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Finds the location of a filename. This function should only be used by database provider's
      implementations
  
      Params:
        instDir = directory where prov is installed
        filename = name of the file to find
      Returns: the complete path to filename, or null if not found
  */
  string findFile(string instDir, string filename)
  {
    char* _cretval;
    const(char)* _instDir = instDir.toCString(No.Alloc);
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gda_server_provider_find_file(cast(GdaServerProvider*)this._cPtr, _instDir, _filename);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Find a #GdaDataHandler object to manipulate data of type for_type.
      
      Note: this function is currently very poorly implemented by database providers.
  
      Params:
        cnc = a #GdaConnection object, or null
        forType = a DBMS type definition
      Returns: a #GdaDataHandler, or null if the provider does not know about the for_type type
  */
  gda.data_handler.DataHandler getDataHandlerDbms(gda.connection.Connection cnc, string forType)
  {
    GdaDataHandler* _cretval;
    const(char)* _forType = forType.toCString(No.Alloc);
    _cretval = gda_server_provider_get_data_handler_dbms(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _forType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, No.Take);
    return _retval;
  }

  /**
      Provides the implementation when the default Libgda's data handlers must be used
  
      Params:
        cnc = a #GdaConnection object, or null
        type = a #GType
        dbmsType = a DBMS type definition
      Returns: a #GdaDataHandler, or null
  
      Deprecated: use [gda.server_provider.ServerProvider.handlerUseDefault] instead
  */
  gda.data_handler.DataHandler getDataHandlerDefault(gda.connection.Connection cnc, gobject.types.GType type, string dbmsType)
  {
    GdaDataHandler* _cretval;
    const(char)* _dbmsType = dbmsType.toCString(No.Alloc);
    _cretval = gda_server_provider_get_data_handler_default(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, type, _dbmsType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, No.Take);
    return _retval;
  }

  /**
      Find a #GdaDataHandler object to manipulate data of type for_type. The returned object must not be modified.
  
      Params:
        cnc = a #GdaConnection object, or null
        forType = a #GType
      Returns: a #GdaDataHandler, or null if the provider does not support the requested for_type data type
  */
  gda.data_handler.DataHandler getDataHandlerGType(gda.connection.Connection cnc, gobject.types.GType forType)
  {
    GdaDataHandler* _cretval;
    _cretval = gda_server_provider_get_data_handler_g_type(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, forType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the name of the most common data type which has type type.
      
      The returned value may be null either if the provider does not implement that method, or if
      there is no DBMS data type which could contain data of the g_type type (for example null may be
      returned if a DBMS has integers only up to 4 bytes and a #G_TYPE_INT64 is requested).
  
      Params:
        cnc = a #GdaConnection object or null
        type = a #GType value type
      Returns: the name of the DBMS type, or null
  */
  string getDefaultDbmsType(gda.connection.Connection cnc, gobject.types.GType type)
  {
    const(char)* _cretval;
    _cretval = gda_server_provider_get_default_dbms_type(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, type);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the name (identifier) of the provider
      Returns: a string containing the provider's name
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gda_server_provider_get_name(cast(GdaServerProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the version of the database to which the connection is opened.
  
      Params:
        cnc = a #GdaConnection object
      Returns: a (read only) string, or null if an error occurred
  */
  string getServerVersion(gda.connection.Connection cnc)
  {
    const(char)* _cretval;
    _cretval = gda_server_provider_get_server_version(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the version of the provider.
      Returns: a string containing the version identification.
  */
  string getVersion()
  {
    const(char)* _cretval;
    _cretval = gda_server_provider_get_version(cast(GdaServerProvider*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  void handlerDeclare(gda.data_handler.DataHandler dh, gda.connection.Connection cnc, gobject.types.GType gType, string dbmsType)
  {
    const(char)* _dbmsType = dbmsType.toCString(No.Alloc);
    gda_server_provider_handler_declare(cast(GdaServerProvider*)this._cPtr, dh ? cast(GdaDataHandler*)(cast(gobject.object.ObjectWrap)dh)._cPtr(No.Dup) : null, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, gType, _dbmsType);
  }

  /**
      Reserved to database provider's implementations: get the #GdaDataHandler associated to prov
      for connection cnc. You probably want to use [gda.server_provider.ServerProvider.getDataHandlerGType].
  
      Params:
        cnc = a #GdaConnection
        gType = a #GType
        dbmsType = a database type
      Returns: the requested #GdaDataHandler, or null if none found
  */
  gda.data_handler.DataHandler handlerFind(gda.connection.Connection cnc, gobject.types.GType gType, string dbmsType = null)
  {
    GdaDataHandler* _cretval;
    const(char)* _dbmsType = dbmsType.toCString(No.Alloc);
    _cretval = gda_server_provider_handler_find(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, gType, _dbmsType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_handler.DataHandler)(cast(GdaDataHandler*)_cretval, No.Take);
    return _retval;
  }

  /**
      This is a factory method to get a unique instance of a #GdaSqlParser object
      for each #GdaServerProvider object
      Don't unref it.
      Returns: a #GdaSqlParser
  */
  gda.sql_parser.SqlParser internalGetParser()
  {
    GdaSqlParser* _cretval;
    _cretval = gda_server_provider_internal_get_parser(cast(GdaServerProvider*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.sql_parser.SqlParser)(cast(GdaSqlParser*)_cretval, No.Take);
    return _retval;
  }

  /**
      Performs the operation described by op. Note that op is not destroyed by this method
      and can be reused.
  
      Params:
        cnc = a #GdaConnection object which will be used to perform the action, or null
        op = a #GdaServerOperation object
      Returns: true if no error occurred
      Throws: [ServerProviderException]
  */
  bool performOperation(gda.connection.Connection cnc, gda.server_operation.ServerOperation op)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_server_provider_perform_operation(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, op ? cast(GdaServerOperation*)op._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ServerProviderException(_err);
    return _retval;
  }

  /**
      Performs the operation described by op, using the SQL from the rendering of the operation
  
      Params:
        cnc = a #GdaConnection object which will be used to perform an action, or null
        op = a #GdaServerOperation object
      Returns: true if no error occurred
      Throws: [ServerProviderException]
  */
  bool performOperationDefault(gda.connection.Connection cnc, gda.server_operation.ServerOperation op)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_server_provider_perform_operation_default(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, op ? cast(GdaServerOperation*)op._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ServerProviderException(_err);
    return _retval;
  }

  /**
      Creates an SQL statement (possibly using some specific extensions of the DBMS) corresponding to the
      op operation. Note that the returned string may actually contain more than one SQL statement.
      
      This function's purpose is mainly informative to get the actual SQL code which would be executed to perform
      the operation; to actually perform the operation, use [gda.server_provider.ServerProvider.performOperation].
  
      Params:
        cnc = a #GdaConnection object which will be used to render the action, or null
        op = a #GdaServerOperation object
      Returns: a new string, or null if an error occurred or operation cannot be rendered as SQL.
      Throws: [ServerProviderException]
  */
  string renderOperation(gda.connection.Connection cnc, gda.server_operation.ServerOperation op)
  {
    char* _cretval;
    GError *_err;
    _cretval = gda_server_provider_render_operation(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, op ? cast(GdaServerOperation*)op._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ServerProviderException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Use provider to create a new #GValue from a single string representation.
      
      The preferred_type can optionally ask provider to return a #GValue of the requested type
      (but if such a value can't be created from string, then null is returned);
      pass #G_TYPE_INVALID if any returned type is acceptable.
      
      The returned value is either a new #GValue or null in the following cases:
      $(LIST
        * string cannot be converted to preferred_type type
        * the provider does not handle preferred_type
        * the provider could not make a #GValue from string
      )
        
      If dbms_type is not null, then if will contain a constant string representing
      the database type used for the conversion if the conversion was successfull, or null
      otherwise.
  
      Params:
        cnc = a #GdaConnection object, or null
        string_ = the SQL string to convert to a value
        preferredType = a #GType, or #G_TYPE_INVALID
        dbmsType = place to get the actual database type used if the conversion succeeded, or null
      Returns: a new #GValue, or null
  */
  gobject.value.Value stringToValue(gda.connection.Connection cnc, string string_, gobject.types.GType preferredType, out string dbmsType)
  {
    GValue* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    char* _dbmsType;
    _cretval = gda_server_provider_string_to_value(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _string_, preferredType, &_dbmsType);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, Yes.Take) : null;
    dbmsType = _dbmsType.fromCString(No.Free);
    return _retval;
  }

  /**
      Tests if a feature is supported
  
      Params:
        cnc = a #GdaConnection object, or null
        feature = #GdaConnectionFeature feature to test
      Returns: true if feature is supported
  */
  bool supportsFeature(gda.connection.Connection cnc, gda.types.ConnectionFeature feature)
  {
    bool _retval;
    _retval = cast(bool)gda_server_provider_supports_feature(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, feature);
    return _retval;
  }

  /**
      Tells if provider supports the type of operation on the cnc connection, using the
      (optional) options parameters.
  
      Params:
        cnc = a #GdaConnection object which would be used to perform an action, or null
        type = the type of operation requested
        options = a list of named parameters, or null
      Returns: true if the operation is supported
  */
  bool supportsOperation(gda.connection.Connection cnc, gda.types.ServerOperationType type, gda.set.Set options = null)
  {
    bool _retval;
    _retval = cast(bool)gda_server_provider_supports_operation(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, type, options ? cast(GdaSet*)options._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Unescapes str for use within an SQL command. This is the exact opposite of [gda.server_provider.ServerProvider.escapeString].
  
      Params:
        cnc = a #GdaConnection object, or null
        str = a string to escape
      Returns: a new string
  */
  string unescapeString(gda.connection.Connection cnc, string str)
  {
    char* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gda_server_provider_unescape_string(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, _str);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Produces a fully quoted and escaped string from a GValue
  
      Params:
        cnc = a #GdaConnection object, or null
        from = #GValue to convert from
      Returns: escaped and quoted value or NULL if not supported.
  */
  string valueToSqlString(gda.connection.Connection cnc, gobject.value.Value from)
  {
    char* _cretval;
    _cretval = gda_server_provider_value_to_sql_string(cast(GdaServerProvider*)this._cPtr, cnc ? cast(GdaConnection*)cnc._cPtr(No.Dup) : null, from ? cast(GValue*)from._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

class ServerProviderException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.server_provider.ServerProvider.errorQuark, cast(int)code, msg);
  }

  alias Code = ServerProviderError;
}
