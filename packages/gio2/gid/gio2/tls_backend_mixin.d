/// Module for [TlsBackend] interface mixin
module gid.gio2.tls_backend_mixin;

public import gid.core.basictypes;
public import gid.gio2.tls_backend_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.tls_database;
public import gid.gio2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.types;

/**
    TLS (Transport Layer Security, aka SSL) and DTLS backend. This is an
    internal type used to coordinate the different classes implemented
    by a TLS backend.
*/
template TlsBackendT()
{


  /**
      Gets the default #GTlsDatabase used to verify TLS connections.
      Returns: the default database, which should be
                      unreffed when done.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDefaultDatabase`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.tls_database.TlsDatabase vfuncGetDefaultDatabase()
  {
    auto _klass = cast(GTlsBackendInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.tls_backend.TlsBackend._getGType);
    if (!_klass || !_klass.getDefaultDatabase)
      return typeof(return).init;

    GTlsDatabase* _cretval;
    _cretval = _klass.getDefaultDatabase(cast(GTlsBackend*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_database.TlsDatabase)(cast(GTlsDatabase*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if DTLS is supported. DTLS support may not be available even if TLS
      support is available, and vice-versa.
      Returns: whether DTLS is supported
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSupportsDtls`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSupportsDtls()
  {
    auto _klass = cast(GTlsBackendInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.tls_backend.TlsBackend._getGType);
    if (!_klass || !_klass.supportsDtls)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.supportsDtls(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Checks if TLS is supported; if this returns false for the default
      #GTlsBackend, it means no "real" TLS backend is available.
      Returns: whether or not TLS is supported
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSupportsTls`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSupportsTls()
  {
    auto _klass = cast(GTlsBackendInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.tls_backend.TlsBackend._getGType);
    if (!_klass || !_klass.supportsTls)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.supportsTls(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GType of backend's #GTlsCertificate implementation.
      Returns: the #GType of backend's #GTlsCertificate
          implementation.
  */
  override gid.gobject2.types.GType getCertificateType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = g_tls_backend_get_certificate_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GType of backend's #GTlsClientConnection implementation.
      Returns: the #GType of backend's #GTlsClientConnection
          implementation.
  */
  override gid.gobject2.types.GType getClientConnectionType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = g_tls_backend_get_client_connection_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default #GTlsDatabase used to verify TLS connections.
      Returns: the default database, which should be
                      unreffed when done.
  */
  override gid.gio2.tls_database.TlsDatabase getDefaultDatabase() nothrow
  {
    GTlsDatabase* _cretval;
    _cretval = g_tls_backend_get_default_database(cast(GTlsBackend*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_database.TlsDatabase)(cast(GTlsDatabase*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the #GType of backend’s #GDtlsClientConnection implementation.
      Returns: the #GType of backend’s #GDtlsClientConnection
          implementation, or `G_TYPE_INVALID` if this backend doesn’t support DTLS.
  */
  override gid.gobject2.types.GType getDtlsClientConnectionType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = g_tls_backend_get_dtls_client_connection_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GType of backend’s #GDtlsServerConnection implementation.
      Returns: the #GType of backend’s #GDtlsServerConnection
          implementation, or `G_TYPE_INVALID` if this backend doesn’t support DTLS.
  */
  override gid.gobject2.types.GType getDtlsServerConnectionType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = g_tls_backend_get_dtls_server_connection_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GType of backend's #GTlsFileDatabase implementation.
      Returns: the #GType of backend's #GTlsFileDatabase implementation.
  */
  override gid.gobject2.types.GType getFileDatabaseType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = g_tls_backend_get_file_database_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GType of backend's #GTlsServerConnection implementation.
      Returns: the #GType of backend's #GTlsServerConnection
          implementation.
  */
  override gid.gobject2.types.GType getServerConnectionType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = g_tls_backend_get_server_connection_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Set the default #GTlsDatabase used to verify TLS connections
      
      Any subsequent call to [gid.gio2.tls_backend.TlsBackend.getDefaultDatabase] will return
      the database set in this call.  Existing databases and connections are not
      modified.
      
      Setting a null default database will reset to using the system default
      database as if [gid.gio2.tls_backend.TlsBackend.setDefaultDatabase] had never been called.
  
      Params:
        database = the #GTlsDatabase
  */
  override void setDefaultDatabase(gid.gio2.tls_database.TlsDatabase database = null) nothrow
  {
    g_tls_backend_set_default_database(cast(GTlsBackend*)this._cPtr, database ? cast(GTlsDatabase*)database._cPtr(No.Dup) : null);
  }

  /**
      Checks if DTLS is supported. DTLS support may not be available even if TLS
      support is available, and vice-versa.
      Returns: whether DTLS is supported
  */
  override bool supportsDtls() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_tls_backend_supports_dtls(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Checks if TLS is supported; if this returns false for the default
      #GTlsBackend, it means no "real" TLS backend is available.
      Returns: whether or not TLS is supported
  */
  override bool supportsTls() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_tls_backend_supports_tls(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.tls_backend.TlsBackend (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_tls_backend_TlsBackend(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDefaultDatabase", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSupportsDtls", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSupportsTls", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.tls_backend.TlsBackend vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_tls_backend_TlsBackend(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDefaultDatabase", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_tls_backend_TlsBackend(iface, "get_default_database");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSupportsDtls", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_tls_backend_TlsBackend(iface, "supports_dtls");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSupportsTls", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_tls_backend_TlsBackend(iface, "supports_tls");
  }

  private static void _installIfaceVfunc_gid_gio2_tls_backend_TlsBackend(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GTlsBackendInterface*)iface;

    switch (vfunc)
    {
      case "get_default_database":
      {
        static extern(C) GTlsDatabase* _vfuncGetDefaultDatabaseTramp(GTlsBackend* backend) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GTlsBackendInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend), gid.gio2.tls_backend.TlsBackend._getGType);
            if (_klass && _klass.getDefaultDatabase)
              return (cast(typeof(&_vfuncGetDefaultDatabaseTramp))_klass.getDefaultDatabase)(backend);
            return typeof(return).init;
          }

          gid.gio2.tls_database.TlsDatabase _dretval;

          try
          {
            _dretval = _obj.vfuncGetDefaultDatabase();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.tls_backend.TlsBackend.vfuncGetDefaultDatabase");
          }
          auto _retval = _dretval ? cast(GTlsDatabase*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getDefaultDatabase = cast(typeof(_klass.getDefaultDatabase))&_vfuncGetDefaultDatabaseTramp;
        break;
      }
      case "supports_dtls":
      {
        static extern(C) gboolean _vfuncSupportsDtlsTramp(GTlsBackend* backend) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GTlsBackendInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend), gid.gio2.tls_backend.TlsBackend._getGType);
            if (_klass && _klass.supportsDtls)
              return (cast(typeof(&_vfuncSupportsDtlsTramp))_klass.supportsDtls)(backend);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSupportsDtls();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.tls_backend.TlsBackend.vfuncSupportsDtls");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.supportsDtls = cast(typeof(_klass.supportsDtls))&_vfuncSupportsDtlsTramp;
        break;
      }
      case "supports_tls":
      {
        static extern(C) gboolean _vfuncSupportsTlsTramp(GTlsBackend* backend) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GTlsBackendInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend), gid.gio2.tls_backend.TlsBackend._getGType);
            if (_klass && _klass.supportsTls)
              return (cast(typeof(&_vfuncSupportsTlsTramp))_klass.supportsTls)(backend);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSupportsTls();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.tls_backend.TlsBackend.vfuncSupportsTls");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.supportsTls = cast(typeof(_klass.supportsTls))&_vfuncSupportsTlsTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.tls_backend.TlsBackend]
template TlsBackendGidBuilderT()
{
}
