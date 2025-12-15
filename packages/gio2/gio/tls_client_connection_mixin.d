/// Module for [TlsClientConnection] interface mixin
module gio.tls_client_connection_mixin;

public import gio.tls_client_connection_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.iostream;
public import gio.socket_connectable;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    [gio.tls_client_connection.TlsClientConnection] is the client-side subclass of
    [gio.tls_connection.TlsConnection], representing a client-side TLS connection.
*/
template TlsClientConnectionT()
{

  /**
      Get `serverIdentity` property.
      Returns: A #GSocketConnectable describing the identity of the server that
      is expected on the other end of the connection.
      
      If the [gio.types.TlsCertificateFlags.BadIdentity] flag is set in
      #GTlsClientConnection:validation-flags, this object will be used
      to determine the expected identify of the remote end of the
      connection; if #GTlsClientConnection:server-identity is not set,
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
        #GTlsClientConnection:validation-flags, this object will be used
        to determine the expected identify of the remote end of the
        connection; if #GTlsClientConnection:server-identity is not set,
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
      Get `useSsl3` property.
      Returns: SSL 3.0 is no longer supported. See
      [gio.tls_client_connection.TlsClientConnection.setUseSsl3] for details.
  
      Deprecated: SSL 3.0 is insecure.
  */
  @property bool useSsl3()
  {
    return getUseSsl3();
  }

  /**
      Set `useSsl3` property.
      Params:
        propval = SSL 3.0 is no longer supported. See
        [gio.tls_client_connection.TlsClientConnection.setUseSsl3] for details.
  
      Deprecated: SSL 3.0 is insecure.
  */
  @property void useSsl3(bool propval)
  {
    return setUseSsl3(propval);
  }

  /**
      Get `validationFlags` property.
      Returns: What steps to perform when validating a certificate received from
      a server. Server certificates that fail to validate in any of the
      ways indicated here will be rejected unless the application
      overrides the default via #GTlsConnection::accept-certificate.
      
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
      connect to #GTlsConnection::accept-certificate.
  
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
        overrides the default via #GTlsConnection::accept-certificate.
        
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
        connect to #GTlsConnection::accept-certificate.
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  @property void validationFlags(gio.types.TlsCertificateFlags propval)
  {
    return setValidationFlags(propval);
  }


  /**
      Possibly copies session state from one connection to another, for use
      in TLS session resumption. This is not normally needed, but may be
      used when the same session needs to be used between different
      endpoints, as is required by some protocols, such as FTP over TLS.
      source should have already completed a handshake and, since TLS 1.3,
      it should have been used to read data at least once. conn should not
      have completed a handshake.
      
      It is not possible to know whether a call to this function will
      actually do anything. Because session resumption is normally used
      only for performance benefit, the TLS backend might not implement
      this function. Even if implemented, it may not actually succeed in
      allowing conn to resume source's TLS session, because the server
      may not have sent a session resumption token to source, or it may
      refuse to accept the token from conn. There is no way to know
      whether a call to this function is actually successful.
      
      Using this function is not required to benefit from session
      resumption. If the TLS backend supports session resumption, the
      session will be resumed automatically if it is possible to do so
      without weakening the privacy guarantees normally provided by TLS,
      without need to call this function. For example, with TLS 1.3,
      a session ticket will be automatically copied from any
      #GTlsClientConnection that has previously received session tickets
      from the server, provided a ticket is available that has not
      previously been used for session resumption, since session ticket
      reuse would be a privacy weakness. Using this function causes the
      ticket to be copied without regard for privacy considerations.
  
      Params:
        source = a #GTlsClientConnection
  */
  override void copySessionState(gio.tls_client_connection.TlsClientConnection source)
  {
    g_tls_client_connection_copy_session_state(cast(GTlsClientConnection*)this._cPtr, source ? cast(GTlsClientConnection*)(cast(gobject.object.ObjectWrap)source)._cPtr(No.Dup) : null);
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
    _cretval = g_tls_client_connection_get_server_identity(cast(GTlsClientConnection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connectable.SocketConnectable)(cast(GSocketConnectable*)_cretval, No.Take);
    return _retval;
  }

  /**
      SSL 3.0 is no longer supported. See
      [gio.tls_client_connection.TlsClientConnection.setUseSsl3] for details.
      Returns: false
  
      Deprecated: SSL 3.0 is insecure.
  */
  override bool getUseSsl3()
  {
    bool _retval;
    _retval = cast(bool)g_tls_client_connection_get_use_ssl3(cast(GTlsClientConnection*)this._cPtr);
    return _retval;
  }

  /**
      Gets conn's validation flags
      
      This function does not work as originally designed and is impossible
      to use correctly. See #GTlsClientConnection:validation-flags for more
      information.
      Returns: the validation flags
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  override gio.types.TlsCertificateFlags getValidationFlags()
  {
    GTlsCertificateFlags _cretval;
    _cretval = g_tls_client_connection_get_validation_flags(cast(GTlsClientConnection*)this._cPtr);
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
    g_tls_client_connection_set_server_identity(cast(GTlsClientConnection*)this._cPtr, identity ? cast(GSocketConnectable*)(cast(gobject.object.ObjectWrap)identity)._cPtr(No.Dup) : null);
  }

  /**
      Since GLib 2.42.1, SSL 3.0 is no longer supported.
      
      From GLib 2.42.1 through GLib 2.62, this function could be used to
      force use of TLS 1.0, the lowest-supported TLS protocol version at
      the time. In the past, this was needed to connect to broken TLS
      servers that exhibited protocol version intolerance. Such servers
      are no longer common, and using TLS 1.0 is no longer considered
      acceptable.
      
      Since GLib 2.64, this function does nothing.
  
      Params:
        useSsl3 = a #gboolean, ignored
  
      Deprecated: SSL 3.0 is insecure.
  */
  override void setUseSsl3(bool useSsl3)
  {
    g_tls_client_connection_set_use_ssl3(cast(GTlsClientConnection*)this._cPtr, useSsl3);
  }

  /**
      Sets conn's validation flags, to override the default set of
      checks performed when validating a server certificate. By default,
      [gio.types.TlsCertificateFlags.ValidateAll] is used.
      
      This function does not work as originally designed and is impossible
      to use correctly. See #GTlsClientConnection:validation-flags for more
      information.
  
      Params:
        flags = the #GTlsCertificateFlags to use
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  override void setValidationFlags(gio.types.TlsCertificateFlags flags)
  {
    g_tls_client_connection_set_validation_flags(cast(GTlsClientConnection*)this._cPtr, flags);
  }
}
