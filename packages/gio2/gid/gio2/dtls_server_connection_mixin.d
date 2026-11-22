/// Module for [DtlsServerConnection] interface mixin
module gid.gio2.dtls_server_connection_mixin;

public import gid.core.basictypes;
public import gid.gio2.dtls_server_connection_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.datagram_based;
public import gid.gio2.tls_certificate;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.dtls_server_connection.DtlsServerConnection] is the server-side subclass of
    [gid.gio2.dtls_connection.DtlsConnection], representing a server-side DTLS connection.
*/
template DtlsServerConnectionT()
{

  /**
      Get `authenticationMode` property.
      Returns: The #GTlsAuthenticationMode for the server. This can be changed
        before calling [gid.gio2.dtls_connection.DtlsConnection.handshake] if you want to
        rehandshake with a different mode from the initial handshake.
  */
  @property gid.gio2.types.TlsAuthenticationMode authenticationMode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.types.TlsAuthenticationMode)("authentication-mode");
  }

  /**
      Set `authenticationMode` property.
      Params:
        propval = The #GTlsAuthenticationMode for the server. This can be changed
          before calling [gid.gio2.dtls_connection.DtlsConnection.handshake] if you want to
          rehandshake with a different mode from the initial handshake.
  */
  @property void authenticationMode(gid.gio2.types.TlsAuthenticationMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.types.TlsAuthenticationMode)("authentication-mode", propval);
  }

}

/// Fluent builder implementation template for [gid.gio2.dtls_server_connection.DtlsServerConnection]
template DtlsServerConnectionGidBuilderT()
{

  /**
      Set `authenticationMode` property.
      Params:
        propval = The #GTlsAuthenticationMode for the server. This can be changed
          before calling [gid.gio2.dtls_connection.DtlsConnection.handshake] if you want to
          rehandshake with a different mode from the initial handshake.
      Returns: Builder instance for fluent chaining
  */
  T authenticationMode(gid.gio2.types.TlsAuthenticationMode propval) nothrow
  {
    return setProperty("authentication-mode", propval);
  }
}
