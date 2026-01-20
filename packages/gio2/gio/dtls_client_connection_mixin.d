/// Module for [DtlsClientConnection] interface mixin
module gio.dtls_client_connection_mixin;

public import gio.dtls_client_connection_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.datagram_based;
public import gio.socket_connectable;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    [gio.dtls_client_connection.DtlsClientConnection] is the client-side subclass of
    [gio.dtls_connection.DtlsConnection], representing a client-side DTLS connection.
*/
template DtlsClientConnectionT()
{

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
  @property gio.socket_connectable.SocketConnectable serverIdentity()
  {
    return getServerIdentity();
  }

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
  @property void serverIdentity(gio.socket_connectable.SocketConnectable propval)
  {
    return setServerIdentity(propval);
  }

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
  @property gio.types.TlsCertificateFlags validationFlags()
  {
    return getValidationFlags();
  }

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
  @property void validationFlags(gio.types.TlsCertificateFlags propval)
  {
    return setValidationFlags(propval);
  }


  /**
      Gets conn's expected server identity
      Returns: a #GSocketConnectable describing the
        expected server identity, or null if the expected identity is not
        known.
  */
  override gio.socket_connectable.SocketConnectable getServerIdentity()
  {
    GSocketConnectable* _cretval;
    _cretval = g_dtls_client_connection_get_server_identity(cast(GDtlsClientConnection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connectable.SocketConnectable)(cast(GSocketConnectable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets conn's validation flags
      
      This function does not work as originally designed and is impossible
      to use correctly. See #GDtlsClientConnection:validation-flags for more
      information.
      Returns: the validation flags
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  override gio.types.TlsCertificateFlags getValidationFlags()
  {
    GTlsCertificateFlags _cretval;
    _cretval = g_dtls_client_connection_get_validation_flags(cast(GDtlsClientConnection*)this._cPtr);
    gio.types.TlsCertificateFlags _retval = cast(gio.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
      Sets conn's expected server identity, which is used both to tell
      servers on virtual hosts which certificate to present, and also
      to let conn know what name to look for in the certificate when
      performing [gio.types.TlsCertificateFlags.BadIdentity] validation, if enabled.
  
      Params:
        identity = a #GSocketConnectable describing the expected server identity
  */
  override void setServerIdentity(gio.socket_connectable.SocketConnectable identity)
  {
    g_dtls_client_connection_set_server_identity(cast(GDtlsClientConnection*)this._cPtr, identity ? cast(GSocketConnectable*)(cast(gobject.object.ObjectWrap)identity)._cPtr(No.Dup) : null);
  }

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
  override void setValidationFlags(gio.types.TlsCertificateFlags flags)
  {
    g_dtls_client_connection_set_validation_flags(cast(GDtlsClientConnection*)this._cPtr, flags);
  }
}
