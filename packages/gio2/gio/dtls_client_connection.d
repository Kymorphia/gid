/// Module for [DtlsClientConnection] interface
module gio.dtls_client_connection;

public import gio.dtls_client_connection_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.datagram_based;
import gio.socket_connectable;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.dtls_client_connection.DtlsClientConnection] is the client-side subclass of
    [gio.dtls_connection.DtlsConnection], representing a client-side DTLS connection.
*/
interface DtlsClientConnection
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dtls_client_connection_get_type != &gidSymbolNotFound ? g_dtls_client_connection_get_type() : cast(GType)0;
  }

  /**
      Get `serverIdentity` property.
      Returns: A #GSocketConnectable describing the identity of the server that
        is expected on the other end of the connection.
        
        If the [gio.types.TlsCertificateFlags.BadIdentity] flag is set in
        #GDtlsClientConnection:validation-flags, this object will be used
        to determine the expected identify of the remote end of the
        connection; if #GDtlsClientConnection:server-identity is not set,
        or does not match the identity presented by the server, then the
        [gio.types.TlsCertificateFlags.BadIdentity] validation will fail.
        
        In addition to its use in verifying the server certificate,
        this is also used to give a hint to the server about what
        certificate we expect, which is useful for servers that serve
        virtual hosts.
  */
  @property gio.socket_connectable.SocketConnectable serverIdentity();

  /**
      Set `serverIdentity` property.
      Params:
        propval = A #GSocketConnectable describing the identity of the server that
          is expected on the other end of the connection.
          
          If the [gio.types.TlsCertificateFlags.BadIdentity] flag is set in
          #GDtlsClientConnection:validation-flags, this object will be used
          to determine the expected identify of the remote end of the
          connection; if #GDtlsClientConnection:server-identity is not set,
          or does not match the identity presented by the server, then the
          [gio.types.TlsCertificateFlags.BadIdentity] validation will fail.
          
          In addition to its use in verifying the server certificate,
          this is also used to give a hint to the server about what
          certificate we expect, which is useful for servers that serve
          virtual hosts.
  */
  @property void serverIdentity(gio.socket_connectable.SocketConnectable propval);

  /**
      Get `validationFlags` property.
      Returns: What steps to perform when validating a certificate received from
        a server. Server certificates that fail to validate in any of the
        ways indicated here will be rejected unless the application
        overrides the default via #GDtlsConnection::accept-certificate.
        
        GLib guarantees that if certificate verification fails, at least one
        flag will be set, but it does not guarantee that all possible flags
        will be set. Accordingly, you may not safely decide to ignore any
        particular type of error. For example, it would be incorrect to mask
        [gio.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
        because this could potentially be the only error flag set even if
        other problems exist with the certificate. Therefore, there is no
        safe way to use this property. This is not a horrible problem,
        though, because you should not be attempting to ignore validation
        errors anyway. If you really must ignore TLS certificate errors,
        connect to #GDtlsConnection::accept-certificate.
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  @property gio.types.TlsCertificateFlags validationFlags();

  /**
      Set `validationFlags` property.
      Params:
        propval = What steps to perform when validating a certificate received from
          a server. Server certificates that fail to validate in any of the
          ways indicated here will be rejected unless the application
          overrides the default via #GDtlsConnection::accept-certificate.
          
          GLib guarantees that if certificate verification fails, at least one
          flag will be set, but it does not guarantee that all possible flags
          will be set. Accordingly, you may not safely decide to ignore any
          particular type of error. For example, it would be incorrect to mask
          [gio.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
          because this could potentially be the only error flag set even if
          other problems exist with the certificate. Therefore, there is no
          safe way to use this property. This is not a horrible problem,
          though, because you should not be attempting to ignore validation
          errors anyway. If you really must ignore TLS certificate errors,
          connect to #GDtlsConnection::accept-certificate.
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  @property void validationFlags(gio.types.TlsCertificateFlags propval);

  /**
      Creates a new #GDtlsClientConnection wrapping base_socket which is
      assumed to communicate with the server identified by server_identity.
  
      Params:
        baseSocket = the #GDatagramBased to wrap
        serverIdentity = the expected identity of the server
      Returns: the new
          #GDtlsClientConnection, or null on error
      Throws: [ErrorWrap]
  */
  static gio.dtls_client_connection.DtlsClientConnection new_(gio.datagram_based.DatagramBased baseSocket, gio.socket_connectable.SocketConnectable serverIdentity = null)
  {
    GDatagramBased* _cretval;
    GError *_err;
    _cretval = g_dtls_client_connection_new(baseSocket ? cast(GDatagramBased*)(cast(gobject.object.ObjectWrap)baseSocket)._cPtr(No.Dup) : null, serverIdentity ? cast(GSocketConnectable*)(cast(gobject.object.ObjectWrap)serverIdentity)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dtls_client_connection.DtlsClientConnection)(cast(GDatagramBased*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets conn's expected server identity
      Returns: a #GSocketConnectable describing the
        expected server identity, or null if the expected identity is not
        known.
  */
  gio.socket_connectable.SocketConnectable getServerIdentity();

  /**
      Gets conn's validation flags
      
      This function does not work as originally designed and is impossible
      to use correctly. See #GDtlsClientConnection:validation-flags for more
      information.
      Returns: the validation flags
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  gio.types.TlsCertificateFlags getValidationFlags();

  /**
      Sets conn's expected server identity, which is used both to tell
      servers on virtual hosts which certificate to present, and also
      to let conn know what name to look for in the certificate when
      performing [gio.types.TlsCertificateFlags.BadIdentity] validation, if enabled.
  
      Params:
        identity = a #GSocketConnectable describing the expected server identity
  */
  void setServerIdentity(gio.socket_connectable.SocketConnectable identity);

  /**
      Sets conn's validation flags, to override the default set of
      checks performed when validating a server certificate. By default,
      [gio.types.TlsCertificateFlags.ValidateAll] is used.
      
      This function does not work as originally designed and is impossible
      to use correctly. See #GDtlsClientConnection:validation-flags for more
      information.
  
      Params:
        flags = the #GTlsCertificateFlags to use
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  void setValidationFlags(gio.types.TlsCertificateFlags flags);
}
