/// Module for [DtlsServerConnection] interface
module gid.gio2.dtls_server_connection;

public import gid.core.basictypes;
public import gid.gio2.dtls_server_connection_iface_proxy;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.datagram_based;
import gid.gio2.dtls_connection;
import gid.gio2.tls_certificate;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.dtls_server_connection.DtlsServerConnection] is the server-side subclass of
    [gid.gio2.dtls_connection.DtlsConnection], representing a server-side DTLS connection.
*/
interface DtlsServerConnection : gid.gio2.datagram_based.DatagramBased, gid.gio2.dtls_connection.DtlsConnection
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_dtls_server_connection_get_type != &gidSymbolNotFound ? g_dtls_server_connection_get_type() : cast(GType)0;
  }

  /**
      Get `authenticationMode` property.
      Returns: The #GTlsAuthenticationMode for the server. This can be changed
        before calling [gid.gio2.dtls_connection.DtlsConnection.handshake] if you want to
        rehandshake with a different mode from the initial handshake.
  */
  @property gid.gio2.types.TlsAuthenticationMode authenticationMode() nothrow;

  /**
      Set `authenticationMode` property.
      Params:
        propval = The #GTlsAuthenticationMode for the server. This can be changed
          before calling [gid.gio2.dtls_connection.DtlsConnection.handshake] if you want to
          rehandshake with a different mode from the initial handshake.
  */
  @property void authenticationMode(gid.gio2.types.TlsAuthenticationMode propval) nothrow;

  /**
      Creates a new #GDtlsServerConnection wrapping base_socket.
  
      Params:
        baseSocket = the #GDatagramBased to wrap
        certificate = the default server certificate, or null
      Returns: the new
          #GDtlsServerConnection, or null on error
      Throws: [ErrorWrap]
  */
  static gid.gio2.dtls_server_connection.DtlsServerConnection new_(gid.gio2.datagram_based.DatagramBased baseSocket, gid.gio2.tls_certificate.TlsCertificate certificate = null)
  {
    GDatagramBased* _cretval;
    GError *_err;
    _cretval = g_dtls_server_connection_new(baseSocket ? cast(GDatagramBased*)(cast(gid.gobject2.object.ObjectWrap)baseSocket)._cPtr(No.Dup) : null, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dtls_server_connection.DtlsServerConnection)(cast(GDatagramBased*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.dtls_server_connection.DtlsServerConnection]
interface DtlsServerConnectionGidBuilderImpl(T) : gid.gio2.datagram_based.DatagramBasedGidBuilderImpl!T, gid.gio2.dtls_connection.DtlsConnectionGidBuilderImpl!T
{

  /**
      Set `authenticationMode` property.
      Params:
        propval = The #GTlsAuthenticationMode for the server. This can be changed
          before calling [gid.gio2.dtls_connection.DtlsConnection.handshake] if you want to
          rehandshake with a different mode from the initial handshake.
      Returns: Builder instance for fluent chaining
  */
  T authenticationMode(gid.gio2.types.TlsAuthenticationMode propval) nothrow;
}
