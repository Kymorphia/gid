/// Module for [TlsServerConnection] interface
module gid.gio2.tls_server_connection;

public import gid.core.basictypes;
public import gid.gio2.tls_server_connection_iface_proxy;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.iostream;
import gid.gio2.tls_certificate;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.tls_server_connection.TlsServerConnection] is the server-side subclass of
    [gid.gio2.tls_connection.TlsConnection], representing a server-side TLS connection.
*/
interface TlsServerConnection : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_tls_server_connection_get_type != &gidSymbolNotFound ? g_tls_server_connection_get_type() : cast(GType)0;
  }

  /**
      Get `authenticationMode` property.
      Returns: The #GTlsAuthenticationMode for the server. This can be changed
        before calling [gid.gio2.tls_connection.TlsConnection.handshake] if you want to
        rehandshake with a different mode from the initial handshake.
  */
  @property gid.gio2.types.TlsAuthenticationMode authenticationMode() nothrow;

  /**
      Set `authenticationMode` property.
      Params:
        propval = The #GTlsAuthenticationMode for the server. This can be changed
          before calling [gid.gio2.tls_connection.TlsConnection.handshake] if you want to
          rehandshake with a different mode from the initial handshake.
  */
  @property void authenticationMode(gid.gio2.types.TlsAuthenticationMode propval) nothrow;

  /**
      Creates a new #GTlsServerConnection wrapping base_io_stream (which
      must have pollable input and output streams).
      
      See the documentation for #GTlsConnection:base-io-stream for restrictions
      on when application code can run operations on the base_io_stream after
      this function has returned.
  
      Params:
        baseIoStream = the #GIOStream to wrap
        certificate = the default server certificate, or null
      Returns: the new
        #GTlsServerConnection, or null on error
      Throws: [ErrorWrap]
  */
  static gid.gio2.tls_server_connection.TlsServerConnection new_(gid.gio2.iostream.IOStream baseIoStream, gid.gio2.tls_certificate.TlsCertificate certificate = null)
  {
    GIOStream* _cretval;
    GError *_err;
    _cretval = g_tls_server_connection_new(baseIoStream ? cast(GIOStream*)baseIoStream._cPtr(No.Dup) : null, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_server_connection.TlsServerConnection)(cast(GIOStream*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.tls_server_connection.TlsServerConnection]
interface TlsServerConnectionGidBuilderImpl(T)
{

  /**
      Set `authenticationMode` property.
      Params:
        propval = The #GTlsAuthenticationMode for the server. This can be changed
          before calling [gid.gio2.tls_connection.TlsConnection.handshake] if you want to
          rehandshake with a different mode from the initial handshake.
      Returns: Builder instance for fluent chaining
  */
  T authenticationMode(gid.gio2.types.TlsAuthenticationMode propval) nothrow;
}
