/// Module for [DtlsServerConnection] interface
module gio.dtls_server_connection;

public import gio.dtls_server_connection_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.datagram_based;
import gio.tls_certificate;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.dtls_server_connection.DtlsServerConnection] is the server-side subclass of
    [gio.dtls_connection.DtlsConnection], representing a server-side DTLS connection.
*/
interface DtlsServerConnection
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dtls_server_connection_get_type != &gidSymbolNotFound ? g_dtls_server_connection_get_type() : cast(GType)0;
  }

  /**
      Get `authenticationMode` property.
      Returns: The #GTlsAuthenticationMode for the server. This can be changed
        before calling [gio.dtls_connection.DtlsConnection.handshake] if you want to
        rehandshake with a different mode from the initial handshake.
  */
  @property gio.types.TlsAuthenticationMode authenticationMode();

  /**
      Set `authenticationMode` property.
      Params:
        propval = The #GTlsAuthenticationMode for the server. This can be changed
          before calling [gio.dtls_connection.DtlsConnection.handshake] if you want to
          rehandshake with a different mode from the initial handshake.
  */
  @property void authenticationMode(gio.types.TlsAuthenticationMode propval);

  /**
      Creates a new #GDtlsServerConnection wrapping base_socket.
  
      Params:
        baseSocket = the #GDatagramBased to wrap
        certificate = the default server certificate, or null
      Returns: the new
          #GDtlsServerConnection, or null on error
      Throws: [ErrorWrap]
  */
  static gio.dtls_server_connection.DtlsServerConnection new_(gio.datagram_based.DatagramBased baseSocket, gio.tls_certificate.TlsCertificate certificate = null)
  {
    GDatagramBased* _cretval;
    GError *_err;
    _cretval = g_dtls_server_connection_new(baseSocket ? cast(GDatagramBased*)(cast(gobject.object.ObjectWrap)baseSocket)._cPtr(No.Dup) : null, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dtls_server_connection.DtlsServerConnection)(cast(GDatagramBased*)_cretval, Yes.Take);
    return _retval;
  }
}
