/// Module for [TlsClientConnection] interface mixin
module gid.gio2.tls_client_connection_mixin;

public import gid.core.basictypes;
public import gid.gio2.tls_client_connection_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.iostream;
public import gid.gio2.socket_connectable;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.tls_client_connection.TlsClientConnection] is the client-side subclass of
    [gid.gio2.tls_connection.TlsConnection], representing a client-side TLS connection.
*/
template TlsClientConnectionT()
{

  /**
      Get `serverIdentity` property.
      Returns: A #GSocketConnectable describing the identity of the server that
        is expected on the other end of the connection.
        
        If the [gid.gio2.types.TlsCertificateFlags.BadIdentity] flag is set in
        #GTlsClientConnection:validation-flags, this object will be used
        to determine the expected identify of the remote end of the
        connection; if #GTlsClientConnection:server-identity is not set,
        or does not match the identity presented by the server, then the
        [gid.gio2.types.TlsCertificateFlags.BadIdentity] validation will fail.
        
        In addition to its use in verifying the server certificate,
        this is also used to give a hint to the server about what
        certificate we expect, which is useful for servers that serve
        virtual hosts.
  */
  @property gid.gio2.socket_connectable.SocketConnectable serverIdentity() nothrow
  {
    return getServerIdentity();
  }

  /**
      Set `serverIdentity` property.
      Params:
        propval = A #GSocketConnectable describing the identity of the server that
          is expected on the other end of the connection.
          
          If the [gid.gio2.types.TlsCertificateFlags.BadIdentity] flag is set in
          #GTlsClientConnection:validation-flags, this object will be used
          to determine the expected identify of the remote end of the
          connection; if #GTlsClientConnection:server-identity is not set,
          or does not match the identity presented by the server, then the
          [gid.gio2.types.TlsCertificateFlags.BadIdentity] validation will fail.
          
          In addition to its use in verifying the server certificate,
          this is also used to give a hint to the server about what
          certificate we expect, which is useful for servers that serve
          virtual hosts.
  */
  @property void serverIdentity(gid.gio2.socket_connectable.SocketConnectable propval) nothrow
  {
    setServerIdentity(propval);
  }

  /**
      Get `useSsl3` property.
      Returns: SSL 3.0 is no longer supported. See
        [gid.gio2.tls_client_connection.TlsClientConnection.setUseSsl3] for details.
  
      Deprecated: SSL 3.0 is insecure.
  */
  @property bool useSsl3() nothrow
  {
    return getUseSsl3();
  }

  /**
      Set `useSsl3` property.
      Params:
        propval = SSL 3.0 is no longer supported. See
          [gid.gio2.tls_client_connection.TlsClientConnection.setUseSsl3] for details.
  
      Deprecated: SSL 3.0 is insecure.
  */
  @property void useSsl3(bool propval) nothrow
  {
    setUseSsl3(propval);
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
        [gid.gio2.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
        because this could potentially be the only error flag set even if
        other problems exist with the certificate. Therefore, there is no
        safe way to use this property. This is not a horrible problem,
        though, because you should not be attempting to ignore validation
        errors anyway. If you really must ignore TLS certificate errors,
        connect to #GTlsConnection::accept-certificate.
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  @property gid.gio2.types.TlsCertificateFlags validationFlags() nothrow
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
          [gid.gio2.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
          because this could potentially be the only error flag set even if
          other problems exist with the certificate. Therefore, there is no
          safe way to use this property. This is not a horrible problem,
          though, because you should not be attempting to ignore validation
          errors anyway. If you really must ignore TLS certificate errors,
          connect to #GTlsConnection::accept-certificate.
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  @property void validationFlags(gid.gio2.types.TlsCertificateFlags propval) nothrow
  {
    setValidationFlags(propval);
  }

  /**
  Gets the list of distinguished names of the Certificate Authorities that the server will accept certificates
  from. This will be set during the TLS handshake if the server requests a certificate. Otherwise, it will be
  empty.
  Returns: the DER encoded distinguished names, one for each accepted CA
  */
  ubyte[][] getAcceptedCas()() nothrow
  {
    import gid.glib2.c.functions : g_byte_array_unref, g_list_free;
    import gid.glib2.c.types : GByteArray, GList;

    auto _list = g_tls_client_connection_get_accepted_cas(cast(GTlsClientConnection*)(cast(gid.gobject2.object.ObjectWrap)this)._cPtr);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCopySessionState`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCopySessionState(gid.gio2.tls_client_connection.TlsClientConnection source)
  {
    auto _klass = cast(GTlsClientConnectionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.tls_client_connection.TlsClientConnection._getGType);
    if (!_klass || !_klass.copySessionState)
      return;

    _klass.copySessionState(cast(GTlsClientConnection*)this._cPtr, source ? cast(GTlsClientConnection*)(cast(gid.gobject2.object.ObjectWrap)source)._cPtr(No.Dup) : null);
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
  override void copySessionState(gid.gio2.tls_client_connection.TlsClientConnection source) nothrow
  {
    g_tls_client_connection_copy_session_state(cast(GTlsClientConnection*)this._cPtr, source ? cast(GTlsClientConnection*)(cast(gid.gobject2.object.ObjectWrap)source)._cPtr(No.Dup) : null);
  }

  /**
      Gets conn's expected server identity
      Returns: a #GSocketConnectable describing the
        expected server identity, or null if the expected identity is not
        known.
  */
  override gid.gio2.socket_connectable.SocketConnectable getServerIdentity() nothrow
  {
    GSocketConnectable* _cretval;
    _cretval = g_tls_client_connection_get_server_identity(cast(GTlsClientConnection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_connectable.SocketConnectable)(cast(GSocketConnectable*)_cretval, No.Take);
    return _retval;
  }

  /**
      SSL 3.0 is no longer supported. See
      [gid.gio2.tls_client_connection.TlsClientConnection.setUseSsl3] for details.
      Returns: false
  
      Deprecated: SSL 3.0 is insecure.
  */
  override bool getUseSsl3() nothrow
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
  override gid.gio2.types.TlsCertificateFlags getValidationFlags() nothrow
  {
    GTlsCertificateFlags _cretval;
    _cretval = g_tls_client_connection_get_validation_flags(cast(GTlsClientConnection*)this._cPtr);
    gid.gio2.types.TlsCertificateFlags _retval = cast(gid.gio2.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
      Sets conn's expected server identity, which is used both to tell
      servers on virtual hosts which certificate to present, and also
      to let conn know what name to look for in the certificate when
      performing [gid.gio2.types.TlsCertificateFlags.BadIdentity] validation, if enabled.
  
      Params:
        identity = a #GSocketConnectable describing the expected server identity
  */
  override void setServerIdentity(gid.gio2.socket_connectable.SocketConnectable identity) nothrow
  {
    g_tls_client_connection_set_server_identity(cast(GTlsClientConnection*)this._cPtr, identity ? cast(GSocketConnectable*)(cast(gid.gobject2.object.ObjectWrap)identity)._cPtr(No.Dup) : null);
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
  override void setUseSsl3(bool useSsl3) nothrow
  {
    g_tls_client_connection_set_use_ssl3(cast(GTlsClientConnection*)this._cPtr, useSsl3);
  }

  /**
      Sets conn's validation flags, to override the default set of
      checks performed when validating a server certificate. By default,
      [gid.gio2.types.TlsCertificateFlags.ValidateAll] is used.
      
      This function does not work as originally designed and is impossible
      to use correctly. See #GTlsClientConnection:validation-flags for more
      information.
  
      Params:
        flags = the #GTlsCertificateFlags to use
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  override void setValidationFlags(gid.gio2.types.TlsCertificateFlags flags) nothrow
  {
    g_tls_client_connection_set_validation_flags(cast(GTlsClientConnection*)this._cPtr, flags);
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.tls_client_connection.TlsClientConnection (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_tls_client_connection_TlsClientConnection(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCopySessionState", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.tls_client_connection.TlsClientConnection vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_tls_client_connection_TlsClientConnection(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCopySessionState", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_tls_client_connection_TlsClientConnection(iface, "copy_session_state");
  }

  private static void _installIfaceVfunc_gid_gio2_tls_client_connection_TlsClientConnection(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GTlsClientConnectionInterface*)iface;

    switch (vfunc)
    {
      case "copy_session_state":
      {
        static extern(C) void _vfuncCopySessionStateTramp(GTlsClientConnection* conn, GTlsClientConnection* source) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)conn);
          if (!_obj)
          {
            auto _klass = cast(GTlsClientConnectionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)conn), gid.gio2.tls_client_connection.TlsClientConnection._getGType);
            if (_klass && _klass.copySessionState)
              return (cast(typeof(&_vfuncCopySessionStateTramp))_klass.copySessionState)(conn, source);
            return;
          }

          try
          {
            _obj.vfuncCopySessionState(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_client_connection.TlsClientConnection)(cast(void*)source, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.tls_client_connection.TlsClientConnection.vfuncCopySessionState");
          }
        }

        _klass.copySessionState = cast(typeof(_klass.copySessionState))&_vfuncCopySessionStateTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.tls_client_connection.TlsClientConnection]
template TlsClientConnectionGidBuilderT()
{

  /**
      Set `serverIdentity` property.
      Params:
        propval = A #GSocketConnectable describing the identity of the server that
          is expected on the other end of the connection.
          
          If the [gid.gio2.types.TlsCertificateFlags.BadIdentity] flag is set in
          #GTlsClientConnection:validation-flags, this object will be used
          to determine the expected identify of the remote end of the
          connection; if #GTlsClientConnection:server-identity is not set,
          or does not match the identity presented by the server, then the
          [gid.gio2.types.TlsCertificateFlags.BadIdentity] validation will fail.
          
          In addition to its use in verifying the server certificate,
          this is also used to give a hint to the server about what
          certificate we expect, which is useful for servers that serve
          virtual hosts.
      Returns: Builder instance for fluent chaining
  */
  T serverIdentity(gid.gio2.socket_connectable.SocketConnectable propval) nothrow
  {
    return setProperty("server-identity", propval);
  }

  /**
      Set `useSsl3` property.
      Params:
        propval = SSL 3.0 is no longer supported. See
          [gid.gio2.tls_client_connection.TlsClientConnection.setUseSsl3] for details.
      Returns: Builder instance for fluent chaining
  
      Deprecated: SSL 3.0 is insecure.
  */
  T useSsl3(bool propval) nothrow
  {
    return setProperty("use-ssl3", propval);
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
          [gid.gio2.types.TlsCertificateFlags.Expired] if you want to allow expired certificates,
          because this could potentially be the only error flag set even if
          other problems exist with the certificate. Therefore, there is no
          safe way to use this property. This is not a horrible problem,
          though, because you should not be attempting to ignore validation
          errors anyway. If you really must ignore TLS certificate errors,
          connect to #GTlsConnection::accept-certificate.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Do not attempt to ignore validation errors.
  */
  T validationFlags(gid.gio2.types.TlsCertificateFlags propval) nothrow
  {
    return setProperty("validation-flags", propval);
  }
}
