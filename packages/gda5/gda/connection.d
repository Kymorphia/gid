/// Module for [Connection] class
module gda.connection;

import gda.batch;
import gda.c.functions;
import gda.c.types;
import gda.connection_event;
import gda.data_model;
import gda.holder;
import gda.lockable;
import gda.lockable_mixin;
import gda.meta_context;
import gda.meta_store;
import gda.pstmt;
import gda.server_operation;
import gda.server_provider;
import gda.set;
import gda.sql_parser;
import gda.statement;
import gda.transaction_status;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.value;

/** */
class Connection : gobject.object.ObjectWrap, gda.lockable.Lockable
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
    return cast(void function())gda_connection_get_type != &gidSymbolNotFound ? gda_connection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Connection self()
  {
    return this;
  }

  /** */
  @property string authString()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("auth-string");
  }

  /** */
  @property void authString(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("auth-string", propval);
  }

  /** */
  @property string cncString()
  {
    return getCncString();
  }

  /** */
  @property void cncString(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("cnc-string", propval);
  }

  /** */
  @property string dsn()
  {
    return getDsn();
  }

  /** */
  @property void dsn(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("dsn", propval);
  }

  /**
      Get `eventsHistorySize` property.
      Returns: Defines the number of #GdaConnectionEvent objects kept in memory which can
        be fetched using [gda.connection.Connection.getEvents].
  */
  @property int eventsHistorySize()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("events-history-size");
  }

  /**
      Set `eventsHistorySize` property.
      Params:
        propval = Defines the number of #GdaConnectionEvent objects kept in memory which can
          be fetched using [gda.connection.Connection.getEvents].
  */
  @property void eventsHistorySize(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("events-history-size", propval);
  }

  /**
      Get `executionSlowdown` property.
      Returns: Artificially slows down the execution of queries. This property can be used to
        debug some problems. If non zero, this value is the number of microseconds waited before actually
        executing each query.
  */
  @property uint executionSlowdown()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("execution-slowdown");
  }

  /**
      Set `executionSlowdown` property.
      Params:
        propval = Artificially slows down the execution of queries. This property can be used to
          debug some problems. If non zero, this value is the number of microseconds waited before actually
          executing each query.
  */
  @property void executionSlowdown(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("execution-slowdown", propval);
  }

  /**
      Get `executionTimer` property.
      Returns: Computes execution times for each statement executed.
  */
  @property bool executionTimer()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("execution-timer");
  }

  /**
      Set `executionTimer` property.
      Params:
        propval = Computes execution times for each statement executed.
  */
  @property void executionTimer(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("execution-timer", propval);
  }

  /**
      Get `isWrapper` property.
      Returns: This property, if set to true, specifies that the connection is not a real connection, but rather
        a #GdaConnection object which "proxies" all the calls to another connection which executes in a sub
        thread.
        
        Note: this property is used internally by Libgda and should not be directly used by any programs. Setting
        this property has no effect, reading it is supported, though.
  */
  @property bool isWrapper()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("is-wrapper");
  }

  /**
      Set `isWrapper` property.
      Params:
        propval = This property, if set to true, specifies that the connection is not a real connection, but rather
          a #GdaConnection object which "proxies" all the calls to another connection which executes in a sub
          thread.
          
          Note: this property is used internally by Libgda and should not be directly used by any programs. Setting
          this property has no effect, reading it is supported, though.
  */
  @property void isWrapper(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("is-wrapper", propval);
  }

  /** */
  @property gda.meta_store.MetaStore metaStore()
  {
    return getMetaStore();
  }

  /** */
  @property void metaStore(gda.meta_store.MetaStore propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.meta_store.MetaStore)("meta-store", propval);
  }

  /**
      Get `monitorWrappedInMainloop` property.
      Returns: Useful only when there is a mainloop and when the connection acts as a thread wrapper around another connection,
        it sets up a timeout to handle signals coming from the wrapped connection.
        
        If the connection is not a thread wrapper, then this property has no effect.
  */
  @property bool monitorWrappedInMainloop()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("monitor-wrapped-in-mainloop");
  }

  /**
      Set `monitorWrappedInMainloop` property.
      Params:
        propval = Useful only when there is a mainloop and when the connection acts as a thread wrapper around another connection,
          it sets up a timeout to handle signals coming from the wrapped connection.
          
          If the connection is not a thread wrapper, then this property has no effect.
  */
  @property void monitorWrappedInMainloop(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("monitor-wrapped-in-mainloop", propval);
  }

  /** */
  @property gda.server_provider.ServerProvider provider()
  {
    return getProvider();
  }

  /** */
  @property void provider(gda.server_provider.ServerProvider propval)
  {
    gobject.object.ObjectWrap.setProperty!(gda.server_provider.ServerProvider)("provider", propval);
  }

  /** */
  @property void* threadOwner()
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("thread-owner");
  }

  /** */
  @property void threadOwner(void* propval)
  {
    gobject.object.ObjectWrap.setProperty!(void*)("thread-owner", propval);
  }

  mixin LockableT!();

  /**
      This function is similar to [gda.connection.Connection.openFromDsn], except it does not actually open the
      connection, you have to open it using [gda.connection.Connection.open].
  
      Params:
        dsn = data source name.
        authString = authentication string, or null
        options = options for the connection (see #GdaConnectionOptions).
      Returns: a new #GdaConnection if connection opening was successful or null if there was an error.
      Throws: [ConnectionException]
  */
  static gda.connection.Connection newFromDsn(string dsn, string authString, gda.types.ConnectionOptions options)
  {
    GdaConnection* _cretval;
    const(char)* _dsn = dsn.toCString(No.Alloc);
    const(char)* _authString = authString.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_connection_new_from_dsn(_dsn, _authString, options, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.connection.Connection)(cast(GdaConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function is similar to [gda.connection.Connection.openFromString], except it does not actually open the
      connection, you have to open it using [gda.connection.Connection.open].
  
      Params:
        providerName = provider ID to connect to, or null
        cncString = connection string.
        authString = authentication string, or null
        options = options for the connection (see #GdaConnectionOptions).
      Returns: a new #GdaConnection if connection opening was successful or null if there was an error.
      Throws: [ConnectionException]
  */
  static gda.connection.Connection newFromString(string providerName, string cncString, string authString, gda.types.ConnectionOptions options)
  {
    GdaConnection* _cretval;
    const(char)* _providerName = providerName.toCString(No.Alloc);
    const(char)* _cncString = cncString.toCString(No.Alloc);
    const(char)* _authString = authString.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_connection_new_from_string(_providerName, _cncString, _authString, options, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.connection.Connection)(cast(GdaConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_connection_error_quark();
    return _retval;
  }

  /**
      This function is the way of opening database connections with libgda, using a pre-defined data source (DSN),
      see [gda.config.Config.defineDsn] for more information about how to define a DSN. If you don't want to define
      a DSN, it is possible to use [gda.connection.Connection.openFromString] instead of this method.
      
      The dsn string must have the following format: "[&lt;username&gt;[:&lt;password&gt;]@]&lt;DSN&gt;"
      (if &lt;username&gt; and/or &lt;password&gt; are provided, and auth_string is null, then these username
      and passwords will be used). Note that if provided, &lt;username&gt; and &lt;password&gt;
      must be encoded as per RFC 1738, see [gda.global.rfc1738Encode] for more information.
      
      The auth_string can contain the authentication information for the server
      to accept the connection. It is a string containing semi-colon seperated named value, usually
      like "USERNAME=...;PASSWORD=..." where the ... are replaced by actual values. Note that each
      name and value must be encoded as per RFC 1738, see [gda.global.rfc1738Encode] for more information.
      
      The actual named parameters required depend on the provider being used, and that list is available
      as the <parameter>auth_params</parameter> member of the #GdaProviderInfo structure for each installed
      provider (use [gda.config.Config.getProviderInfo] to get it). Also one can use the "gda-sql-5.0 -L" command to
      list the possible named parameters.
      
      This method may fail with a GDA_CONNECTION_ERROR domain error (see the #GdaConnectionError error codes)
      or a `GDA_CONFIG_ERROR` domain error (see the #GdaConfigError error codes).
  
      Params:
        dsn = data source name.
        authString = authentication string, or null
        options = options for the connection (see #GdaConnectionOptions).
      Returns: a new #GdaConnection if connection opening was successful or null if there was an error.
      Throws: [ConnectionException]
  */
  static gda.connection.Connection openFromDsn(string dsn, string authString, gda.types.ConnectionOptions options)
  {
    GdaConnection* _cretval;
    const(char)* _dsn = dsn.toCString(No.Alloc);
    const(char)* _authString = authString.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_connection_open_from_dsn(_dsn, _authString, options, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.connection.Connection)(cast(GdaConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Opens a connection given a provider ID and a connection string. This
      allows applications to open connections without having to create
      a data source (DSN) in the configuration. The format of cnc_string is
      similar to PostgreSQL and MySQL connection strings. It is a semicolumn-separated
      series of &lt;key&gt;=&lt;value&gt; pairs, where each key and value are encoded as per RFC 1738,
      see [gda.global.rfc1738Encode] for more information.
      
      The possible keys depend on the provider, the "gda-sql-5.0 -L" command
      can be used to list the actual keys for each installed database provider.
      
      For example the connection string to open an SQLite connection to a database
      file named "my_data.db" in the current directory would be <constant>"DB_DIR=.;DB_NAME=my_data"</constant>.
      
      The cnc_string string must have the following format:
      "[&lt;provider&gt;://][&lt;username&gt;[:&lt;password&gt;]@]&lt;connection_params&gt;"
      (if &lt;username&gt; and/or &lt;password&gt; are provided, and auth_string is null, then these username
      and passwords will be used, and if &lt;provider&gt; is provided and provider_name is null then this
      provider will be used). Note that if provided, &lt;username&gt;, &lt;password&gt; and  &lt;provider&gt;
      must be encoded as per RFC 1738, see [gda.global.rfc1738Encode] for more information.
      
      The auth_string must contain the authentication information for the server
      to accept the connection. It is a string containing semi-colon seperated named values, usually
      like "USERNAME=...;PASSWORD=..." where the ... are replaced by actual values. Note that each
      name and value must be encoded as per RFC 1738, see [gda.global.rfc1738Encode] for more information.
      
      The actual named parameters required depend on the provider being used, and that list is available
      as the <parameter>auth_params</parameter> member of the #GdaProviderInfo structure for each installed
      provider (use [gda.config.Config.getProviderInfo] to get it). Similarly to the format of the connection
      string, use the "gda-sql-5.0 -L" command to list the possible named parameters.
      
      Additionally, it is possible to have the connection string
      respect the "&lt;provider_name&gt;://&lt;real cnc string&gt;" format, in which case the provider name
      and the real connection string will be extracted from that string (note that if provider_name
      is not null then it will still be used as the provider ID).\
      
      This method may fail with a GDA_CONNECTION_ERROR domain error (see the #GdaConnectionError error codes)
      or a `GDA_CONFIG_ERROR` domain error (see the #GdaConfigError error codes).
  
      Params:
        providerName = provider ID to connect to, or null
        cncString = connection string.
        authString = authentication string, or null
        options = options for the connection (see #GdaConnectionOptions).
      Returns: a new #GdaConnection if connection opening was successful or null if there was an error.
      Throws: [ConnectionException]
  */
  static gda.connection.Connection openFromString(string providerName, string cncString, string authString, gda.types.ConnectionOptions options)
  {
    GdaConnection* _cretval;
    const(char)* _providerName = providerName.toCString(No.Alloc);
    const(char)* _cncString = cncString.toCString(No.Alloc);
    const(char)* _authString = authString.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_connection_open_from_string(_providerName, _cncString, _authString, options, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.connection.Connection)(cast(GdaConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Opens an SQLite connection even if the SQLite provider is not installed,
      to be used by database providers which need a temporary database to store
      some information.
  
      Params:
        directory = the directory the database file will be in, or null for the default TMP directory
        filename = the database file name
        autoUnlink = if true, then the database file will be removed afterwards
      Returns: a new #GdaConnection, or null if an error occurred
  */
  static gda.connection.Connection openSqlite(string directory, string filename, bool autoUnlink)
  {
    GdaConnection* _cretval;
    const(char)* _directory = directory.toCString(No.Alloc);
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gda_connection_open_sqlite(_directory, _filename, autoUnlink);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.connection.Connection)(cast(GdaConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Extract the provider, connection parameters, username and password from string.
      in string, the various parts are strings
      which are expected to be encoded using an RFC 1738 compliant encoding. If they are specified,
      the returned provider, username and password strings are correctly decoded.
      
      For example all the following connection strings:
      <programlisting><![CDATA[
      PostgreSQL://meme:passDB_NAME=mydb;HOST=server
      PostgreSQL://memeDB_NAME=mydb;HOST=server;PASSWORD=pass
      PostgreSQL://memeDB_NAME=mydb;PASSWORD=pass;HOST=server
      PostgreSQL://memePASSWORD=pass;DB_NAME=mydb;HOST=server
      PostgreSQL://DB_NAME=mydb;HOST=server;USERNAME=meme;PASSWORD=pass
      PostgreSQL://DB_NAME=mydb;HOST=server;PASSWORD=pass;USERNAME=meme
      PostgreSQL://DB_NAME=mydb;USERNAME=meme;PASSWORD=pass;HOST=server
      PostgreSQL://PASSWORD=pass;USERNAME=meme;DB_NAME=mydb;HOST=server
      PostgreSQL://:passUSERNAME=meme;DB_NAME=mydb;HOST=server
      PostgreSQL://:passDB_NAME=mydb;HOST=server;USERNAME=meme]]></programlisting>
      
      will return the following new strings (double quotes added here to delimit strings):
      <programlisting><![CDATA[
      out_cnc_params: "DB_NAME=mydb;HOST=server"
      out_provider: "PostgreSQL"
      out_username: "meme"
      out_password: "pass"]]></programlisting>
  
      Params:
        string_ = a string in the "[&lt;provider&gt;://][&lt;username&gt;[:&lt;password&gt;]@]&lt;connection_params&gt;" form
        outCncParams = a place to store the new string containing the &lt;connection_params&gt; part
        outProvider = a place to store the new string containing the &lt;provider&gt; part
        outUsername = a place to store the new string containing the &lt;username&gt; part
        outPassword = a place to store the new string containing the &lt;password&gt; part, or null
  */
  static void stringSplit(string string_, out string outCncParams, out string outProvider, out string outUsername, out string outPassword)
  {
    const(char)* _string_ = string_.toCString(No.Alloc);
    char* _outCncParams;
    char* _outProvider;
    char* _outUsername;
    char* _outPassword;
    gda_connection_string_split(_string_, &_outCncParams, &_outProvider, &_outUsername, &_outPassword);
    outCncParams = _outCncParams.fromCString(No.Free);
    outProvider = _outProvider.fromCString(No.Free);
    outUsername = _outUsername.fromCString(No.Free);
    outPassword = _outPassword.fromCString(No.Free);
  }

  /**
      Adds an event to the given connection. This function is usually
      called by providers, to inform clients of events that happened
      during some operation.
      
      As soon as a provider (or a client, it does not matter) calls this
      function with an event object which is an error,
      the connection object emits the "error" signal, to which clients can connect to be
      informed of events.
      
      WARNING: the reference to the event object is stolen by this function!
  
      Params:
        event = is stored internally, so you don't need to unref it.
  */
  void addEvent(gda.connection_event.ConnectionEvent event)
  {
    gda_connection_add_event(cast(GdaConnection*)this._cPtr, event ? cast(GdaConnectionEvent*)event._cPtr(Yes.Dup) : null);
  }

  /**
      Declares that prepared_stmt is a prepared statement object associated to gda_stmt within the connection
      (meaning the connection increments the reference counter of prepared_stmt).
      
      If gda_stmt changes or is destroyed, the the association will be lost and the connection will lose the
      reference it has on prepared_stmt.
  
      Params:
        gdaStmt = a #GdaStatement object
        preparedStmt = a prepared statement object (as a #GdaPStmt object, or more likely a descendant)
  */
  void addPreparedStatement(gda.statement.Statement gdaStmt, gda.pstmt.PStmt preparedStmt)
  {
    gda_connection_add_prepared_statement(cast(GdaConnection*)this._cPtr, gdaStmt ? cast(GdaStatement*)gdaStmt._cPtr(No.Dup) : null, preparedStmt ? cast(GdaPStmt*)preparedStmt._cPtr(No.Dup) : null);
  }

  /**
      Adds a SAVEPOINT named name.
  
      Params:
        name = name of the savepoint to add
      Returns: TRUE if no error occurred
      Throws: [ConnectionException]
  */
  bool addSavepoint(string name = null)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_connection_add_savepoint(cast(GdaConnection*)this._cPtr, _name, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Requests that a task be cancelled. This operation may of may not have any effect
      depending on the task's status, even if it returns true. If it returns false,
      then the task has not been cancelled.
  
      Params:
        taskId = a task ID returned by [gda.connection.Connection.asyncStatementExecute]
      Returns: TRUE if no error occurred
      Throws: [ConnectionException]
  */
  bool asyncCancel(uint taskId)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_connection_async_cancel(cast(GdaConnection*)this._cPtr, taskId, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Use this method to obtain the result of the execution of a statement which has been executed asynchronously by
      calling [gda.connection.Connection.asyncStatementExecute]. This function is non locking and will return null (and no
      error will be set) if the statement has not been executed yet.
      
      If the statement has been executed, this method returns the same value as [gda.connection.Connection.statementExecute]
      would have if the statement had been
      executed synchronously.
  
      Params:
        taskId = a task ID returned by [gda.connection.Connection.asyncStatementExecute]
        lastInsertRow = a place to store a new #GdaSet object which contains the values of the last inserted row, or null
      Returns: a #GObject, or null if an error occurred
      Throws: [ConnectionException]
  */
  gobject.object.ObjectWrap asyncFetchResult(uint taskId, out gda.set.Set lastInsertRow)
  {
    GObject* _cretval;
    GdaSet* _lastInsertRow;
    GError *_err;
    _cretval = gda_connection_async_fetch_result(cast(GdaConnection*)this._cPtr, taskId, &_lastInsertRow, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    lastInsertRow = new gda.set.Set(cast(void*)_lastInsertRow, Yes.Take);
    return _retval;
  }

  /**
      Executes all the statements contained in batch (in the order in which they were added to batch), and
      returns a list of #GObject objects, at most one #GObject for each statement; see [gda.connection.Connection.statementExecute]
      for details about the returned objects.
      
      If one of the statement fails, then none of the subsequent statement will be executed, and the method returns
      the list of #GObject created by the correct execution of the previous statements. If a transaction is required,
      then it should be started before calling this method.
  
      Params:
        batch = a #GdaBatch object which contains all the statements to execute
        params = a #GdaSet object (which can be obtained using [gda.batch.Batch.getParameters]), or null
        modelUsage = specifies how the returned data model(s) will be used, as a #GdaStatementModelUsage enum
      Returns: a new list of #GObject objects
      Throws: [ConnectionException]
  */
  gobject.object.ObjectWrap[] batchExecute(gda.batch.Batch batch, gda.set.Set params, gda.types.StatementModelUsage modelUsage)
  {
    GSList* _cretval;
    GError *_err;
    _cretval = gda_connection_batch_execute(cast(GdaConnection*)this._cPtr, batch ? cast(GdaBatch*)batch._cPtr(No.Dup) : null, params ? cast(GdaSet*)params._cPtr(No.Dup) : null, modelUsage, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gSListToD!(gobject.object.ObjectWrap, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Starts a transaction on the data source, identified by the
      name parameter.
      
      Before starting a transaction, you can check whether the underlying
      provider does support transactions or not by using the
      [gda.connection.Connection.supportsFeature] function.
  
      Params:
        name = the name of the transation to start, or null
        level = the requested transaction level (`GDA_TRANSACTION_ISOLATION_UNKNOWN` if not specified)
      Returns: true if the transaction was started successfully, false
        otherwise.
      Throws: [ConnectionException]
  */
  bool beginTransaction(string name, gda.types.TransactionIsolation level)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_connection_begin_transaction(cast(GdaConnection*)this._cPtr, _name, level, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      This function lets you clear the list of #GdaConnectionEvent's of the
      given connection.
  */
  void clearEventsList()
  {
    gda_connection_clear_events_list(cast(GdaConnection*)this._cPtr);
  }

  /**
      Closes the connection to the underlying data source, but first emits the
      "conn-to-close" signal.
  */
  void close()
  {
    gda_connection_close(cast(GdaConnection*)this._cPtr);
  }

  /**
      Closes the connection to the underlying data source, without emiting any warning signal.
  */
  void closeNoWarning()
  {
    gda_connection_close_no_warning(cast(GdaConnection*)this._cPtr);
  }

  /**
      Commits the given transaction to the backend database. You need to call
      [gda.connection.Connection.beginTransaction] first.
  
      Params:
        name = the name of the transation to commit, or null
      Returns: true if the transaction was finished successfully,
        false otherwise.
      Throws: [ConnectionException]
  */
  bool commitTransaction(string name = null)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_connection_commit_transaction(cast(GdaConnection*)this._cPtr, _name, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Creates a new #GdaServerOperation object which can be modified in order
      to perform the type type of action. It is a wrapper around the [gda.server_provider.ServerProvider.createOperation]
      method.
  
      Params:
        type = the type of operation requested
        options = an optional list of parameters
      Returns: a new #GdaServerOperation object, or null in the connection's provider does not support the type type
        of operation or if an error occurred
      Throws: [ConnectionException]
  */
  gda.server_operation.ServerOperation createOperation(gda.types.ServerOperationType type, gda.set.Set options = null)
  {
    GdaServerOperation* _cretval;
    GError *_err;
    _cretval = gda_connection_create_operation(cast(GdaConnection*)this._cPtr, type, options ? cast(GdaSet*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.server_operation.ServerOperation)(cast(GdaServerOperation*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new parser object able to parse the SQL dialect understood by cnc.
      If the #GdaServerProvider object internally used by cnc does not have its own parser,
      then null is returned, and a general SQL parser can be obtained
      using [gda.sql_parser.SqlParser.new_].
      Returns: a new #GdaSqlParser object, or null
  */
  gda.sql_parser.SqlParser createParser()
  {
    GdaSqlParser* _cretval;
    _cretval = gda_connection_create_parser(cast(GdaConnection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.sql_parser.SqlParser)(cast(GdaSqlParser*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes any prepared statement associated to gda_stmt in cnc: this undoes what
      [gda.connection.Connection.addPreparedStatement] does.
  
      Params:
        gdaStmt = a #GdaStatement object
  */
  void delPreparedStatement(gda.statement.Statement gdaStmt)
  {
    gda_connection_del_prepared_statement(cast(GdaConnection*)this._cPtr, gdaStmt ? cast(GdaStatement*)gdaStmt._cPtr(No.Dup) : null);
  }

  /**
      This is a convenience function, which creates a DELETE statement and executes it using the values
      provided. It internally relies on variables which makes it immune to SQL injection problems.
      
      The equivalent SQL command is: DELETE FROM &lt;table&gt; WHERE &lt;condition_column_name&gt; = &lt;condition_value&gt;.
  
      Params:
        table = the table's name with the row's values to be updated
        conditionColumnName = the name of the column to used in the WHERE condition clause
        conditionValue = the condition_column_type's GType
      Returns: TRUE if no error occurred, FALSE otherwise
      Throws: [ConnectionException]
  */
  bool deleteRowFromTable(string table, string conditionColumnName, gobject.value.Value conditionValue)
  {
    bool _retval;
    const(char)* _table = table.toCString(No.Alloc);
    const(char)* _conditionColumnName = conditionColumnName.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_connection_delete_row_from_table(cast(GdaConnection*)this._cPtr, _table, _conditionColumnName, conditionValue ? cast(GValue*)conditionValue._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Delete the SAVEPOINT named name when not used anymore.
  
      Params:
        name = name of the savepoint to delete
      Returns: TRUE if no error occurred
      Throws: [ConnectionException]
  */
  bool deleteSavepoint(string name = null)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_connection_delete_savepoint(cast(GdaConnection*)this._cPtr, _name, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      This is a convenience function to execute a SQL command over the opened connection. For the
      returned value, see [gda.connection.Connection.statementExecuteNonSelect]'s documentation.
  
      Params:
        sql = a query statement that must not begin with "SELECT"
      Returns: the number of rows affected or -1, or -2
      Throws: [ConnectionException]
  */
  int executeNonSelectCommand(string sql)
  {
    int _retval;
    const(char)* _sql = sql.toCString(No.Alloc);
    GError *_err;
    _retval = gda_connection_execute_non_select_command(cast(GdaConnection*)this._cPtr, _sql, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Execute a SQL SELECT command over an opened connection.
  
      Params:
        sql = a query statement that must begin with "SELECT"
      Returns: a new #GdaDataModel if successful, null otherwise
      Throws: [ConnectionException]
  */
  gda.data_model.DataModel executeSelectCommand(string sql)
  {
    GdaDataModel* _cretval;
    const(char)* _sql = sql.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_connection_execute_select_command(cast(GdaConnection*)this._cPtr, _sql, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the user name used to open this connection.
      Returns: the user name.
  */
  string getAuthentication()
  {
    const(char)* _cretval;
    _cretval = gda_connection_get_authentication(cast(GdaConnection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the connection string used to open this connection.
      
      The connection string is the string sent over to the underlying
      database provider, which describes the parameters to be used
      to open a connection on the underlying data source.
      Returns: the connection string used when opening the connection.
  */
  string getCncString()
  {
    const(char)* _cretval;
    _cretval = gda_connection_get_cnc_string(cast(GdaConnection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      This function allows you to determine the actual format for the date values.
  
      Params:
        outFirst = the place to store the first part of the date, or null
        outSecond = the place to store the second part of the date, or null
        outThird = the place to store the third part of the date, or null
        outSep = the place to store the separator (used between year, month and day parts) part of the date, or null
      Returns: true if no error occurred
      Throws: [ConnectionException]
  */
  bool getDateFormat(out glib.types.DateDMY outFirst, out glib.types.DateDMY outSecond, out glib.types.DateDMY outThird, out char outSep)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_connection_get_date_format(cast(GdaConnection*)this._cPtr, &outFirst, &outSecond, &outThird, cast(char*)&outSep, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /** */
  string getDsn()
  {
    const(char)* _cretval;
    _cretval = gda_connection_get_dsn(cast(GdaConnection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves a list of the last errors occurred during the connection. The returned list is
      chronologically ordered such as that the most recent event is the #GdaConnectionEvent of the first node.
      
      Warning: the cnc object may change the list if connection events occur
      Returns: a #GList of #GdaConnectionEvent objects (the list should not be modified)
  */
  gda.connection_event.ConnectionEvent[] getEvents()
  {
    const(GList)* _cretval;
    _cretval = gda_connection_get_events(cast(GdaConnection*)this._cPtr);
    auto _retval = gListToD!(gda.connection_event.ConnectionEvent, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get or initializes the #GdaMetaStore associated to cnc
      Returns: a #GdaMetaStore object
  */
  gda.meta_store.MetaStore getMetaStore()
  {
    GdaMetaStore* _cretval;
    _cretval = gda_connection_get_meta_store(cast(GdaConnection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.meta_store.MetaStore)(cast(GdaMetaStore*)_cretval, No.Take);
    return _retval;
  }

  /**
      see #gda_connection_get_meta_store_data
  
      Params:
        metaType = describes which data to get.
        filters = a #GList of #GdaHolder objects
      Returns: a #GdaDataModel containing the data required. The caller is responsible
        for freeing the returned model using [gobject.object.ObjectWrap.unref].
      Throws: [ConnectionException]
  */
  gda.data_model.DataModel getMetaStoreDataV(gda.types.ConnectionMetaType metaType, gda.holder.Holder[] filters)
  {
    GdaDataModel* _cretval;
    auto _filters = gListFromD!(gda.holder.Holder)(filters);
    scope(exit) containerFree!(GList*, gda.holder.Holder, GidOwnership.None)(_filters);
    GError *_err;
    _cretval = gda_connection_get_meta_store_data_v(cast(GdaConnection*)this._cPtr, metaType, _filters, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the #GdaConnectionOptions used to open this connection.
      Returns: the connection options.
  */
  gda.types.ConnectionOptions getOptions()
  {
    GdaConnectionOptions _cretval;
    _cretval = gda_connection_get_options(cast(GdaConnection*)this._cPtr);
    gda.types.ConnectionOptions _retval = cast(gda.types.ConnectionOptions)_cretval;
    return _retval;
  }

  /**
      Retrieves a pointer to an object representing a prepared statement for gda_stmt within cnc. The
      association must have been done using [gda.connection.Connection.addPreparedStatement].
  
      Params:
        gdaStmt = a #GdaStatement object
      Returns: the prepared statement, or null if no association exists
  */
  gda.pstmt.PStmt getPreparedStatement(gda.statement.Statement gdaStmt)
  {
    GdaPStmt* _cretval;
    _cretval = gda_connection_get_prepared_statement(cast(GdaConnection*)this._cPtr, gdaStmt ? cast(GdaStatement*)gdaStmt._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.pstmt.PStmt)(cast(GdaPStmt*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a pointer to the #GdaServerProvider object used to access the database
      Returns: the #GdaServerProvider (NEVER NULL)
  */
  gda.server_provider.ServerProvider getProvider()
  {
    GdaServerProvider* _cretval;
    _cretval = gda_connection_get_provider(cast(GdaConnection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.server_provider.ServerProvider)(cast(GdaServerProvider*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name (identifier) of the database provider used by cnc
      Returns: a non modifiable string
  */
  string getProviderName()
  {
    const(char)* _cretval;
    _cretval = gda_connection_get_provider_name(cast(GdaConnection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the status of cnc regarding transactions. The returned object should not be modified
      or destroyed; however it may be modified or destroyed by the connection itself.
      
      If null is returned, then no transaction has been associated with cnc
      Returns: a #GdaTransactionStatus object, or null
  */
  gda.transaction_status.TransactionStatus getTransactionStatus()
  {
    GdaTransactionStatus* _cretval;
    _cretval = gda_connection_get_transaction_status(cast(GdaConnection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.transaction_status.TransactionStatus)(cast(GdaTransactionStatus*)_cretval, No.Take);
    return _retval;
  }

  /**
      col_names and values must have length (&gt;= 1).
      
      This is a convenience function, which creates an INSERT statement and executes it using the values
      provided. It internally relies on variables which makes it immune to SQL injection problems.
      
      The equivalent SQL command is: INSERT INTO &lt;table&gt; (&lt;column_name&gt; [,...]) VALUES (&lt;column_name&gt; = &lt;new_value&gt; [,...]).
  
      Params:
        table = table's name to insert into
        colNames = a list of column names (as const gchar *)
        values = a list of values (as #GValue)
      Returns: TRUE if no error occurred, FALSE otherwise
      Throws: [ConnectionException]
  */
  bool insertRowIntoTableV(string table, string[] colNames, gobject.value.Value[] values)
  {
    bool _retval;
    const(char)* _table = table.toCString(No.Alloc);
    auto _colNames = gSListFromD!(string)(colNames);
    scope(exit) containerFree!(GSList*, string, GidOwnership.None)(_colNames);
    auto _values = gSListFromD!(gobject.value.Value)(values);
    scope(exit) containerFree!(GSList*, gobject.value.Value, GidOwnership.None)(_values);
    GError *_err;
    _retval = cast(bool)gda_connection_insert_row_into_table_v(cast(GdaConnection*)this._cPtr, _table, _colNames, _values, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Checks whether a connection is open or not.
      Returns: true if the connection is open, false if it's not.
  */
  bool isOpened()
  {
    bool _retval;
    _retval = cast(bool)gda_connection_is_opened(cast(GdaConnection*)this._cPtr);
    return _retval;
  }

  /**
      Tries to open the connection.
      Returns: TRUE if the connection is opened, and FALSE otherwise.
      Throws: [ConnectionException]
  */
  bool open()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_connection_open(cast(GdaConnection*)this._cPtr, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      This function helps to parse a SQL string which uses parameters and store them at params.
  
      Params:
        sql = an SQL command to parse, not null
        params = a place to store a new #GdaSet, for parameters used in SQL command, or null
      Returns: a #GdaStatement representing the SQL command, or null if an error occurred
      Throws: [ConnectionException]
  */
  gda.statement.Statement parseSqlString(string sql, out gda.set.Set params)
  {
    GdaStatement* _cretval;
    const(char)* _sql = sql.toCString(No.Alloc);
    GdaSet* _params;
    GError *_err;
    _cretval = gda_connection_parse_sql_string(cast(GdaConnection*)this._cPtr, _sql, &_params, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.statement.Statement)(cast(GdaStatement*)_cretval, Yes.Take);
    params = new gda.set.Set(cast(void*)_params, Yes.Take);
    return _retval;
  }

  /**
      Performs the operation described by op (which should have been created using
      [gda.connection.Connection.createOperation]). It is a wrapper around the [gda.server_provider.ServerProvider.performOperation]
      method.
  
      Params:
        op = a #GdaServerOperation object
      Returns: TRUE if no error occurred
      Throws: [ConnectionException]
  */
  bool performOperation(gda.server_operation.ServerOperation op)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_connection_perform_operation(cast(GdaConnection*)this._cPtr, op ? cast(GdaServerOperation*)op._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Use this method to get a pointer to the next available connection event which can then be customized
      and taken into account using [gda.connection.Connection.addEvent].
  
      Params:
        type = a #GdaConnectionEventType
      Returns: a pointer to the next available connection event, or null if event should
        be ignored
  */
  gda.connection_event.ConnectionEvent pointAvailableEvent(gda.types.ConnectionEventType type)
  {
    GdaConnectionEvent* _cretval;
    _cretval = gda_connection_point_available_event(cast(GdaConnection*)this._cPtr, type);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.connection_event.ConnectionEvent)(cast(GdaConnectionEvent*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Use this method to get a correctly quoted (if necessary) SQL identifier which can be used
      in SQL statements, from id. If id is already correctly quoted for cnc, then a copy of id
      may be returned.
      
      This method may add double quotes (or other characters) around id:
      <itemizedlist>
       <listitem><para>if id is a reserved SQL keyword (such as SELECT, INSERT, ...)</para></listitem>
       <listitem><para>if id contains non allowed characters such as spaces, or if it starts with a digit</para></listitem>
       <listitem><para>in any other event as necessary for cnc, depending on the the options passed when opening the cnc
                 connection, and specifically the <link linkend="GDA-CONNECTION-OPTIONS-SQL-IDENTIFIERS-CASE-SENSITIVE:CAPS">
                 GDA_CONNECTION_OPTIONS_SQL_IDENTIFIERS_CASE_SENSITIVE</link> option.</para></listitem>
      </itemizedlist>
      
      One can safely pass an already quoted id to this method, either with quoting characters allowed by cnc or using the
      double quote (") character.
  
      Params:
        id = an SQL identifier
      Returns: a new string, to free with [glib.global.gfree] once not needed anymore
  */
  string quoteSqlIdentifier(string id)
  {
    char* _cretval;
    const(char)* _id = id.toCString(No.Alloc);
    _cretval = gda_connection_quote_sql_identifier(cast(GdaConnection*)this._cPtr, _id);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Rollback all the modifications made after the SAVEPOINT named name.
  
      Params:
        name = name of the savepoint to rollback to
      Returns: TRUE if no error occurred
      Throws: [ConnectionException]
  */
  bool rollbackSavepoint(string name = null)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_connection_rollback_savepoint(cast(GdaConnection*)this._cPtr, _name, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Rollbacks the given transaction. This means that all changes
      made to the underlying data source since the last call to
      #[gda.connection.Connection.beginTransaction] or #[gda.connection.Connection.commitTransaction]
      will be discarded.
  
      Params:
        name = the name of the transation to commit, or null
      Returns: true if the operation was successful, false otherwise.
      Throws: [ConnectionException]
  */
  bool rollbackTransaction(string name = null)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_connection_rollback_transaction(cast(GdaConnection*)this._cPtr, _name, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Executes stmt.
      
      As stmt can, by design (and if not abused), contain only one SQL statement, the
      return object will either be:
      <itemizedlist>
        <listitem><para>a #GdaDataSelect object (which is also a #GdaDataModel) if stmt is a SELECT statement
                  (usually a GDA_SQL_STATEMENT_SELECT, see #GdaSqlStatementType)
                  containing the results of the SELECT. The resulting data model is by default read only, but
                  modifications can be enabled, see the #GdaDataSelect's documentation for more information.</para></listitem>
        <listitem><para>a #GdaSet for any other SQL statement which correctly executed. In this case
             (if the provider supports it), then the #GdaSet may contain value holders named:
             <itemizedlist>
               <listitem><para>a (gint) #GdaHolder named "IMPACTED_ROWS"</para></listitem>
               <listitem><para>a (GObject) #GdaHolder named "EVENT" which contains a #GdaConnectionEvent</para></listitem>
             </itemizedlist></para></listitem>
      </itemizedlist>
      
      If last_insert_row is not null and stmt is an INSERT statement, then it will contain (if the
      provider used by cnc supports it) a new #GdaSet object composed of value holders named "+&lt;column number&gt;"
      starting at column 0 which contain the actual inserted values. For example if a table is composed of an 'id' column
      which is auto incremented and a 'name' column then the execution of a "INSERT INTO mytable (name) VALUES ('joe')"
      query will return a #GdaSet with two holders:
      <itemizedlist>
        <listitem><para>one with the '+0' ID which may for example contain 1 (note that its "name" property should be "id")</para></listitem>
        <listitem><para>one with the '+1' ID which will contain 'joe' (note that its "name" property should be "name")</para></listitem>
      </itemizedlist>
      
      This method may fail with a `GDA_SERVER_PROVIDER_ERROR` domain error (see the #GdaServerProviderError error codes).
      
      Note1: If stmt is a SELECT statement which has some parameters and  if params is null, then the statement can't
      be executed and this method will return null.
      
      Note2: If stmt is a SELECT statement which has some parameters and  if params is not null but contains some
      invalid parameters, then the statement can't be executed and this method will return null, unless the
      model_usage has the GDA_STATEMENT_MODEL_ALLOW_NOPARAM flag.
      
      Note3: If stmt is a SELECT statement which has some parameters and  if params is not null but contains some
      invalid parameters and if model_usage has the GDA_STATEMENT_MODEL_ALLOW_NOPARAM flag, then the returned
      data model will contain no row but will have all the correct columns (even though some of the columns might
      report as GDA_TYPE_NULL). In this case, if (after this method call) any of params' parameters change
      then the resulting data model will re-run itself, see the GdaDataSelect's
      <link linkend="GdaDataSelect--auto-reset">auto-reset</link> property for more information.
      
      Note4: if model_usage does not contain the GDA_STATEMENT_MODEL_RANDOM_ACCESS or
      GDA_STATEMENT_MODEL_CURSOR_FORWARD flags, then the default will be to return a random access data model
      
      Note5: If stmt is a SELECT statement which returns blob values (of type `GDA_TYPE_BLOB`), then an implicit
      transaction will have been started by the database provider, and it's up to the caller to close the transaction
      (which will then be locked) once all the blob ressources have been
      liberated (when the returned data model is destroyed). See the section about
      <link linkend="gen:blobs">Binary large objects (BLOBs)</link> for more information.
      
      Also see the <link linkend="limitations">provider's limitations</link>, and the
      <link linkend="data-select">Advanced GdaDataSelect usage</link> sections.
  
      Params:
        stmt = a #GdaStatement object
        params = a #GdaSet object (which can be obtained using [gda.statement.Statement.getParameters]), or null
        modelUsage = in the case where stmt is a SELECT statement, specifies how the returned data model will be used
        lastInsertRow = a place to store a new #GdaSet object which contains the values of the last inserted row, or null
      Returns: a #GObject, or null if an error occurred
      Throws: [ConnectionException]
  */
  gobject.object.ObjectWrap statementExecute(gda.statement.Statement stmt, gda.set.Set params, gda.types.StatementModelUsage modelUsage, out gda.set.Set lastInsertRow)
  {
    GObject* _cretval;
    GdaSet* _lastInsertRow;
    GError *_err;
    _cretval = gda_connection_statement_execute(cast(GdaConnection*)this._cPtr, stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null, params ? cast(GdaSet*)params._cPtr(No.Dup) : null, modelUsage, &_lastInsertRow, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    lastInsertRow = new gda.set.Set(cast(void*)_lastInsertRow, Yes.Take);
    return _retval;
  }

  /**
      Executes a non-selection statement on the given connection.
      
      This function returns the number of rows affected by the execution of stmt, or -1
      if an error occurred, or -2 if the connection's provider does not return the number of rows affected.
      
      This function is just a convenience function around the [gda.connection.Connection.statementExecute]
      function.
      See the documentation of the [gda.connection.Connection.statementExecute] for information
      about the params list of parameters.
      
      See [gda.connection.Connection.statementExecute] form more information about last_insert_row.
  
      Params:
        stmt = a #GdaStatement object.
        params = a #GdaSet object (which can be obtained using [gda.statement.Statement.getParameters]), or null
        lastInsertRow = a place to store a new #GdaSet object which contains the values of the last inserted row, or null
      Returns: the number of rows affected (&gt;=0) or -1 or -2
      Throws: [ConnectionException]
  */
  int statementExecuteNonSelect(gda.statement.Statement stmt, gda.set.Set params, out gda.set.Set lastInsertRow)
  {
    int _retval;
    GdaSet* _lastInsertRow;
    GError *_err;
    _retval = gda_connection_statement_execute_non_select(cast(GdaConnection*)this._cPtr, stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null, params ? cast(GdaSet*)params._cPtr(No.Dup) : null, &_lastInsertRow, &_err);
    if (_err)
      throw new ConnectionException(_err);
    lastInsertRow = new gda.set.Set(cast(void*)_lastInsertRow, Yes.Take);
    return _retval;
  }

  /**
      Executes a selection command on the given connection.
      
      This function returns a #GdaDataModel resulting from the SELECT statement, or null
      if an error occurred.
      
      This function is just a convenience function around the [gda.connection.Connection.statementExecute]
      function.
      
      See the documentation of the [gda.connection.Connection.statementExecute] for information
      about the params list of parameters.
  
      Params:
        stmt = a #GdaStatement object.
        params = a #GdaSet object (which can be obtained using [gda.statement.Statement.getParameters]), or null
      Returns: a #GdaDataModel containing the data returned by the
        data source, or null if an error occurred
      Throws: [ConnectionException]
  */
  gda.data_model.DataModel statementExecuteSelect(gda.statement.Statement stmt, gda.set.Set params = null)
  {
    GdaDataModel* _cretval;
    GError *_err;
    _cretval = gda_connection_statement_execute_select(cast(GdaConnection*)this._cPtr, stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null, params ? cast(GdaSet*)params._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ConnectionException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Ask the database accessed through the cnc connection to prepare the usage of stmt. This is only useful
      if stmt will be used more than once (however some database providers may always prepare statements
      before executing them).
      
      This function is also useful to make sure stmt is fully understood by the database before actually executing it.
      
      Note however that it is also possible that [gda.connection.Connection.statementPrepare] fails when
      [gda.connection.Connection.statementExecute] does not fail (this will usually be the case with statements such as
      <![CDATA["SELECT * FROM ##tablename::string"]]> because database usually don't allow variables to be used in place of a
      table name).
  
      Params:
        stmt = a #GdaStatement object
      Returns: TRUE if no error occurred.
      Throws: [ConnectionException]
  */
  bool statementPrepare(gda.statement.Statement stmt)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_connection_statement_prepare(cast(GdaConnection*)this._cPtr, stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Renders stmt as an SQL statement, adapted to the SQL dialect used by cnc
  
      Params:
        stmt = a #GdaStatement object
        params = a #GdaSet object (which can be obtained using [gda.statement.Statement.getParameters]), or null
        flags = SQL rendering flags, as #GdaStatementSqlFlag OR'ed values
        paramsUsed = a place to store the list of individual #GdaHolder objects within params which have been used
      Returns: a new string, or null if an error occurred
      Throws: [ConnectionException]
  */
  string statementToSql(gda.statement.Statement stmt, gda.set.Set params, gda.types.StatementSqlFlag flags, out gda.holder.Holder[] paramsUsed)
  {
    char* _cretval;
    GSList* _paramsUsed;
    GError *_err;
    _cretval = gda_connection_statement_to_sql(cast(GdaConnection*)this._cPtr, stmt ? cast(GdaStatement*)stmt._cPtr(No.Dup) : null, params ? cast(GdaSet*)params._cPtr(No.Dup) : null, flags, &_paramsUsed, &_err);
    if (_err)
      throw new ConnectionException(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    paramsUsed = gSListToD!(gda.holder.Holder, GidOwnership.Container)(_paramsUsed);
    return _retval;
  }

  /**
      Asks the underlying provider for if a specific feature is supported.
  
      Params:
        feature = feature to ask for.
      Returns: true if the provider supports it, false if not.
  */
  bool supportsFeature(gda.types.ConnectionFeature feature)
  {
    bool _retval;
    _retval = cast(bool)gda_connection_supports_feature(cast(GdaConnection*)this._cPtr, feature);
    return _retval;
  }

  /**
      Updates cnc's associated #GdaMetaStore. If context is not null, then only the parts described by
      context will be updated, and if it is null, then the complete meta store will be updated. Detailed
      explanations follow:
      
      In order to keep the meta store's contents in a consistent state, the update process involves updating
      the contents of all the tables related to one where the contents change. For example the "_columns"
      table (which lists all the columns of a table) depends on the "_tables" table (which lists all the tables
      in a schema), so if a row is added, removed or modified in the "_tables", then the "_columns" table's contents
      needs to be updated as well regarding that row.
      
      If context is null, then the update process will simply overwrite any data that was present in all the
      meta store's tables with new (up to date) data even if nothing has changed, without having to build the
      tables' dependency tree. This is the recommended way of proceeding when dealing with a meta store which
      might be outdated.
      
      On the other hand, if context is not null, then a tree of the dependencies has to be built (depending on
      context) and only some parts of the meta store are updated following that dependencies tree. Specifying a
      context may be useful for example in the following situations:
      <itemizedlist>
        <listitem><para>One knows that a database object has changed (for example a table created), and
                        may use the context to request that only the information about that table be updated
                  </para></listitem>
        <listitem><para>One is only interested in the list of views, and may request that only the information
                        about views may be updated</para></listitem>
      </itemizedlist>
      
      When context is not null, and contains specified SQL identifiers (for example the "table_name" of the "_tables"
      table), then each SQL identifier has to match the convention the #GdaMetaStore has adopted regarding
      case sensitivity, using [gda.connection.Connection.quoteSqlIdentifier] or [gda.meta_store.MetaStore.sqlIdentifierQuote].
      
      see the <link linkend="information_schema:sql_identifiers">
      meta data section about SQL identifiers</link> for more information, and the documentation about the
      [gda.global.sqlIdentifierQuote] function which will be most useful.
      
      Note however that usually <emphasis>more</emphasis> information will be updated than strictly requested by
      the context argument.
      
      For more information, see the <link linkend="information_schema">Database structure</link> section, and
      the <link linkend="howto-meta2">Update the meta data about a table</link> howto.
  
      Params:
        context = description of which part of cnc's associated #GdaMetaStore should be updated, or null
      Returns: TRUE if no error occurred
      Throws: [ConnectionException]
  */
  bool updateMetaStore(gda.meta_context.MetaContext context = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_connection_update_meta_store(cast(GdaConnection*)this._cPtr, context ? cast(GdaMetaContext*)context._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      col_names and values must have length (&gt;= 1).
      
      This is a convenience function, which creates an UPDATE statement and executes it using the values
      provided. It internally relies on variables which makes it immune to SQL injection problems.
      
      The equivalent SQL command is: UPDATE &lt;table&gt; SET &lt;column_name&gt; = &lt;new_value&gt; [,...] WHERE &lt;condition_column_name&gt; = &lt;condition_value&gt;.
  
      Params:
        table = the table's name with the row's values to be updated
        conditionColumnName = the name of the column to used in the WHERE condition clause
        conditionValue = the condition_column_type's GType
        colNames = a list of column names (as const gchar *)
        values = a list of values (as #GValue)
      Returns: TRUE if no error occurred, FALSE otherwise
      Throws: [ConnectionException]
  */
  bool updateRowInTableV(string table, string conditionColumnName, gobject.value.Value conditionValue, string[] colNames, gobject.value.Value[] values)
  {
    bool _retval;
    const(char)* _table = table.toCString(No.Alloc);
    const(char)* _conditionColumnName = conditionColumnName.toCString(No.Alloc);
    auto _colNames = gSListFromD!(string)(colNames);
    scope(exit) containerFree!(GSList*, string, GidOwnership.None)(_colNames);
    auto _values = gSListFromD!(gobject.value.Value)(values);
    scope(exit) containerFree!(GSList*, gobject.value.Value, GidOwnership.None)(_values);
    GError *_err;
    _retval = cast(bool)gda_connection_update_row_in_table_v(cast(GdaConnection*)this._cPtr, _table, _conditionColumnName, conditionValue ? cast(GValue*)conditionValue._cPtr(No.Dup) : null, _colNames, _values, &_err);
    if (_err)
      throw new ConnectionException(_err);
    return _retval;
  }

  /**
      Produces a fully quoted and escaped string from a GValue
  
      Params:
        from = #GValue to convert from
      Returns: escaped and quoted value or NULL if not supported.
  */
  string valueToSqlString(gobject.value.Value from)
  {
    char* _cretval;
    _cretval = gda_connection_value_to_sql_string(cast(GdaConnection*)this._cPtr, from ? cast(GValue*)from._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Connect to `ConnClosed` signal.
  
      Gets emitted when the connection to the database has been closed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.connection.Connection connection))
  
          `connection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectConnClosed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.connection.Connection)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("conn-closed", closure, after);
  }

  /**
      Connect to `ConnOpened` signal.
  
      Gets emitted when the connection has been opened to the database
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.connection.Connection connection))
  
          `connection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectConnOpened(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.connection.Connection)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("conn-opened", closure, after);
  }

  /**
      Connect to `ConnToClose` signal.
  
      Gets emitted when the connection to the database is about to be closed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.connection.Connection connection))
  
          `connection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectConnToClose(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.connection.Connection)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("conn-to-close", closure, after);
  }

  /**
      Connect to `DsnChanged` signal.
  
      Gets emitted when the DSN used by cnc has been changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.connection.Connection connection))
  
          `connection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDsnChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.connection.Connection)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("dsn-changed", closure, after);
  }

  /**
      Connect to `Error` signal.
  
      Gets emitted whenever a connection event occurs. Check the nature of event to
        see if it's an error or a simple notification
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.connection_event.ConnectionEvent event, gda.connection.Connection connection))
  
          `event` a #GdaConnectionEvent object (optional)
  
          `connection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectError(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.connection_event.ConnectionEvent)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.connection.Connection)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("error", closure, after);
  }

  /**
      Connect to `TransactionStatusChanged` signal.
  
      Gets emitted when the transaction status of cnc has changed (a transaction has been
        started, rolled back, a savepoint added,...)
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gda.connection.Connection connection))
  
          `connection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectTransactionStatusChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gda.connection.Connection)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("transaction-status-changed", closure, after);
  }
}

class ConnectionException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.connection.Connection.errorQuark, cast(int)code, msg);
  }

  alias Code = ConnectionError;
}
