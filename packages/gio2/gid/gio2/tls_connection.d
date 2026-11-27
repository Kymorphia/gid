/// Module for [TlsConnection] class
module gid.gio2.tls_connection;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.iostream;
import gid.gio2.tls_certificate;
import gid.gio2.tls_database;
import gid.gio2.tls_interaction;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.tls_connection.TlsConnection] is the base TLS connection class type, which wraps
    a [gid.gio2.iostream.IOStream] and provides TLS encryption on top of it. Its
    subclasses, [gid.gio2.tls_client_connection.TlsClientConnection] and
    [gid.gio2.tls_server_connection.TlsServerConnection], implement client-side and server-side TLS,
    respectively.
    
    For DTLS (Datagram TLS) support, see [gid.gio2.dtls_connection.DtlsConnection].
*/
@gidGir("TlsConnection", "TlsConnectionClass")
class TlsConnection : gid.gio2.iostream.IOStream
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_tls_connection_get_type != &gidSymbolNotFound ? g_tls_connection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GTlsConnection";
  }

  /** Returns `this`, for use in `with` statements. */
  override TlsConnection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.tls_connection.TlsConnection]
      Returns: New builder object
  */
  static TlsConnectionGidBuilder builder() nothrow
  {
    return new TlsConnectionGidBuilder;
  }

  /**
      Get `advertisedProtocols` property.
      Returns: The list of application-layer protocols that the connection
        advertises that it is willing to speak. See
        [gid.gio2.tls_connection.TlsConnection.setAdvertisedProtocols].
  */
  @property string[] advertisedProtocols() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string[])("advertised-protocols");
  }

  /**
      Set `advertisedProtocols` property.
      Params:
        propval = The list of application-layer protocols that the connection
          advertises that it is willing to speak. See
          [gid.gio2.tls_connection.TlsConnection.setAdvertisedProtocols].
  */
  @property void advertisedProtocols(string[] propval) nothrow
  {
    setAdvertisedProtocols(propval);
  }

  /**
      Get `baseIoStream` property.
      Returns: The #GIOStream that the connection wraps. The connection holds a reference
        to this stream, and may run operations on the stream from other threads
        throughout its lifetime. Consequently, after the #GIOStream has been
        constructed, application code may only run its own operations on this
        stream when no #GIOStream operations are running.
  */
  @property gid.gio2.iostream.IOStream baseIoStream() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.iostream.IOStream)("base-io-stream");
  }

  /**
      Get `certificate` property.
      Returns: The connection's certificate; see
        [gid.gio2.tls_connection.TlsConnection.setCertificate].
  */
  @property gid.gio2.tls_certificate.TlsCertificate certificate() nothrow
  {
    return getCertificate();
  }

  /**
      Set `certificate` property.
      Params:
        propval = The connection's certificate; see
          [gid.gio2.tls_connection.TlsConnection.setCertificate].
  */
  @property void certificate(gid.gio2.tls_certificate.TlsCertificate propval) nothrow
  {
    setCertificate(propval);
  }

  /**
      Get `ciphersuiteName` property.
      Returns: The name of the TLS ciphersuite in use. See [gid.gio2.tls_connection.TlsConnection.getCiphersuiteName].
  */
  @property string ciphersuiteName() nothrow
  {
    return getCiphersuiteName();
  }

  /**
      Get `database` property.
      Returns: The certificate database to use when verifying this TLS connection.
        If no certificate database is set, then the default database will be
        used. See [gid.gio2.tls_backend.TlsBackend.getDefaultDatabase].
        
        When using a non-default database, #GTlsConnection must fall back to using
        the #GTlsDatabase to perform certificate verification using
        [gid.gio2.tls_database.TlsDatabase.verifyChain], which means certificate verification will
        not be able to make use of TLS session context. This may be less secure.
        For example, if you create your own #GTlsDatabase that just wraps the
        default #GTlsDatabase, you might expect that you have not changed anything,
        but this is not true because you may have altered the behavior of
        #GTlsConnection by causing it to use [gid.gio2.tls_database.TlsDatabase.verifyChain]. See the
        documentation of [gid.gio2.tls_database.TlsDatabase.verifyChain] for more details on specific
        security checks that may not be performed. Accordingly, setting a
        non-default database is discouraged except for specialty applications with
        unusual security requirements.
  */
  @property gid.gio2.tls_database.TlsDatabase database() nothrow
  {
    return getDatabase();
  }

  /**
      Set `database` property.
      Params:
        propval = The certificate database to use when verifying this TLS connection.
          If no certificate database is set, then the default database will be
          used. See [gid.gio2.tls_backend.TlsBackend.getDefaultDatabase].
          
          When using a non-default database, #GTlsConnection must fall back to using
          the #GTlsDatabase to perform certificate verification using
          [gid.gio2.tls_database.TlsDatabase.verifyChain], which means certificate verification will
          not be able to make use of TLS session context. This may be less secure.
          For example, if you create your own #GTlsDatabase that just wraps the
          default #GTlsDatabase, you might expect that you have not changed anything,
          but this is not true because you may have altered the behavior of
          #GTlsConnection by causing it to use [gid.gio2.tls_database.TlsDatabase.verifyChain]. See the
          documentation of [gid.gio2.tls_database.TlsDatabase.verifyChain] for more details on specific
          security checks that may not be performed. Accordingly, setting a
          non-default database is discouraged except for specialty applications with
          unusual security requirements.
  */
  @property void database(gid.gio2.tls_database.TlsDatabase propval) nothrow
  {
    setDatabase(propval);
  }

  /**
      Get `interaction` property.
      Returns: A #GTlsInteraction object to be used when the connection or certificate
        database need to interact with the user. This will be used to prompt the
        user for passwords where necessary.
  */
  @property gid.gio2.tls_interaction.TlsInteraction interaction() nothrow
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
  @property void interaction(gid.gio2.tls_interaction.TlsInteraction propval) nothrow
  {
    setInteraction(propval);
  }

  /**
      Get `negotiatedProtocol` property.
      Returns: The application-layer protocol negotiated during the TLS
        handshake. See [gid.gio2.tls_connection.TlsConnection.getNegotiatedProtocol].
  */
  @property string negotiatedProtocol() nothrow
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
  @property gid.gio2.tls_certificate.TlsCertificate peerCertificate() nothrow
  {
    return getPeerCertificate();
  }

  /**
      Get `peerCertificateErrors` property.
      Returns: The errors noticed while verifying
        #GTlsConnection:peer-certificate. Normally this should be 0, but
        it may not be if #GTlsClientConnection:validation-flags is not
        [gid.gio2.types.TlsCertificateFlags.ValidateAll], or if
        #GTlsConnection::accept-certificate overrode the default
        behavior.
        
        GLib guarantees that if certificate verification fails, at least
        one error will be set, but it does not guarantee that all possible
        errors will be set. Accordingly, you may not safely decide to
        ignore any particular type of error. For example, it would be
        incorrect to mask [gid.gio2.types.TlsCertificateFlags.Expired] if you want to allow
        expired certificates, because this could potentially be the only
        error flag set even if other problems exist with the certificate.
  */
  @property gid.gio2.types.TlsCertificateFlags peerCertificateErrors() nothrow
  {
    return getPeerCertificateErrors();
  }

  /**
      Get `protocolVersion` property.
      Returns: The TLS protocol version in use. See [gid.gio2.tls_connection.TlsConnection.getProtocolVersion].
  */
  @property gid.gio2.types.TlsProtocolVersion protocolVersion() nothrow
  {
    return getProtocolVersion();
  }

  /**
      Get `rehandshakeMode` property.
      Returns: The rehandshaking mode. See
        [gid.gio2.tls_connection.TlsConnection.setRehandshakeMode].
  
      Deprecated: The rehandshake mode is ignored.
  */
  @property gid.gio2.types.TlsRehandshakeMode rehandshakeMode() nothrow
  {
    return getRehandshakeMode();
  }

  /**
      Set `rehandshakeMode` property.
      Params:
        propval = The rehandshaking mode. See
          [gid.gio2.tls_connection.TlsConnection.setRehandshakeMode].
  
      Deprecated: The rehandshake mode is ignored.
  */
  @property void rehandshakeMode(gid.gio2.types.TlsRehandshakeMode propval) nothrow
  {
    setRehandshakeMode(propval);
  }

  /**
      Get `requireCloseNotify` property.
      Returns: Whether or not proper TLS close notification is required.
        See [gid.gio2.tls_connection.TlsConnection.setRequireCloseNotify].
  */
  @property bool requireCloseNotify() nothrow
  {
    return getRequireCloseNotify();
  }

  /**
      Set `requireCloseNotify` property.
      Params:
        propval = Whether or not proper TLS close notification is required.
          See [gid.gio2.tls_connection.TlsConnection.setRequireCloseNotify].
  */
  @property void requireCloseNotify(bool propval) nothrow
  {
    setRequireCloseNotify(propval);
  }

  /**
      Get `useSystemCertdb` property.
      Returns: Whether or not the system certificate database will be used to
        verify peer certificates. See
        [gid.gio2.tls_connection.TlsConnection.setUseSystemCertdb].
  
      Deprecated: Use GTlsConnection:database instead
  */
  @property bool useSystemCertdb() nothrow
  {
    return getUseSystemCertdb();
  }

  /**
      Set `useSystemCertdb` property.
      Params:
        propval = Whether or not the system certificate database will be used to
          verify peer certificates. See
          [gid.gio2.tls_connection.TlsConnection.setUseSystemCertdb].
  
      Deprecated: Use GTlsConnection:database instead
  */
  @property void useSystemCertdb(bool propval) nothrow
  {
    setUseSystemCertdb(propval);
  }

  /**
      Check whether to accept a certificate.
  
      Params:
        peerCert = 
        errors = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAcceptCertificate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncAcceptCertificate(gid.gio2.tls_certificate.TlsCertificate peerCert, gid.gio2.types.TlsCertificateFlags errors)
  {
    auto _klass = cast(GTlsConnectionClass*)_vfuncClass;
    if (!_klass.acceptCertificate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.acceptCertificate(cast(GTlsConnection*)this._cPtr, peerCert ? cast(GTlsCertificate*)peerCert._cPtr(No.Dup) : null, errors);
    return _retval;
  }

  /**
      Retrieve TLS channel binding data (Since: 2.66)
  
      Params:
        type = 
        data = 
      Returns: 
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetBindingData` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGetBindingData(gid.gio2.types.TlsChannelBindingType type, ubyte[] data)
  {
    auto _klass = cast(GTlsConnectionClass*)_vfuncClass;
    if (!_klass.getBindingData)
      return typeof(return).init;

    bool _retval;
    auto _data = gByteArrayFromD(data);
    scope(exit) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_data);
    GError *_err;
    _retval = cast(bool)_klass.getBindingData(cast(GTlsConnection*)this._cPtr, type, _data, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the name of the application-layer protocol negotiated during
      the handshake.
      
      If the peer did not use the ALPN extension, or did not advertise a
      protocol that matched one of conn's protocols, or the TLS backend
      does not support ALPN, then this will be null. See
      [gid.gio2.tls_connection.TlsConnection.setAdvertisedProtocols].
      Returns: the negotiated protocol, or null
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetNegotiatedProtocol` to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  protected string vfuncGetNegotiatedProtocol()
  {
    auto _klass = cast(GTlsConnectionClass*)_vfuncClass;
    if (!_klass.getNegotiatedProtocol)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getNegotiatedProtocol(cast(GTlsConnection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Attempts a TLS handshake on conn.
      
      On the client side, it is never necessary to call this method;
      although the connection needs to perform a handshake after
      connecting (or after sending a "STARTTLS"-type command),
      #GTlsConnection will handle this for you automatically when you try
      to send or receive data on the connection. You can call
      [gid.gio2.tls_connection.TlsConnection.handshake] manually if you want to know whether
      the initial handshake succeeded or failed (as opposed to just
      immediately trying to use conn to read or write, in which case,
      if it fails, it may not be possible to tell if it failed before or
      after completing the handshake), but beware that servers may reject
      client authentication after the handshake has completed, so a
      successful handshake does not indicate the connection will be usable.
      
      Likewise, on the server side, although a handshake is necessary at
      the beginning of the communication, you do not need to call this
      function explicitly unless you want clearer error reporting.
      
      Previously, calling [gid.gio2.tls_connection.TlsConnection.handshake] after the initial
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandshake` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncHandshake(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GTlsConnectionClass*)_vfuncClass;
    if (!_klass.handshake)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.handshake(cast(GTlsConnection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously performs a TLS handshake on conn. See
      [gid.gio2.tls_connection.TlsConnection.handshake] for more information.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = a #GCancellable, or null
        callback = callback to call when the handshake is complete
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandshakeAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncHandshakeAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GTlsConnectionClass*)_vfuncClass;
    if (!_klass.handshakeAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.handshakeAsync(cast(GTlsConnection*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous TLS handshake operation. See
      [gid.gio2.tls_connection.TlsConnection.handshake] for more information.
  
      Params:
        result = a #GAsyncResult.
      Returns: true on success, false on failure, in which
        case error will be set.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHandshakeFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncHandshakeFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GTlsConnectionClass*)_vfuncClass;
    if (!_klass.handshakeFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.handshakeFinish(cast(GTlsConnection*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
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
  bool emitAcceptCertificate(gid.gio2.tls_certificate.TlsCertificate peerCert, gid.gio2.types.TlsCertificateFlags errors) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_tls_connection_emit_accept_certificate(cast(GTlsConnection*)this._cPtr, peerCert ? cast(GTlsCertificate*)peerCert._cPtr(No.Dup) : null, errors);
    return _retval;
  }

  /**
      Gets conn's certificate, as set by
      [gid.gio2.tls_connection.TlsConnection.setCertificate].
      Returns: conn's certificate, or null
  */
  gid.gio2.tls_certificate.TlsCertificate getCertificate() nothrow
  {
    GTlsCertificate* _cretval;
    _cretval = g_tls_connection_get_certificate(cast(GTlsConnection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Query the TLS backend for TLS channel binding data of type for conn.
      
      This call retrieves TLS channel binding data as specified in RFC
      [5056](https://tools.ietf.org/html/rfc5056), RFC
      [5929](https://tools.ietf.org/html/rfc5929), and related RFCs.  The
      binding data is returned in data.  The data is resized by the callee
      using #GByteArray buffer management and will be freed when the data
      is destroyed by [gid.glib2.byte_array.ByteArray.unref]. If data is null, it will only
      check whether TLS backend is able to fetch the data (e.g. whether type
      is supported by the TLS backend). It does not guarantee that the data
      will be available though.  That could happen if TLS connection does not
      support type or the binding data is not available yet due to additional
      negotiation or input required.
  
      Params:
        type = #GTlsChannelBindingType type of data to fetch
        data = #GByteArray is
                 filled with the binding data, or null
      Returns: true on success, false otherwise
      Throws: [ErrorWrap]
  */
  bool getChannelBindingData(gid.gio2.types.TlsChannelBindingType type, ref ubyte[] data)
  {
    bool _retval;
    auto _data = gByteArrayFromD(data);
    scope(failure) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_data);
    GError *_err;
    _retval = cast(bool)g_tls_connection_get_channel_binding_data(cast(GTlsConnection*)this._cPtr, type, _data, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    data = gByteArrayToD!(GidOwnership.Full)(_data);
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
  string getCiphersuiteName() nothrow
  {
    char* _cretval;
    _cretval = g_tls_connection_get_ciphersuite_name(cast(GTlsConnection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the certificate database that conn uses to verify
      peer certificates. See [gid.gio2.tls_connection.TlsConnection.setDatabase].
      Returns: the certificate database that conn uses or null
  */
  gid.gio2.tls_database.TlsDatabase getDatabase() nothrow
  {
    GTlsDatabase* _cretval;
    _cretval = g_tls_connection_get_database(cast(GTlsConnection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_database.TlsDatabase)(cast(GTlsDatabase*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the object that will be used to interact with the user. It will be used
      for things like prompting the user for passwords. If null is returned, then
      no user interaction will occur for this connection.
      Returns: The interaction object.
  */
  gid.gio2.tls_interaction.TlsInteraction getInteraction() nothrow
  {
    GTlsInteraction* _cretval;
    _cretval = g_tls_connection_get_interaction(cast(GTlsConnection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_interaction.TlsInteraction)(cast(GTlsInteraction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the application-layer protocol negotiated during
      the handshake.
      
      If the peer did not use the ALPN extension, or did not advertise a
      protocol that matched one of conn's protocols, or the TLS backend
      does not support ALPN, then this will be null. See
      [gid.gio2.tls_connection.TlsConnection.setAdvertisedProtocols].
      Returns: the negotiated protocol, or null
  */
  string getNegotiatedProtocol() nothrow
  {
    const(char)* _cretval;
    _cretval = g_tls_connection_get_negotiated_protocol(cast(GTlsConnection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets conn's peer's certificate after the handshake has completed
      or failed. (It is not set during the emission of
      #GTlsConnection::accept-certificate.)
      Returns: conn's peer's certificate, or null
  */
  gid.gio2.tls_certificate.TlsCertificate getPeerCertificate() nothrow
  {
    GTlsCertificate* _cretval;
    _cretval = g_tls_connection_get_peer_certificate(cast(GTlsConnection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the errors associated with validating conn's peer's
      certificate, after the handshake has completed or failed. (It is
      not set during the emission of #GTlsConnection::accept-certificate.)
      
      See #GTlsConnection:peer-certificate-errors for more information.
      Returns: conn's peer's certificate errors
  */
  gid.gio2.types.TlsCertificateFlags getPeerCertificateErrors() nothrow
  {
    GTlsCertificateFlags _cretval;
    _cretval = g_tls_connection_get_peer_certificate_errors(cast(GTlsConnection*)this._cPtr);
    gid.gio2.types.TlsCertificateFlags _retval = cast(gid.gio2.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
      Returns the current TLS protocol version, which may be
      [gid.gio2.types.TlsProtocolVersion.Unknown] if the connection has not handshaked, or
      has been closed, or if the TLS backend has implemented a protocol version
      that is not a recognized #GTlsProtocolVersion.
      Returns: The current TLS protocol version
  */
  gid.gio2.types.TlsProtocolVersion getProtocolVersion() nothrow
  {
    GTlsProtocolVersion _cretval;
    _cretval = g_tls_connection_get_protocol_version(cast(GTlsConnection*)this._cPtr);
    gid.gio2.types.TlsProtocolVersion _retval = cast(gid.gio2.types.TlsProtocolVersion)_cretval;
    return _retval;
  }

  /**
      Gets conn rehandshaking mode. See
      [gid.gio2.tls_connection.TlsConnection.setRehandshakeMode] for details.
      Returns: [gid.gio2.types.TlsRehandshakeMode.Safely]
  
      Deprecated: Changing the rehandshake mode is no longer
          required for compatibility. Also, rehandshaking has been removed
          from the TLS protocol in TLS 1.3.
  */
  gid.gio2.types.TlsRehandshakeMode getRehandshakeMode() nothrow
  {
    GTlsRehandshakeMode _cretval;
    _cretval = g_tls_connection_get_rehandshake_mode(cast(GTlsConnection*)this._cPtr);
    gid.gio2.types.TlsRehandshakeMode _retval = cast(gid.gio2.types.TlsRehandshakeMode)_cretval;
    return _retval;
  }

  /**
      Tests whether or not conn expects a proper TLS close notification
      when the connection is closed. See
      [gid.gio2.tls_connection.TlsConnection.setRequireCloseNotify] for details.
      Returns: true if conn requires a proper TLS close
        notification.
  */
  bool getRequireCloseNotify() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_tls_connection_get_require_close_notify(cast(GTlsConnection*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether conn uses the system certificate database to verify
      peer certificates. See [gid.gio2.tls_connection.TlsConnection.setUseSystemCertdb].
      Returns: whether conn uses the system certificate database
  
      Deprecated: Use [gid.gio2.tls_connection.TlsConnection.getDatabase] instead
  */
  bool getUseSystemCertdb() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_tls_connection_get_use_system_certdb(cast(GTlsConnection*)this._cPtr);
    return _retval;
  }

  /**
      Attempts a TLS handshake on conn.
      
      On the client side, it is never necessary to call this method;
      although the connection needs to perform a handshake after
      connecting (or after sending a "STARTTLS"-type command),
      #GTlsConnection will handle this for you automatically when you try
      to send or receive data on the connection. You can call
      [gid.gio2.tls_connection.TlsConnection.handshake] manually if you want to know whether
      the initial handshake succeeded or failed (as opposed to just
      immediately trying to use conn to read or write, in which case,
      if it fails, it may not be possible to tell if it failed before or
      after completing the handshake), but beware that servers may reject
      client authentication after the handshake has completed, so a
      successful handshake does not indicate the connection will be usable.
      
      Likewise, on the server side, although a handshake is necessary at
      the beginning of the communication, you do not need to call this
      function explicitly unless you want clearer error reporting.
      
      Previously, calling [gid.gio2.tls_connection.TlsConnection.handshake] after the initial
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
  bool handshake(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_tls_connection_handshake(cast(GTlsConnection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously performs a TLS handshake on conn. See
      [gid.gio2.tls_connection.TlsConnection.handshake] for more information.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the request
        cancellable = a #GCancellable, or null
        callback = callback to call when the handshake is complete
  */
  void handshakeAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_tls_connection_handshake_async(cast(GTlsConnection*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous TLS handshake operation. See
      [gid.gio2.tls_connection.TlsConnection.handshake] for more information.
  
      Params:
        result = a #GAsyncResult.
      Returns: true on success, false on failure, in which
        case error will be set.
      Throws: [ErrorWrap]
  */
  bool handshakeFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_tls_connection_handshake_finish(cast(GTlsConnection*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the list of application-layer protocols to advertise that the
      caller is willing to speak on this connection. The
      Application-Layer Protocol Negotiation (ALPN) extension will be
      used to negotiate a compatible protocol with the peer; use
      [gid.gio2.tls_connection.TlsConnection.getNegotiatedProtocol] to find the negotiated
      protocol after the handshake.  Specifying null for the the value
      of protocols will disable ALPN negotiation.
      
      See [IANA TLS ALPN Protocol IDs](https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml#alpn-protocol-ids)
      for a list of registered protocol IDs.
  
      Params:
        protocols = a null-terminated
            array of ALPN protocol names (eg, "http/1.1", "h2"), or null
  */
  void setAdvertisedProtocols(string[] protocols = null) nothrow
  {
    auto _protocols_arr = new char*[](protocols.length + 1);
    auto _protocols = cast(char**)_protocols_arr.ptr;
    foreach (i, s; protocols) _protocols[i] = s.toCString!(No.Malloc);
    g_tls_connection_set_advertised_protocols(cast(GTlsConnection*)this._cPtr, _protocols);
  }

  /**
      This sets the certificate that conn will present to its peer
      during the TLS handshake. For a #GTlsServerConnection, it is
      mandatory to set this, and that will normally be done at construct
      time.
      
      For a #GTlsClientConnection, this is optional. If a handshake fails
      with [gid.gio2.types.TlsError.CertificateRequired], that means that the server
      requires a certificate, and if you try connecting again, you should
      call this method first. You can call
      [gid.gio2.tls_client_connection.TlsClientConnection.getAcceptedCas] on the failed connection
      to get a list of Certificate Authorities that the server will
      accept certificates from.
      
      (It is also possible that a server will allow the connection with
      or without a certificate; in that case, if you don't provide a
      certificate, you can tell that the server requested one by the fact
      that [gid.gio2.tls_client_connection.TlsClientConnection.getAcceptedCas] will return
      non-null.)
  
      Params:
        certificate = the certificate to use for conn
  */
  void setCertificate(gid.gio2.tls_certificate.TlsCertificate certificate) nothrow
  {
    g_tls_connection_set_certificate(cast(GTlsConnection*)this._cPtr, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null);
  }

  /**
      Sets the certificate database that is used to verify peer certificates.
      This is set to the default database by default. See
      [gid.gio2.tls_backend.TlsBackend.getDefaultDatabase]. If set to null, then
      peer certificate validation will always set the
      [gid.gio2.types.TlsCertificateFlags.UnknownCa] error (meaning
      #GTlsConnection::accept-certificate will always be emitted on
      client-side connections, unless that bit is not set in
      #GTlsClientConnection:validation-flags).
      
      There are nonintuitive security implications when using a non-default
      database. See #GTlsConnection:database for details.
  
      Params:
        database = a #GTlsDatabase
  */
  void setDatabase(gid.gio2.tls_database.TlsDatabase database = null) nothrow
  {
    g_tls_connection_set_database(cast(GTlsConnection*)this._cPtr, database ? cast(GTlsDatabase*)database._cPtr(No.Dup) : null);
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
  void setInteraction(gid.gio2.tls_interaction.TlsInteraction interaction = null) nothrow
  {
    g_tls_connection_set_interaction(cast(GTlsConnection*)this._cPtr, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null);
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
  void setRehandshakeMode(gid.gio2.types.TlsRehandshakeMode mode) nothrow
  {
    g_tls_connection_set_rehandshake_mode(cast(GTlsConnection*)this._cPtr, mode);
  }

  /**
      Sets whether or not conn expects a proper TLS close notification
      before the connection is closed. If this is true (the default),
      then conn will expect to receive a TLS close notification from its
      peer before the connection is closed, and will return a
      [gid.gio2.types.TlsError.Eof] error if the connection is closed without proper
      notification (since this may indicate a network error, or
      man-in-the-middle attack).
      
      In some protocols, the application will know whether or not the
      connection was closed cleanly based on application-level data
      (because the application-level data includes a length field, or is
      somehow self-delimiting); in this case, the close notify is
      redundant and sometimes omitted. (TLS 1.1 explicitly allows this;
      in TLS 1.0 it is technically an error, but often done anyway.) You
      can use [gid.gio2.tls_connection.TlsConnection.setRequireCloseNotify] to tell conn
      to allow an "unannounced" connection close, in which case the close
      will show up as a 0-length read, as in a non-TLS
      #GSocketConnection, and it is up to the application to check that
      the data has been fully received.
      
      Note that this only affects the behavior when the peer closes the
      connection; when the application calls [gid.gio2.iostream.IOStream.close] itself
      on conn, this will send a close notification regardless of the
      setting of this property. If you explicitly want to do an unclean
      close, you can close conn's #GTlsConnection:base-io-stream rather
      than closing conn itself, but note that this may only be done when no other
      operations are pending on conn or the base I/O stream.
  
      Params:
        requireCloseNotify = whether or not to require close notification
  */
  void setRequireCloseNotify(bool requireCloseNotify) nothrow
  {
    g_tls_connection_set_require_close_notify(cast(GTlsConnection*)this._cPtr, requireCloseNotify);
  }

  /**
      Sets whether conn uses the system certificate database to verify
      peer certificates. This is true by default. If set to false, then
      peer certificate validation will always set the
      [gid.gio2.types.TlsCertificateFlags.UnknownCa] error (meaning
      #GTlsConnection::accept-certificate will always be emitted on
      client-side connections, unless that bit is not set in
      #GTlsClientConnection:validation-flags).
  
      Params:
        useSystemCertdb = whether to use the system certificate database
  
      Deprecated: Use [gid.gio2.tls_connection.TlsConnection.setDatabase] instead
  */
  void setUseSystemCertdb(bool useSystemCertdb) nothrow
  {
    g_tls_connection_set_use_system_certdb(cast(GTlsConnection*)this._cPtr, useSystemCertdb);
  }

  /**
      Connect to `AcceptCertificate` signal.
  
      Emitted during the TLS handshake after the peer certificate has
        been received. You can examine peer_cert's certification path by
        calling [gid.gio2.tls_certificate.TlsCertificate.getIssuer] on it.
        
        For a client-side connection, peer_cert is the server's
        certificate, and the signal will only be emitted if the
        certificate was not acceptable according to conn's
        #GTlsClientConnection:validation_flags. If you would like the
        certificate to be accepted despite errors, return true from the
        signal handler. Otherwise, if no handler accepts the certificate,
        the handshake will fail with [gid.gio2.types.TlsError.BadCertificate].
        
        GLib guarantees that if certificate verification fails, this signal
        will be emitted with at least one error will be set in errors, but
        it does not guarantee that all possible errors will be set.
        Accordingly, you may not safely decide to ignore any particular
        type of error. For example, it would be incorrect to ignore
        [gid.gio2.types.TlsCertificateFlags.Expired] if you want to allow expired
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
        [gid.gio2.types.TlsError.BadCertificate], you can interact with the user, and
        if the user decides to accept the certificate, remember that fact,
        create a new connection, and return true from the signal handler
        the next time.
        
        If you are doing I/O in another thread, you do not
        need to worry about this, and can simply block in the signal
        handler until the UI thread returns an answer.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gio2.tls_certificate.TlsCertificate peerCert, gid.gio2.types.TlsCertificateFlags errors, gid.gio2.tls_connection.TlsConnection tlsConnection)`
  
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
  gulong connectAcceptCertificate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.tls_certificate.TlsCertificate)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gio2.types.TlsCertificateFlags)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.tls_connection.TlsConnection)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.tls_connection.TlsConnection.acceptCertificate");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accept-certificate", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TlsConnection
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.tls_connection.TlsConnection), T.stringof ~ " is not derived from gid.gio2.tls_connection.TlsConnection");

    gid.gio2.iostream.IOStream._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAcceptCertificate", true)[0]) == gid.gio2.tls_connection.TlsConnection))
      _installVfunc(klass, "accept_certificate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetBindingData", true)[0]) == gid.gio2.tls_connection.TlsConnection))
      _installVfunc(klass, "get_binding_data");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetNegotiatedProtocol", true)[0]) == gid.gio2.tls_connection.TlsConnection))
      static assert(0, "Overriding gid.gio2.tls_connection.TlsConnection.vfuncGetNegotiatedProtocol is not supported: callback string return value with transfer none is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandshake", true)[0]) == gid.gio2.tls_connection.TlsConnection))
      _installVfunc(klass, "handshake");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandshakeAsync", true)[0]) == gid.gio2.tls_connection.TlsConnection))
      static assert(0, "Overriding gid.gio2.tls_connection.TlsConnection.vfuncHandshakeAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHandshakeFinish", true)[0]) == gid.gio2.tls_connection.TlsConnection))
      _installVfunc(klass, "handshake_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GTlsConnectionClass*)klass;

    switch (vfunc)
    {
      case "accept_certificate":
      {
        static extern(C) gboolean _vfuncAcceptCertificateTramp(GTlsConnection* connection, GTlsCertificate* peerCert, GTlsCertificateFlags errors) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_connection.TlsConnection)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)connection);
          if (!_obj)
          {
            auto _klass = cast(GTlsConnectionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)connection);
            if (_klass.acceptCertificate)
              return (cast(typeof(&_vfuncAcceptCertificateTramp))_klass.acceptCertificate)(connection, peerCert, errors);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncAcceptCertificate(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(void*)peerCert, No.Take), errors);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.tls_connection.TlsConnection.vfuncAcceptCertificate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.acceptCertificate = cast(typeof(_klass.acceptCertificate))&_vfuncAcceptCertificateTramp;
        break;
      }
      case "get_binding_data":
      {
        static extern(C) gboolean _vfuncGetBindingDataTramp(GTlsConnection* conn, GTlsChannelBindingType type, GByteArray* data, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_connection.TlsConnection)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)conn);
          if (!_obj)
          {
            auto _klass = cast(GTlsConnectionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)conn);
            if (_klass.getBindingData)
              return (cast(typeof(&_vfuncGetBindingDataTramp))_klass.getBindingData)(conn, type, data, _err);
            return typeof(return).init;
          }

          bool _dretval;
          auto _data = gByteArrayToD!(GidOwnership.None)(data);

          try
          {
            _dretval = _obj.vfuncGetBindingData(type, _data);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getBindingData = cast(typeof(_klass.getBindingData))&_vfuncGetBindingDataTramp;
        break;
      }
      case "handshake":
      {
        static extern(C) gboolean _vfuncHandshakeTramp(GTlsConnection* conn, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_connection.TlsConnection)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)conn);
          if (!_obj)
          {
            auto _klass = cast(GTlsConnectionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)conn);
            if (_klass.handshake)
              return (cast(typeof(&_vfuncHandshakeTramp))_klass.handshake)(conn, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncHandshake(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.handshake = cast(typeof(_klass.handshake))&_vfuncHandshakeTramp;
        break;
      }
      case "handshake_finish":
      {
        static extern(C) gboolean _vfuncHandshakeFinishTramp(GTlsConnection* conn, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_connection.TlsConnection)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)conn);
          if (!_obj)
          {
            auto _klass = cast(GTlsConnectionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)conn);
            if (_klass.handshakeFinish)
              return (cast(typeof(&_vfuncHandshakeFinishTramp))_klass.handshakeFinish)(conn, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncHandshakeFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.handshakeFinish = cast(typeof(_klass.handshakeFinish))&_vfuncHandshakeFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.tls_connection.TlsConnection]
class TlsConnectionGidBuilderImpl(T) : gid.gio2.iostream.IOStreamGidBuilderImpl!T
{

  /**
      Set `advertisedProtocols` property.
      Params:
        propval = The list of application-layer protocols that the connection
          advertises that it is willing to speak. See
          [gid.gio2.tls_connection.TlsConnection.setAdvertisedProtocols].
      Returns: Builder instance for fluent chaining
  */
  T advertisedProtocols(string[] propval) nothrow
  {
    return setProperty("advertised-protocols", propval);
  }

  /**
      Set `baseIoStream` property.
      Params:
        propval = The #GIOStream that the connection wraps. The connection holds a reference
          to this stream, and may run operations on the stream from other threads
          throughout its lifetime. Consequently, after the #GIOStream has been
          constructed, application code may only run its own operations on this
          stream when no #GIOStream operations are running.
      Returns: Builder instance for fluent chaining
  */
  T baseIoStream(gid.gio2.iostream.IOStream propval) nothrow
  {
    return setProperty("base-io-stream", propval);
  }

  /**
      Set `certificate` property.
      Params:
        propval = The connection's certificate; see
          [gid.gio2.tls_connection.TlsConnection.setCertificate].
      Returns: Builder instance for fluent chaining
  */
  T certificate(gid.gio2.tls_certificate.TlsCertificate propval) nothrow
  {
    return setProperty("certificate", propval);
  }

  /**
      Set `database` property.
      Params:
        propval = The certificate database to use when verifying this TLS connection.
          If no certificate database is set, then the default database will be
          used. See [gid.gio2.tls_backend.TlsBackend.getDefaultDatabase].
          
          When using a non-default database, #GTlsConnection must fall back to using
          the #GTlsDatabase to perform certificate verification using
          [gid.gio2.tls_database.TlsDatabase.verifyChain], which means certificate verification will
          not be able to make use of TLS session context. This may be less secure.
          For example, if you create your own #GTlsDatabase that just wraps the
          default #GTlsDatabase, you might expect that you have not changed anything,
          but this is not true because you may have altered the behavior of
          #GTlsConnection by causing it to use [gid.gio2.tls_database.TlsDatabase.verifyChain]. See the
          documentation of [gid.gio2.tls_database.TlsDatabase.verifyChain] for more details on specific
          security checks that may not be performed. Accordingly, setting a
          non-default database is discouraged except for specialty applications with
          unusual security requirements.
      Returns: Builder instance for fluent chaining
  */
  T database(gid.gio2.tls_database.TlsDatabase propval) nothrow
  {
    return setProperty("database", propval);
  }

  /**
      Set `interaction` property.
      Params:
        propval = A #GTlsInteraction object to be used when the connection or certificate
          database need to interact with the user. This will be used to prompt the
          user for passwords where necessary.
      Returns: Builder instance for fluent chaining
  */
  T interaction(gid.gio2.tls_interaction.TlsInteraction propval) nothrow
  {
    return setProperty("interaction", propval);
  }

  /**
      Set `rehandshakeMode` property.
      Params:
        propval = The rehandshaking mode. See
          [gid.gio2.tls_connection.TlsConnection.setRehandshakeMode].
      Returns: Builder instance for fluent chaining
  
      Deprecated: The rehandshake mode is ignored.
  */
  T rehandshakeMode(gid.gio2.types.TlsRehandshakeMode propval) nothrow
  {
    return setProperty("rehandshake-mode", propval);
  }

  /**
      Set `requireCloseNotify` property.
      Params:
        propval = Whether or not proper TLS close notification is required.
          See [gid.gio2.tls_connection.TlsConnection.setRequireCloseNotify].
      Returns: Builder instance for fluent chaining
  */
  T requireCloseNotify(bool propval) nothrow
  {
    return setProperty("require-close-notify", propval);
  }

  /**
      Set `useSystemCertdb` property.
      Params:
        propval = Whether or not the system certificate database will be used to
          verify peer certificates. See
          [gid.gio2.tls_connection.TlsConnection.setUseSystemCertdb].
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use GTlsConnection:database instead
  */
  T useSystemCertdb(bool propval) nothrow
  {
    return setProperty("use-system-certdb", propval);
  }
}

/// Fluent builder for [gid.gio2.tls_connection.TlsConnection]
final class TlsConnectionGidBuilder : TlsConnectionGidBuilderImpl!TlsConnectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TlsConnection build() nothrow
  {
    return new TlsConnection(cast(void*)createGObject(TlsConnection._getGType), Yes.Take);
  }
}
