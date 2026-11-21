/// Module for [TlsBackend] interface
module gid.gio2.tls_backend;

public import gid.core.basictypes;
public import gid.gio2.tls_backend_iface_proxy;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.tls_database;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;

/**
    TLS (Transport Layer Security, aka SSL) and DTLS backend. This is an
    internal type used to coordinate the different classes implemented
    by a TLS backend.
*/
interface TlsBackend : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_tls_backend_get_type != &gidSymbolNotFound ? g_tls_backend_get_type() : cast(GType)0;
  }

  /**
      Gets the default #GTlsBackend for the system.
      Returns: a #GTlsBackend, which will be a
            dummy object if no TLS backend is available
  */
  static gid.gio2.tls_backend.TlsBackend getDefault() nothrow
  {
    GTlsBackend* _cretval;
    _cretval = g_tls_backend_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_backend.TlsBackend)(cast(GTlsBackend*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GType of backend's #GTlsCertificate implementation.
      Returns: the #GType of backend's #GTlsCertificate
          implementation.
  */
  gid.gobject2.types.GType getCertificateType();

  /**
      Gets the #GType of backend's #GTlsClientConnection implementation.
      Returns: the #GType of backend's #GTlsClientConnection
          implementation.
  */
  gid.gobject2.types.GType getClientConnectionType();

  /**
      Gets the default #GTlsDatabase used to verify TLS connections.
      Returns: the default database, which should be
                      unreffed when done.
  */
  gid.gio2.tls_database.TlsDatabase getDefaultDatabase();

  /**
      Gets the #GType of backend’s #GDtlsClientConnection implementation.
      Returns: the #GType of backend’s #GDtlsClientConnection
          implementation, or `G_TYPE_INVALID` if this backend doesn’t support DTLS.
  */
  gid.gobject2.types.GType getDtlsClientConnectionType();

  /**
      Gets the #GType of backend’s #GDtlsServerConnection implementation.
      Returns: the #GType of backend’s #GDtlsServerConnection
          implementation, or `G_TYPE_INVALID` if this backend doesn’t support DTLS.
  */
  gid.gobject2.types.GType getDtlsServerConnectionType();

  /**
      Gets the #GType of backend's #GTlsFileDatabase implementation.
      Returns: the #GType of backend's #GTlsFileDatabase implementation.
  */
  gid.gobject2.types.GType getFileDatabaseType();

  /**
      Gets the #GType of backend's #GTlsServerConnection implementation.
      Returns: the #GType of backend's #GTlsServerConnection
          implementation.
  */
  gid.gobject2.types.GType getServerConnectionType();

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
  void setDefaultDatabase(gid.gio2.tls_database.TlsDatabase database = null);

  /**
      Checks if DTLS is supported. DTLS support may not be available even if TLS
      support is available, and vice-versa.
      Returns: whether DTLS is supported
  */
  bool supportsDtls();

  /**
      Checks if TLS is supported; if this returns false for the default
      #GTlsBackend, it means no "real" TLS backend is available.
      Returns: whether or not TLS is supported
  */
  bool supportsTls();
}

/// Fluent builder implementation template for [gid.gio2.tls_backend.TlsBackend]
interface TlsBackendGidBuilderImpl(T)
{
}
