/// Module for [Config] class
module gda.config;

import gda.c.functions;
import gda.c.types;
import gda.data_model;
import gda.dsn_info;
import gda.provider_info;
import gda.server_provider;
import gda.types;
import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;

/** */
class Config : gobject.object.ObjectWrap
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
    return cast(void function())gda_config_get_type != &gidSymbolNotFound ? gda_config_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Config self()
  {
    return this;
  }

  /**
      Get `systemFilename` property.
      Returns: File to use for system-wide DSN list. When changed, the whole list of DSN will be reloaded.
  */
  @property string systemFilename()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("system-filename");
  }

  /**
      Set `systemFilename` property.
      Params:
        propval = File to use for system-wide DSN list. When changed, the whole list of DSN will be reloaded.
  */
  @property void systemFilename(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("system-filename", propval);
  }

  /**
      Get `userFilename` property.
      Returns: File to use for per-user DSN list. When changed, the whole list of DSN will be reloaded.
  */
  @property string userFilename()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("user-filename");
  }

  /**
      Set `userFilename` property.
      Params:
        propval = File to use for per-user DSN list. When changed, the whole list of DSN will be reloaded.
  */
  @property void userFilename(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("user-filename", propval);
  }

  /**
      Tells if the global (system) configuration can be modified (considering
      system permissions and settings)
      Returns: TRUE if system-wide configuration can be modified
  */
  static bool canModifySystemConfig()
  {
    bool _retval;
    _retval = cast(bool)gda_config_can_modify_system_config();
    return _retval;
  }

  /**
      Add or update a DSN from the definition in info.
      
      This method may fail with a `GDA_CONFIG_ERROR` domain error (see the #GdaConfigError error codes).
  
      Params:
        info = a pointer to a filled GdaDsnInfo structure
      Returns: TRUE if no error occurred
      Throws: [ConfigException]
  */
  static bool defineDsn(gda.dsn_info.DsnInfo info)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gda_config_define_dsn(info ? cast(const(GdaDsnInfo)*)info._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ConfigException(_err);
    return _retval;
  }

  /**
      Tells if the data source identified as dsn_name needs any authentication. If a &lt;username&gt;
      and optionally a &lt;password&gt; are specified, they are ignored.
  
      Params:
        dsnName = the name of a DSN, in the "[&lt;username&gt;[:&lt;password&gt;]@]&lt;DSN&gt;" format
      Returns: TRUE if an authentication is needed
  */
  static bool dsnNeedsAuthentication(string dsnName)
  {
    bool _retval;
    const(char)* _dsnName = dsnName.toCString(No.Alloc);
    _retval = cast(bool)gda_config_dsn_needs_authentication(_dsnName);
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_config_error_quark();
    return _retval;
  }

  /**
      Get a pointer to the global (unique) #GdaConfig object. This functions increments
      the reference count of the object, so you need to call [gobject.object.ObjectWrap.unref] on it once finished.
      Returns: a non null pointer to the unique #GdaConfig
  */
  static gda.config.Config get()
  {
    GdaConfig* _cretval;
    _cretval = gda_config_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.config.Config)(cast(GdaConfig*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get information about the DSN named dsn_name.
      
      dsn_name's format is "[&lt;username&gt;[:&lt;password&gt;]@]&lt;DSN&gt;" (if &lt;username&gt;
      and optionally &lt;password&gt; are provided, they are ignored). Also see the [gda.global.dsnSplit] utility
      function.
  
      Params:
        dsnName = the name of the DSN to look for
      Returns: a pointer to read-only #GdaDsnInfo structure, or null if not found
  */
  static gda.dsn_info.DsnInfo getDsnInfo(string dsnName)
  {
    GdaDsnInfo* _cretval;
    const(char)* _dsnName = dsnName.toCString(No.Alloc);
    _cretval = gda_config_get_dsn_info(_dsnName);
    auto _retval = _cretval ? new gda.dsn_info.DsnInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get a pointer to a read-only #GdaDsnInfo at the index position
  
      Params:
        index = an index
      Returns: the pointer or null if no DSN exists at position index
  */
  static gda.dsn_info.DsnInfo getDsnInfoAtIndex(int index)
  {
    GdaDsnInfo* _cretval;
    _cretval = gda_config_get_dsn_info_at_index(index);
    auto _retval = _cretval ? new gda.dsn_info.DsnInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the index (starting at 0) of the DSN named dsn_name
  
      Params:
        dsnName = a DSN
      Returns: the index or -1 if not found
  */
  static int getDsnInfoIndex(string dsnName)
  {
    int _retval;
    const(char)* _dsnName = dsnName.toCString(No.Alloc);
    _retval = gda_config_get_dsn_info_index(_dsnName);
    return _retval;
  }

  /**
      Get the number of defined DSN
      Returns: the number of defined DSN
  */
  static int getNbDsn()
  {
    int _retval;
    _retval = gda_config_get_nb_dsn();
    return _retval;
  }

  /**
      Get a pointer to the session-wide #GdaServerProvider for the
      provider named provider_name. The caller must not call [gobject.object.ObjectWrap.unref] on the
      returned object.
      
      This method may fail with a `GDA_CONFIG_ERROR` domain error (see the #GdaConfigError error codes).
  
      Params:
        providerName = a database provider
      Returns: a pointer to the #GdaServerProvider, or null if an error occurred
      Throws: [ConfigException]
  */
  static gda.server_provider.ServerProvider getProvider(string providerName)
  {
    GdaServerProvider* _cretval;
    const(char)* _providerName = providerName.toCString(No.Alloc);
    GError *_err;
    _cretval = gda_config_get_provider(_providerName, &_err);
    if (_err)
      throw new ConfigException(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.server_provider.ServerProvider)(cast(GdaServerProvider*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get some information about the a database provider (adapter) named
  
      Params:
        providerName = a database provider
      Returns: a pointer to read-only #GdaProviderInfo structure, or null if not found
  */
  static gda.provider_info.ProviderInfo getProviderInfo(string providerName)
  {
    GdaProviderInfo* _cretval;
    const(char)* _providerName = providerName.toCString(No.Alloc);
    _cretval = gda_config_get_provider_info(_providerName);
    auto _retval = _cretval ? new gda.provider_info.ProviderInfo(cast(GdaProviderInfo*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get a #GdaDataModel representing all the configured DSN, and keeping itself up to date with
      the changes in the declared DSN.
      
      The returned data model is composed of the following columns:
      <itemizedlist>
       <listitem><para>DSN name</para></listitem>
       <listitem><para>Provider name</para></listitem>
       <listitem><para>Description</para></listitem>
       <listitem><para>Connection string</para></listitem>
       <listitem><para>Username if it exists</para></listitem>
      </itemizedlist>
      Returns: a new #GdaDataModel
  */
  static gda.data_model.DataModel listDsn()
  {
    GdaDataModel* _cretval;
    _cretval = gda_config_list_dsn();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a #GdaDataModel representing all the installed database providers.
      
      The returned data model is composed of the following columns:
      <itemizedlist>
       <listitem><para>Provider name</para></listitem>
       <listitem><para>Description</para></listitem>
       <listitem><para>DSN parameters</para></listitem>
       <listitem><para>Authentication parameters</para></listitem>
       <listitem><para>File name of the plugin</para></listitem>
      </itemizedlist>
      Returns: a new #GdaDataModel
  */
  static gda.data_model.DataModel listProviders()
  {
    GdaDataModel* _cretval;
    _cretval = gda_config_list_providers();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gda.data_model.DataModel)(cast(GdaDataModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Remove the DSN named dsn_name.
      
      This method may fail with a `GDA_CONFIG_ERROR` domain error (see the #GdaConfigError error codes).
  
      Params:
        dsnName = the name of the DSN to remove
      Returns: TRUE if no error occurred
      Throws: [ConfigException]
  */
  static bool removeDsn(string dsnName)
  {
    bool _retval;
    const(char)* _dsnName = dsnName.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gda_config_remove_dsn(_dsnName, &_err);
    if (_err)
      throw new ConfigException(_err);
    return _retval;
  }

  /**
      Connect to `DsnAdded` signal.
  
      Gets emitted whenever a new DSN has been defined
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(void* newDsn, gda.config.Config config))
  
          `newDsn` a #GdaDsnInfo (optional)
  
          `config` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDsnAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.config.Config)))
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
    return connectSignalClosure("dsn-added", closure, after);
  }

  /**
      Connect to `DsnChanged` signal.
  
      Gets emitted whenever a DSN's definition has been changed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(void* dsn, gda.config.Config config))
  
          `dsn` a #GdaDsnInfo (optional)
  
          `config` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDsnChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.config.Config)))
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
    return connectSignalClosure("dsn-changed", closure, after);
  }

  /**
      Connect to `DsnRemoved` signal.
  
      Gets emitted whenever a DSN has been removed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(void* oldDsn, gda.config.Config config))
  
          `oldDsn` a #GdaDsnInfo (optional)
  
          `config` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDsnRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.config.Config)))
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
    return connectSignalClosure("dsn-removed", closure, after);
  }

  /**
      Connect to `DsnToBeRemoved` signal.
  
      Gets emitted whenever a DSN is about to be removed
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(void* oldDsn, gda.config.Config config))
  
          `oldDsn` a #GdaDsnInfo (optional)
  
          `config` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDsnToBeRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gda.config.Config)))
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
    return connectSignalClosure("dsn-to-be-removed", closure, after);
  }
}

class ConfigException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.config.Config.errorQuark, cast(int)code, msg);
  }

  alias Code = ConfigError;
}
