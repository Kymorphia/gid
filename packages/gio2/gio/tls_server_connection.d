/// Module for [TlsServerConnection] interface
module gio.tls_server_connection;

public import gio.tls_server_connection_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.iostream;
import gio.tls_certificate;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.tls_server_connection.TlsServerConnection] is the server-side subclass of
    [gio.tls_connection.TlsConnection], representing a server-side TLS connection.
*/
interface TlsServerConnection
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_tls_server_connection_get_type != &gidSymbolNotFound ? g_tls_server_connection_get_type() : cast(GType)0;
  }

  /**
      Get `authenticationMode` property.
      Returns: The #GTlsAuthenticationMode for the server. This can be changed
        before calling [gio.tls_connection.TlsConnection.handshake] if you want to
        rehandshake with a different mode from the initial handshake.
  */
  @property gio.types.TlsAuthenticationMode authenticationMode();

  /**
      Set `authenticationMode` property.
      Params:
        propval = The #GTlsAuthenticationMode for the server. This can be changed
          before calling [gio.tls_connection.TlsConnection.handshake] if you want to
          rehandshake with a different mode from the initial handshake.
  */
  @property void authenticationMode(gio.types.TlsAuthenticationMode propval);

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
  static gio.tls_server_connection.TlsServerConnection new_(gio.iostream.IOStream baseIoStream, gio.tls_certificate.TlsCertificate certificate = null)
  {
    GIOStream* _cretval;
    GError *_err;
    _cretval = g_tls_server_connection_new(baseIoStream ? cast(GIOStream*)baseIoStream._cPtr(No.Dup) : null, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_server_connection.TlsServerConnection)(cast(GIOStream*)_cretval, Yes.Take);
    return _retval;
  }
}
