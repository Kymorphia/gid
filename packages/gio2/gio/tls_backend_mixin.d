/// Module for [TlsBackend] interface mixin
module gio.tls_backend_mixin;

public import gio.tls_backend_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.tls_database;
public import gio.types;
public import gobject.object;
public import gobject.types;

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
  override gobject.types.GType getCertificateType()
  {
    gobject.types.GType _retval;
    _retval = g_tls_backend_get_certificate_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GType of backend's #GTlsClientConnection implementation.
      Returns: the #GType of backend's #GTlsClientConnection
          implementation.
  */
  override gobject.types.GType getClientConnectionType()
  {
    gobject.types.GType _retval;
    _retval = g_tls_backend_get_client_connection_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the default #GTlsDatabase used to verify TLS connections.
      Returns: the default database, which should be
                      unreffed when done.
  */
  override gio.tls_database.TlsDatabase getDefaultDatabase()
  {
    GTlsDatabase* _cretval;
    _cretval = g_tls_backend_get_default_database(cast(GTlsBackend*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_database.TlsDatabase)(cast(GTlsDatabase*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the #GType of backend’s #GDtlsClientConnection implementation.
      Returns: the #GType of backend’s #GDtlsClientConnection
          implementation, or `G_TYPE_INVALID` if this backend doesn’t support DTLS.
  */
  override gobject.types.GType getDtlsClientConnectionType()
  {
    gobject.types.GType _retval;
    _retval = g_tls_backend_get_dtls_client_connection_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GType of backend’s #GDtlsServerConnection implementation.
      Returns: the #GType of backend’s #GDtlsServerConnection
          implementation, or `G_TYPE_INVALID` if this backend doesn’t support DTLS.
  */
  override gobject.types.GType getDtlsServerConnectionType()
  {
    gobject.types.GType _retval;
    _retval = g_tls_backend_get_dtls_server_connection_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GType of backend's #GTlsFileDatabase implementation.
      Returns: the #GType of backend's #GTlsFileDatabase implementation.
  */
  override gobject.types.GType getFileDatabaseType()
  {
    gobject.types.GType _retval;
    _retval = g_tls_backend_get_file_database_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GType of backend's #GTlsServerConnection implementation.
      Returns: the #GType of backend's #GTlsServerConnection
          implementation.
  */
  override gobject.types.GType getServerConnectionType()
  {
    gobject.types.GType _retval;
    _retval = g_tls_backend_get_server_connection_type(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }

  /**
      Set the default #GTlsDatabase used to verify TLS connections
      
      Any subsequent call to [gio.tls_backend.TlsBackend.getDefaultDatabase] will return
      the database set in this call.  Existing databases and connections are not
      modified.
      
      Setting a null default database will reset to using the system default
      database as if [gio.tls_backend.TlsBackend.setDefaultDatabase] had never been called.
  
      Params:
        database = the #GTlsDatabase
  */
  override void setDefaultDatabase(gio.tls_database.TlsDatabase database = null)
  {
    g_tls_backend_set_default_database(cast(GTlsBackend*)this._cPtr, database ? cast(GTlsDatabase*)database._cPtr(No.Dup) : null);
  }

  /**
      Checks if DTLS is supported. DTLS support may not be available even if TLS
      support is available, and vice-versa.
      Returns: whether DTLS is supported
  */
  override bool supportsDtls()
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
  override bool supportsTls()
  {
    bool _retval;
    _retval = cast(bool)g_tls_backend_supports_tls(cast(GTlsBackend*)this._cPtr);
    return _retval;
  }
}
