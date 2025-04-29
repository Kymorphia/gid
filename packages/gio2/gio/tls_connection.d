/// Module for [TlsConnection] class
module gio.tls_connection;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.iostream;
import gio.tls_certificate;
import gio.tls_database;
import gio.tls_interaction;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
    [gio.tls_connection.TlsConnection] is the base TLS connection class type, which wraps
    a [gio.iostream.IOStream] and provides TLS encryption on top of it. Its
    subclasses, [gio.tls_client_connection.TlsClientConnection] and
    [gio.tls_server_connection.TlsServerConnection], implement client-side and server-side TLS,
    respectively.
    
    For DTLS (Datagram TLS) support, see [gio.dtls_connection.DtlsConnection].
*/
class TlsConnection : gio.iostream.IOStream
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_tls_connection_get_type != &gidSymbolNotFound ? g_tls_connection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TlsConnection self()
  {
    return this;
  }

  /**
      Get `certificate` property.
      Returns: The connection's certificate; see
      [gio.tls_connection.TlsConnection.setCertificate].
  */
  @property gio.tls_certificate.TlsCertificate certificate()
  {
    return getCertificate();
  }

  /**
      Set `certificate` property.
      Params:
        propval = The connection's certificate; see
        [gio.tls_connection.TlsConnection.setCertificate].
  */
  @property void certificate(gio.tls_certificate.TlsCertificate propval)
  {
    return setCertificate(propval);
  }

  /**
      Get `ciphersuiteName` property.
      Returns: The name of the TLS ciphersuite in use. See [gio.tls_connection.TlsConnection.getCiphersuiteName].
  */
  @property string ciphersuiteName()
  {
    return getCiphersuiteName();
  }

  /**
      Get `database` property.
      Returns: The certificate database to use when verifying this TLS connection.
      If no certificate database is set, then the default database will be
      used. See [gio.tls_backend.TlsBackend.getDefaultDatabase].
      
      When using a non-default database, #GTlsConnection must fall back to using
      the #GTlsDatabase to perform certificate verification using
      [gio.tls_database.TlsDatabase.verifyChain], which means certificate verification will
      not be able to make use of TLS session context. This may be less secure.
      For example, if you create your own #GTlsDatabase that just wraps the
      default #GTlsDatabase, you might expect that you have not changed anything,
      but this is not true because you may have altered the behavior of
      #GTlsConnection by causing it to use [gio.tls_database.TlsDatabase.verifyChain]. See the
      documentation of [gio.tls_database.TlsDatabase.verifyChain] for more details on specific
      security checks that may not be performed. Accordingly, setting a
      non-default database is discouraged except for specialty applications with
      unusual security requirements.
  */
  @property gio.tls_database.TlsDatabase database()
  {
    return getDatabase();
  }

  /**
      Set `database` property.
      Params:
        propval = The certificate database to use when verifying this TLS connection.
        If no certificate database is set, then the default database will be
        used. See [gio.tls_backend.TlsBackend.getDefaultDatabase].
        
        When using a non-default database, #GTlsConnection must fall back to using
        the #GTlsDatabase to perform certificate verification using
        [gio.tls_database.TlsDatabase.verifyChain], which means certificate verification will
        not be able to make use of TLS session context. This may be less secure.
        For example, if you create your own #GTlsDatabase that just wraps the
        default #GTlsDatabase, you might expect that you have not changed anything,
        but this is not true because you may have altered the behavior of
        #GTlsConnection by causing it to use [gio.tls_database.TlsDatabase.verifyChain]. See the
        documentation of [gio.tls_database.TlsDatabase.verifyChain] for more details on specific
        security checks that may not be performed. Accordingly, setting a
        non-default database is discouraged except for specialty applications with
        unusual security requirements.
  */
  @property void database(gio.tls_database.TlsDatabase propval)
  {
    return setDatabase(propval);
  }

  /**
      Get `interaction` property.
      Returns: A #GTlsInteraction object to be used when the connection or certificate
      database need to interact with the user. This will be used to prompt the
      user for passwords where necessary.
  */
  @property gio.tls_interaction.TlsInteraction interaction()
  {
    return getInteraction();
  }

  /**
      Set `interaction` property.
      Params:
        propval = A #GTlsInteraction object to be used when the connection or certificate
        database need to interact with the user. This will be used to prompt the
        user for passwords where necessary.
  */
  @property void interaction(gio.tls_interaction.TlsInteraction propval)
  {
    return setInteraction(propval);
  }

  /**
      Get `negotiatedProtocol` property.
      Returns: The application-layer protocol negotiated during the TLS
      handshake. See [gio.tls_connection.TlsConnection.getNegotiatedProtocol].
  */
  @property string negotiatedProtocol()
  {
    return getNegotiatedProtocol();
  }

  /**
      Get `peerCertificate` property.
      Returns: The connection's peer's certificate, after the TLS handshake has
      completed or failed. Note in particular that this is not yet set
      during the emission of #GTlsConnection::accept-certificate.
      
      (You can watch for a #GObject::notify signal on this property to
      detect when a handshake has occurred.)
  */
  @property gio.tls_certificate.TlsCertificate peerCertificate()
  {
    return getPeerCertificate();
  }

  /**
      Get `peerCertificateErrors` property.
      Returns: The errors noticed while verifying
      #GTlsConnection:peer-certificate. Normally this should be 0, but
      it may not be if #GTlsClientConnection:validation-flags is not
      [gio.types.TlsCertificateFlags.ValidateAll], or if
      #GTlsConnection::accept-certificate overrode the default
      behavior.
      
      GLib guarantees that if certificate verification fails, at least
      one error will be set, but it does not guarantee that all possible
      errors will be set. Accordingly, you may not safely decide to
      ignore any particular type of error. For example, it would be
      incorrect to mask [gio.types.TlsCertificateFlags.Expired] if you want to allow
      expired certificates, because this could potentially be the only
      error flag set even if other problems exist with the certificate.
  */
  @property gio.types.TlsCertificateFlags peerCertificateErrors()
  {
    return getPeerCertificateErrors();
  }

  /**
      Get `protocolVersion` property.
      Returns: The TLS protocol version in use. See [gio.tls_connection.TlsConnection.getProtocolVersion].
  */
  @property gio.types.TlsProtocolVersion protocolVersion()
  {
    return getProtocolVersion();
  }

  /**
      Get `rehandshakeMode` property.
      Returns: The rehandshaking mode. See
      [gio.tls_connection.TlsConnection.setRehandshakeMode].
  
      Deprecated: The rehandshake mode is ignored.
  */
  @property gio.types.TlsRehandshakeMode rehandshakeMode()
  {
    return getRehandshakeMode();
  }

  /**
      Set `rehandshakeMode` property.
      Params:
        propval = The rehandshaking mode. See
        [gio.tls_connection.TlsConnection.setRehandshakeMode].
  
      Deprecated: The rehandshake mode is ignored.
  */
  @property void rehandshakeMode(gio.types.TlsRehandshakeMode propval)
  {
    return setRehandshakeMode(propval);
  }

  /**
      Get `requireCloseNotify` property.
      Returns: Whether or not proper TLS close notification is required.
      See [gio.tls_connection.TlsConnection.setRequireCloseNotify].
  */
  @property bool requireCloseNotify()
  {
    return getRequireCloseNotify();
  }

  /**
      Set `requireCloseNotify` property.
      Params:
        propval = Whether or not proper TLS close notification is required.
        See [gio.tls_connection.TlsConnection.setRequireCloseNotify].
  */
  @property void requireCloseNotify(bool propval)
  {
    return setRequireCloseNotify(propval);
  }

  /**
      Get `useSystemCertdb` property.
      Returns: Whether or not the system certificate database will be used to
      verify peer certificates. See
      [gio.tls_connection.TlsConnection.setUseSystemCertdb].
  
      Deprecated: Use GTlsConnection:database instead
  */
  @property bool useSystemCertdb()
  {
    return getUseSystemCertdb();
  }

  /**
      Set `useSystemCertdb` property.
      Params:
        propval = Whether or not the system certificate database will be used to
        verify peer certificates. See
        [gio.tls_connection.TlsConnection.setUseSystemCertdb].
  
      Deprecated: Use GTlsConnection:database instead
  */
  @property void useSystemCertdb(bool propval)
  {
    return setUseSystemCertdb(propval);
  }

  /**
      Used by #GTlsConnection implementations to emit the
      #GTlsConnection::accept-certificate signal.
  
      Params:
        peerCert = the peer's #GTlsCertificate
        errors = the problems with peer_cert
      Returns: true if one of the signal handlers has returned
            true to accept peer_cert
  */
  bool emitAcceptCertificate(gio.tls_certificate.TlsCertificate peerCert, gio.types.TlsCertificateFlags errors)
  {
    bool _retval;
    _retval = g_tls_connection_emit_accept_certificate(cast(GTlsConnection*)cPtr, peerCert ? cast(GTlsCertificate*)peerCert.cPtr(No.Dup) : null, errors);
    return _retval;
  }

  /**
      Gets conn's certificate, as set by
      [gio.tls_connection.TlsConnection.setCertificate].
      Returns: conn's certificate, or null
  */
  gio.tls_certificate.TlsCertificate getCertificate()
  {
    GTlsCertificate* _cretval;
    _cretval = g_tls_connection_get_certificate(cast(GTlsConnection*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the name of the current TLS ciphersuite, or null if the
      connection has not handshaked or has been closed. Beware that the TLS
      backend may use any of multiple different naming conventions, because
      OpenSSL and GnuTLS have their own ciphersuite naming conventions that
      are different from each other and different from the standard, IANA-
      registered ciphersuite names. The ciphersuite name is intended to be
      displayed to the user for informative purposes only, and parsing it
      is not recommended.
      Returns: The name of the current TLS ciphersuite, or null
  */
  string getCiphersuiteName()
  {
    char* _cretval;
    _cretval = g_tls_connection_get_ciphersuite_name(cast(GTlsConnection*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the certificate database that conn uses to verify
      peer certificates. See [gio.tls_connection.TlsConnection.setDatabase].
      Returns: the certificate database that conn uses or null
  */
  gio.tls_database.TlsDatabase getDatabase()
  {
    GTlsDatabase* _cretval;
    _cretval = g_tls_connection_get_database(cast(GTlsConnection*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gio.tls_database.TlsDatabase)(cast(GTlsDatabase*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the object that will be used to interact with the user. It will be used
      for things like prompting the user for passwords. If null is returned, then
      no user interaction will occur for this connection.
      Returns: The interaction object.
  */
  gio.tls_interaction.TlsInteraction getInteraction()
  {
    GTlsInteraction* _cretval;
    _cretval = g_tls_connection_get_interaction(cast(GTlsConnection*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gio.tls_interaction.TlsInteraction)(cast(GTlsInteraction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the application-layer protocol negotiated during
      the handshake.
      
      If the peer did not use the ALPN extension, or did not advertise a
      protocol that matched one of conn's protocols, or the TLS backend
      does not support ALPN, then this will be null. See
      [gio.tls_connection.TlsConnection.setAdvertisedProtocols].
      Returns: the negotiated protocol, or null
  */
  string getNegotiatedProtocol()
  {
    const(char)* _cretval;
    _cretval = g_tls_connection_get_negotiated_protocol(cast(GTlsConnection*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets conn's peer's certificate after the handshake has completed
      or failed. (It is not set during the emission of
      #GTlsConnection::accept-certificate.)
      Returns: conn's peer's certificate, or null
  */
  gio.tls_certificate.TlsCertificate getPeerCertificate()
  {
    GTlsCertificate* _cretval;
    _cretval = g_tls_connection_get_peer_certificate(cast(GTlsConnection*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the errors associated with validating conn's peer's
      certificate, after the handshake has completed or failed. (It is
      not set during the emission of #GTlsConnection::accept-certificate.)
      
      See #GTlsConnection:peer-certificate-errors for more information.
      Returns: conn's peer's certificate errors
  */
  gio.types.TlsCertificateFlags getPeerCertificateErrors()
  {
    GTlsCertificateFlags _cretval;
    _cretval = g_tls_connection_get_peer_certificate_errors(cast(GTlsConnection*)cPtr);
    gio.types.TlsCertificateFlags _retval = cast(gio.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
      Returns the current TLS protocol version, which may be
      [gio.types.TlsProtocolVersion.Unknown] if the connection has not handshaked, or
      has been closed, or if the TLS backend has implemented a protocol version
      that is not a recognized #GTlsProtocolVersion.
      Returns: The current TLS protocol version
  */
  gio.types.TlsProtocolVersion getProtocolVersion()
  {
    GTlsProtocolVersion _cretval;
    _cretval = g_tls_connection_get_protocol_version(cast(GTlsConnection*)cPtr);
    gio.types.TlsProtocolVersion _retval = cast(gio.types.TlsProtocolVersion)_cretval;
    return _retval;
  }

  /**
      Gets conn rehandshaking mode. See
      [gio.tls_connection.TlsConnection.setRehandshakeMode] for details.
      Returns: [gio.types.TlsRehandshakeMode.Safely]
  
      Deprecated: Changing the rehandshake mode is no longer
          required for compatibility. Also, rehandshaking has been removed
          from the TLS protocol in TLS 1.3.
  */
  gio.types.TlsRehandshakeMode getRehandshakeMode()
  {
    GTlsRehandshakeMode _cretval;
    _cretval = g_tls_connection_get_rehandshake_mode(cast(GTlsConnection*)cPtr);
    gio.types.TlsRehandshakeMode _retval = cast(gio.types.TlsRehandshakeMode)_cretval;
    return _retval;
  }

  /**
      Tests whether or not conn expects a proper TLS close notification
      when the connection is closed. See
      [gio.tls_connection.TlsConnection.setRequireCloseNotify] for details.
      Returns: true if conn requires a proper TLS close
        notification.
  */
  bool getRequireCloseNotify()
  {
    bool _retval;
    _retval = g_tls_connection_get_require_close_notify(cast(GTlsConnection*)cPtr);
    return _retval;
  }

  /**
      Gets whether conn uses the system certificate database to verify
      peer certificates. See [gio.tls_connection.TlsConnection.setUseSystemCertdb].
      Returns: whether conn uses the system certificate database
  
      Deprecated: Use [gio.tls_connection.TlsConnection.getDatabase] instead
  */
  bool getUseSystemCertdb()
  {
    bool _retval;
    _retval = g_tls_connection_get_use_system_certdb(cast(GTlsConnection*)cPtr);
    return _retval;
  }

  /**
      Attempts a TLS handshake on conn.
      
      On the client side, it is never necessary to call this method;
      although the connection needs to perform a handshake after
      connecting (or after sending a "STARTTLS"-type command),
      #GTlsConnection will handle this for you automatically when you try
      to send or receive data on the connection. You can call
      [gio.tls_connection.TlsConnection.handshake] manually if you want to know whether
      the initial handshake succeeded or failed (as opposed to just
      immediately trying to use conn to read or write, in which case,
      if it fails, it may not be possible to tell if it failed before or
      after completing the handshake), but beware that servers may reject
      client authentication after the handshake has completed, so a
      successful handshake does not indicate the connection will be usable.
      
      Likewise, on the server side, although a handshake is necessary at
      the beginning of the communication, you do not need to call this
      function explicitly unless you want clearer error reporting.
      
      Previously, calling [gio.tls_connection.TlsConnection.handshake] after the initial
      handshake would trigger a rehandshake; however, this usage was
      deprecated in GLib 2.60 because rehandshaking was removed from the
      TLS protocol in TLS 1.3. Since GLib 2.64, calling this function after
      the initial handshake will no longer do anything.
      
      When using a #GTlsConnection created by #GSocketClient, the
      #GSocketClient performs the initial handshake, so calling this
      function manually is not recommended.
      
      #GTlsConnection::accept_certificate may be emitted during the
      handshake.
  
      Params:
        cancellable = a #GCancellable, or null
      Returns: success or failure
      Throws: [ErrorWrap]
  */
  bool handshake(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = g_tls_connection_handshake(cast(GTlsConnection*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Asynchronously performs a TLS handshake on conn. See
      [gio.tls_connection.TlsConnection.handshake] for more information.
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the request
        cancellable = a #GCancellable, or null
        callback = callback to call when the handshake is complete
  */
  void handshakeAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap.getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_tls_connection_handshake_async(cast(GTlsConnection*)cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous TLS handshake operation. See
      [gio.tls_connection.TlsConnection.handshake] for more information.
  
      Params:
        result = a #GAsyncResult.
      Returns: true on success, false on failure, in which
        case error will be set.
      Throws: [ErrorWrap]
  */
  bool handshakeFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = g_tls_connection_handshake_finish(cast(GTlsConnection*)cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets the list of application-layer protocols to advertise that the
      caller is willing to speak on this connection. The
      Application-Layer Protocol Negotiation (ALPN) extension will be
      used to negotiate a compatible protocol with the peer; use
      [gio.tls_connection.TlsConnection.getNegotiatedProtocol] to find the negotiated
      protocol after the handshake.  Specifying null for the the value
      of protocols will disable ALPN negotiation.
      
      See [IANA TLS ALPN Protocol IDs](https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml#alpn-protocol-ids)
      for a list of registered protocol IDs.
  
      Params:
        protocols = a null-terminated
            array of ALPN protocol names (eg, "http/1.1", "h2"), or null
  */
  void setAdvertisedProtocols(string[] protocols = null)
  {
    char*[] _tmpprotocols;
    foreach (s; protocols)
      _tmpprotocols ~= s.toCString(No.Alloc);
    _tmpprotocols ~= null;
    const(char*)* _protocols = _tmpprotocols.ptr;
    g_tls_connection_set_advertised_protocols(cast(GTlsConnection*)cPtr, _protocols);
  }

  /**
      This sets the certificate that conn will present to its peer
      during the TLS handshake. For a #GTlsServerConnection, it is
      mandatory to set this, and that will normally be done at construct
      time.
      
      For a #GTlsClientConnection, this is optional. If a handshake fails
      with [gio.types.TlsError.CertificateRequired], that means that the server
      requires a certificate, and if you try connecting again, you should
      call this method first. You can call
      [gio.tls_client_connection.TlsClientConnection.getAcceptedCas] on the failed connection
      to get a list of Certificate Authorities that the server will
      accept certificates from.
      
      (It is also possible that a server will allow the connection with
      or without a certificate; in that case, if you don't provide a
      certificate, you can tell that the server requested one by the fact
      that [gio.tls_client_connection.TlsClientConnection.getAcceptedCas] will return
      non-null.)
  
      Params:
        certificate = the certificate to use for conn
  */
  void setCertificate(gio.tls_certificate.TlsCertificate certificate)
  {
    g_tls_connection_set_certificate(cast(GTlsConnection*)cPtr, certificate ? cast(GTlsCertificate*)certificate.cPtr(No.Dup) : null);
  }

  /**
      Sets the certificate database that is used to verify peer certificates.
      This is set to the default database by default. See
      [gio.tls_backend.TlsBackend.getDefaultDatabase]. If set to null, then
      peer certificate validation will always set the
      [gio.types.TlsCertificateFlags.UnknownCa] error (meaning
      #GTlsConnection::accept-certificate will always be emitted on
      client-side connections, unless that bit is not set in
      #GTlsClientConnection:validation-flags).
      
      There are nonintuitive security implications when using a non-default
      database. See #GTlsConnection:database for details.
  
      Params:
        database = a #GTlsDatabase
  */
  void setDatabase(gio.tls_database.TlsDatabase database = null)
  {
    g_tls_connection_set_database(cast(GTlsConnection*)cPtr, database ? cast(GTlsDatabase*)database.cPtr(No.Dup) : null);
  }

  /**
      Set the object that will be used to interact with the user. It will be used
      for things like prompting the user for passwords.
      
      The interaction argument will normally be a derived subclass of
      #GTlsInteraction. null can also be provided if no user interaction
      should occur for this connection.
  
      Params:
        interaction = an interaction object, or null
  */
  void setInteraction(gio.tls_interaction.TlsInteraction interaction = null)
  {
    g_tls_connection_set_interaction(cast(GTlsConnection*)cPtr, interaction ? cast(GTlsInteraction*)interaction.cPtr(No.Dup) : null);
  }

  /**
      Since GLib 2.64, changing the rehandshake mode is no longer supported
      and will have no effect. With TLS 1.3, rehandshaking has been removed from
      the TLS protocol, replaced by separate post-handshake authentication and
      rekey operations.
  
      Params:
        mode = the rehandshaking mode
  
      Deprecated: Changing the rehandshake mode is no longer
          required for compatibility. Also, rehandshaking has been removed
          from the TLS protocol in TLS 1.3.
  */
  void setRehandshakeMode(gio.types.TlsRehandshakeMode mode)
  {
    g_tls_connection_set_rehandshake_mode(cast(GTlsConnection*)cPtr, mode);
  }

  /**
      Sets whether or not conn expects a proper TLS close notification
      before the connection is closed. If this is true (the default),
      then conn will expect to receive a TLS close notification from its
      peer before the connection is closed, and will return a
      [gio.types.TlsError.Eof] error if the connection is closed without proper
      notification (since this may indicate a network error, or
      man-in-the-middle attack).
      
      In some protocols, the application will know whether or not the
      connection was closed cleanly based on application-level data
      (because the application-level data includes a length field, or is
      somehow self-delimiting); in this case, the close notify is
      redundant and sometimes omitted. (TLS 1.1 explicitly allows this;
      in TLS 1.0 it is technically an error, but often done anyway.) You
      can use [gio.tls_connection.TlsConnection.setRequireCloseNotify] to tell conn
      to allow an "unannounced" connection close, in which case the close
      will show up as a 0-length read, as in a non-TLS
      #GSocketConnection, and it is up to the application to check that
      the data has been fully received.
      
      Note that this only affects the behavior when the peer closes the
      connection; when the application calls [gio.iostream.IOStream.close] itself
      on conn, this will send a close notification regardless of the
      setting of this property. If you explicitly want to do an unclean
      close, you can close conn's #GTlsConnection:base-io-stream rather
      than closing conn itself, but note that this may only be done when no other
      operations are pending on conn or the base I/O stream.
  
      Params:
        requireCloseNotify = whether or not to require close notification
  */
  void setRequireCloseNotify(bool requireCloseNotify)
  {
    g_tls_connection_set_require_close_notify(cast(GTlsConnection*)cPtr, requireCloseNotify);
  }

  /**
      Sets whether conn uses the system certificate database to verify
      peer certificates. This is true by default. If set to false, then
      peer certificate validation will always set the
      [gio.types.TlsCertificateFlags.UnknownCa] error (meaning
      #GTlsConnection::accept-certificate will always be emitted on
      client-side connections, unless that bit is not set in
      #GTlsClientConnection:validation-flags).
  
      Params:
        useSystemCertdb = whether to use the system certificate database
  
      Deprecated: Use [gio.tls_connection.TlsConnection.setDatabase] instead
  */
  void setUseSystemCertdb(bool useSystemCertdb)
  {
    g_tls_connection_set_use_system_certdb(cast(GTlsConnection*)cPtr, useSystemCertdb);
  }

  /**
      Connect to `AcceptCertificate` signal.
  
      Emitted during the TLS handshake after the peer certificate has
      been received. You can examine peer_cert's certification path by
      calling [gio.tls_certificate.TlsCertificate.getIssuer] on it.
      
      For a client-side connection, peer_cert is the server's
      certificate, and the signal will only be emitted if the
      certificate was not acceptable according to conn's
      #GTlsClientConnection:validation_flags. If you would like the
      certificate to be accepted despite errors, return true from the
      signal handler. Otherwise, if no handler accepts the certificate,
      the handshake will fail with [gio.types.TlsError.BadCertificate].
      
      GLib guarantees that if certificate verification fails, this signal
      will be emitted with at least one error will be set in errors, but
      it does not guarantee that all possible errors will be set.
      Accordingly, you may not safely decide to ignore any particular
      type of error. For example, it would be incorrect to ignore
      [gio.types.TlsCertificateFlags.Expired] if you want to allow expired
      certificates, because this could potentially be the only error flag
      set even if other problems exist with the certificate.
      
      For a server-side connection, peer_cert is the certificate
      presented by the client, if this was requested via the server's
      #GTlsServerConnection:authentication_mode. On the server side,
      the signal is always emitted when the client presents a
      certificate, and the certificate will only be accepted if a
      handler returns true.
      
      Note that if this signal is emitted as part of asynchronous I/O
      in the main thread, then you should not attempt to interact with
      the user before returning from the signal handler. If you want to
      let the user decide whether or not to accept the certificate, you
      would have to return false from the signal handler on the first
      attempt, and then after the connection attempt returns a
      [gio.types.TlsError.BadCertificate], you can interact with the user, and
      if the user decides to accept the certificate, remember that fact,
      create a new connection, and return true from the signal handler
      the next time.
      
      If you are doing I/O in another thread, you do not
      need to worry about this, and can simply block in the signal
      handler until the UI thread returns an answer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gio.tls_certificate.TlsCertificate peerCert, gio.types.TlsCertificateFlags errors, gio.tls_connection.TlsConnection tlsConnection))
  
          `peerCert` the peer's #GTlsCertificate (optional)
  
          `errors` the problems with peer_cert. (optional)
  
          `tlsConnection` the instance the signal is connected to (optional)
  
          `Returns` true to accept peer_cert (which will also
          immediately end the signal emission). false to allow the signal
          emission to continue, which will cause the handshake to fail if
          no one else overrides it.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAcceptCertificate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.tls_certificate.TlsCertificate)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gio.types.TlsCertificateFlags)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.tls_connection.TlsConnection)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accept-certificate", closure, after);
  }
}
