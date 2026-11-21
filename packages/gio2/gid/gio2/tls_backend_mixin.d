/// Module for [TlsBackend] interface mixin
module gid.gio2.tls_backend_mixin;

public import gid.core.basictypes;
public import gid.gio2.tls_backend_iface_proxy;
public import gid.core.gid;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.tls_database;
public import gid.gio2.types;
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
}

/// Fluent builder implementation template for [gid.gio2.tls_backend.TlsBackend]
template TlsBackendGidBuilderT()
{
}
