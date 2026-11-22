/// Module for [DtlsClientConnection] interface
module gid.gio2.dtls_client_connection;

public import gid.core.basictypes;
public import gid.gio2.dtls_client_connection_iface_proxy;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.datagram_based;
import gid.gio2.dtls_connection;
import gid.gio2.socket_connectable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.dtls_client_connection.DtlsClientConnection] is the client-side subclass of
    [gid.gio2.dtls_connection.DtlsConnection], representing a client-side DTLS connection.
*/
interface DtlsClientConnection : gid.gio2.datagram_based.DatagramBased, gid.gio2.dtls_connection.DtlsConnection
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_dtls_client_connection_get_type != &gidSymbolNotFound ? g_dtls_client_connection_get_type() : cast(GType)0;
  }

  /**
      Get `serverIdentity` property.
      Returns: A #GSocketConnectable describing the identity of the server that
        is expected on the other end of the connection.
        
        If the [gid.gio2.types.TlsCertificateFlags.BadIdentity] flag is set in
        #GDtlsClientConnection:validation-flags, this object will be used
        to determine the expected identify of the remote end of the
        connection; if #GDtlsClientConnection:server-identity is not set,
        or does not match the identity presented by the server, then the
        [gid.gio2.types.TlsCertificateFlags.BadIdentity] validation will fail.
        
        In addition to its use in verifying the server certificate,
        this is also used to give a hint to the server about what
        certificate we expect, which is useful for servers that serve
        virtual hosts.
  */
  @property gid.gio2.socket_connectable.SocketConnectable serverIdentity() nothrow;

  /**
      Set `serverIdentity` property.
      Params:
        propval = A #GSocketConnectable describing the identity of the server that
          is expected on the other end of the connection.
          
          If the [gid.gio2.types.TlsCertificateFlags.BadIdentity] flag is set in
          #GDtlsClientConnection:validation-flags, this object will be used
          to determine the expected identify of the remote end of the
          connection; if #GDtlsClientConnection:server-identity is not set,
          or does not match the identity presented by the server, then the
          [gid.gio2.types.TlsCertificateFlags.BadIdentity] validation will fail.
          
          In addition to its use in verifying the server certificate,
          this is also used to give a hint to the server about what
          certificate we expect, which is useful for servers that serve
          virtual hosts.
  */
  @property void serverIdentity(gid.gio2.socket_connectable.SocketConnectable propval) nothrow;

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
        [gid.gio2.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
        because this could potentially be the only error flag set even if
        other problems exist with the certificate. Therefore, there is no
        safe way to use this property. This is not a horrible problem,
        though, because you should not be attempting to ignore validation
        errors anyway. If you really must ignore TLS certificate errors,
        connect to #GDtlsConnection::accept-certificate.
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  @property gid.gio2.types.TlsCertificateFlags validationFlags() nothrow;

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
          [gid.gio2.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
          because this could potentially be the only error flag set even if
          other problems exist with the certificate. Therefore, there is no
          safe way to use this property. This is not a horrible problem,
          though, because you should not be attempting to ignore validation
          errors anyway. If you really must ignore TLS certificate errors,
          connect to #GDtlsConnection::accept-certificate.
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  @property void validationFlags(gid.gio2.types.TlsCertificateFlags propval) nothrow;

  /**
  Gets the list of distinguished names of the Certificate Authorities that the server will accept certificates
  from. This will be set during the DTLS handshake if the server requests a certificate. Otherwise, it will be
  empty.
  Returns: the DER encoded distinguished names, one for each accepted CA
  */
  ubyte[][] getAcceptedCas()() nothrow
  {
    import gid.glib2.c.functions : g_byte_array_unref, g_list_free;
    import gid.glib2.c.types : GByteArray, GList;

    auto _list = g_dtls_client_connection_get_accepted_cas(cast(GDtlsClientConnection*)(cast(gid.gobject2.object.ObjectWrap)this)._cPtr);
    ubyte[][] _retval;

    for (auto n = _list; n; n = n.next) // List and GByteArray items owned by the caller (transfer full)
    {
      auto ba = cast(GByteArray*)n.data;
      _retval ~= ba && ba.len > 0 ? ba.data[0 .. ba.len].dup : null;

      if (ba)
        g_byte_array_unref(ba);
    }

    g_list_free(_list);
    return _retval;
  }


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
  static gid.gio2.dtls_client_connection.DtlsClientConnection new_(gid.gio2.datagram_based.DatagramBased baseSocket, gid.gio2.socket_connectable.SocketConnectable serverIdentity = null)
  {
    GDatagramBased* _cretval;
    GError *_err;
    _cretval = g_dtls_client_connection_new(baseSocket ? cast(GDatagramBased*)(cast(gid.gobject2.object.ObjectWrap)baseSocket)._cPtr(No.Dup) : null, serverIdentity ? cast(GSocketConnectable*)(cast(gid.gobject2.object.ObjectWrap)serverIdentity)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dtls_client_connection.DtlsClientConnection)(cast(GDatagramBased*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets conn's expected server identity
      Returns: a #GSocketConnectable describing the
        expected server identity, or null if the expected identity is not
        known.
  */
  gid.gio2.socket_connectable.SocketConnectable getServerIdentity();

  /**
      Gets conn's validation flags
      
      This function does not work as originally designed and is impossible
      to use correctly. See #GDtlsClientConnection:validation-flags for more
      information.
      Returns: the validation flags
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  gid.gio2.types.TlsCertificateFlags getValidationFlags();

  /**
      Sets conn's expected server identity, which is used both to tell
      servers on virtual hosts which certificate to present, and also
      to let conn know what name to look for in the certificate when
      performing [gid.gio2.types.TlsCertificateFlags.BadIdentity] validation, if enabled.
  
      Params:
        identity = a #GSocketConnectable describing the expected server identity
  */
  void setServerIdentity(gid.gio2.socket_connectable.SocketConnectable identity);

  /**
      Sets conn's validation flags, to override the default set of
      checks performed when validating a server certificate. By default,
      [gid.gio2.types.TlsCertificateFlags.ValidateAll] is used.
      
      This function does not work as originally designed and is impossible
      to use correctly. See #GDtlsClientConnection:validation-flags for more
      information.
  
      Params:
        flags = the #GTlsCertificateFlags to use
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  void setValidationFlags(gid.gio2.types.TlsCertificateFlags flags);
}

/// Fluent builder implementation template for [gid.gio2.dtls_client_connection.DtlsClientConnection]
interface DtlsClientConnectionGidBuilderImpl(T) : gid.gio2.datagram_based.DatagramBasedGidBuilderImpl!T, gid.gio2.dtls_connection.DtlsConnectionGidBuilderImpl!T
{

  /**
      Set `serverIdentity` property.
      Params:
        propval = A #GSocketConnectable describing the identity of the server that
          is expected on the other end of the connection.
          
          If the [gid.gio2.types.TlsCertificateFlags.BadIdentity] flag is set in
          #GDtlsClientConnection:validation-flags, this object will be used
          to determine the expected identify of the remote end of the
          connection; if #GDtlsClientConnection:server-identity is not set,
          or does not match the identity presented by the server, then the
          [gid.gio2.types.TlsCertificateFlags.BadIdentity] validation will fail.
          
          In addition to its use in verifying the server certificate,
          this is also used to give a hint to the server about what
          certificate we expect, which is useful for servers that serve
          virtual hosts.
      Returns: Builder instance for fluent chaining
  */
  T serverIdentity(gid.gio2.socket_connectable.SocketConnectable propval) nothrow;

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
          [gid.gio2.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
          because this could potentially be the only error flag set even if
          other problems exist with the certificate. Therefore, there is no
          safe way to use this property. This is not a horrible problem,
          though, because you should not be attempting to ignore validation
          errors anyway. If you really must ignore TLS certificate errors,
          connect to #GDtlsConnection::accept-certificate.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  T validationFlags(gid.gio2.types.TlsCertificateFlags propval) nothrow;
}
