/// Module for [TlsServerConnection] interface mixin
module gio.tls_server_connection_mixin;

public import gio.tls_server_connection_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.iostream;
public import gio.tls_certificate;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    [gio.tls_server_connection.TlsServerConnection] is the server-side subclass of
    [gio.tls_connection.TlsConnection], representing a server-side TLS connection.
*/
template TlsServerConnectionT()
{

  /**
      Get `authenticationMode` property.
      Returns: The #GTlsAuthenticationMode for the server. This can be changed
        before calling [gio.tls_connection.TlsConnection.handshake] if you want to
        rehandshake with a different mode from the initial handshake.
  */
  @property gio.types.TlsAuthenticationMode authenticationMode()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.types.TlsAuthenticationMode)("authentication-mode");
  }

  /**
      Set `authenticationMode` property.
      Params:
        propval = The #GTlsAuthenticationMode for the server. This can be changed
          before calling [gio.tls_connection.TlsConnection.handshake] if you want to
          rehandshake with a different mode from the initial handshake.
  */
  @property void authenticationMode(gio.types.TlsAuthenticationMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.types.TlsAuthenticationMode)("authentication-mode", propval);
  }

}
