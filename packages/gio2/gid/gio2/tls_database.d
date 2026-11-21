/// Module for [TlsDatabase] class
module gid.gio2.tls_database;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.socket_connectable;
import gid.gio2.tls_certificate;
import gid.gio2.tls_interaction;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.tls_database.TlsDatabase] is used to look up certificates and other information
    from a certificate or key store. It is an abstract base class which
    TLS library specific subtypes override.
    
    A [gid.gio2.tls_database.TlsDatabase] may be accessed from multiple threads by the TLS backend.
    All implementations are required to be fully thread-safe.
    
    Most common client applications will not directly interact with
    [gid.gio2.tls_database.TlsDatabase]. It is used internally by [gid.gio2.tls_connection.TlsConnection].
*/
class TlsDatabase : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_tls_database_get_type != &gidSymbolNotFound ? g_tls_database_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GTlsDatabase";
  }

  /** Returns `this`, for use in `with` statements. */
  override TlsDatabase self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.tls_database.TlsDatabase]
      Returns: New builder object
  */
  static TlsDatabaseGidBuilder builder() nothrow
  {
    return new TlsDatabaseGidBuilder;
  }

  /**
      Create a handle string for the certificate. The database will only be able
      to create a handle for certificates that originate from the database. In
      cases where the database cannot create a handle for a certificate, null
      will be returned.
      
      This handle should be stable across various instances of the application,
      and between applications. If a certificate is modified in the database,
      then it is not guaranteed that this handle will continue to point to it.
  
      Params:
        certificate = certificate for which to create a handle.
      Returns: a newly allocated string containing the
        handle.
  */
  string createCertificateHandle(gid.gio2.tls_certificate.TlsCertificate certificate) nothrow
  {
    char* _cretval;
    _cretval = g_tls_database_create_certificate_handle(cast(GTlsDatabase*)this._cPtr, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Look up a certificate by its handle.
      
      The handle should have been created by calling
      [gid.gio2.tls_database.TlsDatabase.createCertificateHandle] on a #GTlsDatabase object of
      the same TLS backend. The handle is designed to remain valid across
      instantiations of the database.
      
      If the handle is no longer valid, or does not point to a certificate in
      this database, then null will be returned.
      
      This function can block, use [gid.gio2.tls_database.TlsDatabase.lookupCertificateForHandleAsync] to perform
      the lookup operation asynchronously.
  
      Params:
        handle = a certificate handle
        interaction = used to interact with the user if necessary
        flags = Flags which affect the lookup.
        cancellable = a #GCancellable, or null
      Returns: a newly allocated
        #GTlsCertificate, or null. Use [gid.gobject2.object.ObjectWrap.unref] to release the certificate.
      Throws: [ErrorWrap]
  */
  gid.gio2.tls_certificate.TlsCertificate lookupCertificateForHandle(string handle, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GTlsCertificate* _cretval;
    const(char)* _handle = handle.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_tls_database_lookup_certificate_for_handle(cast(GTlsDatabase*)this._cPtr, _handle, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously look up a certificate by its handle in the database. See
      [gid.gio2.tls_database.TlsDatabase.lookupCertificateForHandle] for more information.
  
      Params:
        handle = a certificate handle
        interaction = used to interact with the user if necessary
        flags = Flags which affect the lookup.
        cancellable = a #GCancellable, or null
        callback = callback to call when the operation completes
  */
  void lookupCertificateForHandleAsync(string handle, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    const(char)* _handle = handle.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_tls_database_lookup_certificate_for_handle_async(cast(GTlsDatabase*)this._cPtr, _handle, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous lookup of a certificate by its handle. See
      [gid.gio2.tls_database.TlsDatabase.lookupCertificateForHandle] for more information.
      
      If the handle is no longer valid, or does not point to a certificate in
      this database, then null will be returned.
  
      Params:
        result = a #GAsyncResult.
      Returns: a newly allocated #GTlsCertificate object.
        Use [gid.gobject2.object.ObjectWrap.unref] to release the certificate.
      Throws: [ErrorWrap]
  */
  gid.gio2.tls_certificate.TlsCertificate lookupCertificateForHandleFinish(gid.gio2.async_result.AsyncResult result)
  {
    GTlsCertificate* _cretval;
    GError *_err;
    _cretval = g_tls_database_lookup_certificate_for_handle_finish(cast(GTlsDatabase*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Look up the issuer of certificate in the database. The
      #GTlsCertificate:issuer property of certificate is not modified, and
      the two certificates are not hooked into a chain.
      
      This function can block. Use [gid.gio2.tls_database.TlsDatabase.lookupCertificateIssuerAsync]
      to perform the lookup operation asynchronously.
      
      Beware this function cannot be used to build certification paths. The
      issuer certificate returned by this function may not be the same as
      the certificate that would actually be used to construct a valid
      certification path during certificate verification.
      [RFC 4158](https://datatracker.ietf.org/doc/html/rfc4158) explains
      why an issuer certificate cannot be naively assumed to be part of the
      the certification path (though GLib's TLS backends may not follow the
      path building strategies outlined in this RFC). Due to the complexity
      of certification path building, GLib does not provide any way to know
      which certification path will actually be used when verifying a TLS
      certificate. Accordingly, this function cannot be used to make
      security-related decisions. Only GLib itself should make security
      decisions about TLS certificates.
  
      Params:
        certificate = a #GTlsCertificate
        interaction = used to interact with the user if necessary
        flags = flags which affect the lookup operation
        cancellable = a #GCancellable, or null
      Returns: a newly allocated issuer #GTlsCertificate,
        or null. Use [gid.gobject2.object.ObjectWrap.unref] to release the certificate.
      Throws: [ErrorWrap]
  */
  gid.gio2.tls_certificate.TlsCertificate lookupCertificateIssuer(gid.gio2.tls_certificate.TlsCertificate certificate, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GTlsCertificate* _cretval;
    GError *_err;
    _cretval = g_tls_database_lookup_certificate_issuer(cast(GTlsDatabase*)this._cPtr, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously look up the issuer of certificate in the database. See
      [gid.gio2.tls_database.TlsDatabase.lookupCertificateIssuer] for more information.
  
      Params:
        certificate = a #GTlsCertificate
        interaction = used to interact with the user if necessary
        flags = flags which affect the lookup operation
        cancellable = a #GCancellable, or null
        callback = callback to call when the operation completes
  */
  void lookupCertificateIssuerAsync(gid.gio2.tls_certificate.TlsCertificate certificate, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    g_tls_database_lookup_certificate_issuer_async(cast(GTlsDatabase*)this._cPtr, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous lookup issuer operation. See
      [gid.gio2.tls_database.TlsDatabase.lookupCertificateIssuer] for more information.
  
      Params:
        result = a #GAsyncResult.
      Returns: a newly allocated issuer #GTlsCertificate,
        or null. Use [gid.gobject2.object.ObjectWrap.unref] to release the certificate.
      Throws: [ErrorWrap]
  */
  gid.gio2.tls_certificate.TlsCertificate lookupCertificateIssuerFinish(gid.gio2.async_result.AsyncResult result)
  {
    GTlsCertificate* _cretval;
    GError *_err;
    _cretval = g_tls_database_lookup_certificate_issuer_finish(cast(GTlsDatabase*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Look up certificates issued by this issuer in the database.
      
      This function can block, use [gid.gio2.tls_database.TlsDatabase.lookupCertificatesIssuedByAsync] to perform
      the lookup operation asynchronously.
  
      Params:
        issuerRawDn = a #GByteArray which holds the DER encoded issuer DN.
        interaction = used to interact with the user if necessary
        flags = Flags which affect the lookup operation.
        cancellable = a #GCancellable, or null
      Returns: a newly allocated list of #GTlsCertificate
        objects. Use [gid.gobject2.object.ObjectWrap.unref] on each certificate, and [gid.glib2.list.List.free] on the release the list.
      Throws: [ErrorWrap]
  */
  gid.gio2.tls_certificate.TlsCertificate[] lookupCertificatesIssuedBy(ubyte[] issuerRawDn, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GList* _cretval;
    auto _issuerRawDn = gByteArrayFromD(issuerRawDn);
    scope(exit) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_issuerRawDn);
    GError *_err;
    _cretval = g_tls_database_lookup_certificates_issued_by(cast(GTlsDatabase*)this._cPtr, _issuerRawDn, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.tls_certificate.TlsCertificate, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Asynchronously look up certificates issued by this issuer in the database. See
      [gid.gio2.tls_database.TlsDatabase.lookupCertificatesIssuedBy] for more information.
      
      The database may choose to hold a reference to the issuer byte array for the duration
      of this asynchronous operation. The byte array should not be modified during
      this time.
  
      Params:
        issuerRawDn = a #GByteArray which holds the DER encoded issuer DN.
        interaction = used to interact with the user if necessary
        flags = Flags which affect the lookup operation.
        cancellable = a #GCancellable, or null
        callback = callback to call when the operation completes
  */
  void lookupCertificatesIssuedByAsync(ubyte[] issuerRawDn, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    auto _issuerRawDn = gByteArrayFromD(issuerRawDn);
    scope(exit) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_issuerRawDn);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_tls_database_lookup_certificates_issued_by_async(cast(GTlsDatabase*)this._cPtr, _issuerRawDn, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous lookup of certificates. See
      [gid.gio2.tls_database.TlsDatabase.lookupCertificatesIssuedBy] for more information.
  
      Params:
        result = a #GAsyncResult.
      Returns: a newly allocated list of #GTlsCertificate
        objects. Use [gid.gobject2.object.ObjectWrap.unref] on each certificate, and [gid.glib2.list.List.free] on the release the list.
      Throws: [ErrorWrap]
  */
  gid.gio2.tls_certificate.TlsCertificate[] lookupCertificatesIssuedByFinish(gid.gio2.async_result.AsyncResult result)
  {
    GList* _cretval;
    GError *_err;
    _cretval = g_tls_database_lookup_certificates_issued_by_finish(cast(GTlsDatabase*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gListToD!(gid.gio2.tls_certificate.TlsCertificate, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Determines the validity of a certificate chain, outside the context
      of a TLS session.
      
      chain is a chain of #GTlsCertificate objects each pointing to the next
      certificate in the chain by its #GTlsCertificate:issuer property.
      
      purpose describes the purpose (or usage) for which the certificate
      is being used. Typically purpose will be set to [gid.gio2.types.TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER]
      which means that the certificate is being used to authenticate a server
      (and we are acting as the client).
      
      The identity is used to ensure the server certificate is valid for
      the expected peer identity. If the identity does not match the
      certificate, [gid.gio2.types.TlsCertificateFlags.BadIdentity] will be set in the
      return value. If identity is null, that bit will never be set in
      the return value. The peer identity may also be used to check for
      pinned certificates (trust exceptions) in the database. These may
      override the normal verification process on a host-by-host basis.
      
      Currently there are no flags, and [gid.gio2.types.TlsDatabaseVerifyFlags.None] should be
      used.
      
      If chain is found to be valid, then the return value will be 0. If
      chain is found to be invalid, then the return value will indicate at
      least one problem found. If the function is unable to determine
      whether chain is valid (for example, because cancellable is
      triggered before it completes) then the return value will be
      [gid.gio2.types.TlsCertificateFlags.GenericError] and error will be set accordingly.
      error is not set when chain is successfully analyzed but found to
      be invalid.
      
      GLib guarantees that if certificate verification fails, at least one
      error will be set in the return value, but it does not guarantee
      that all possible errors will be set. Accordingly, you may not safely
      decide to ignore any particular type of error. For example, it would
      be incorrect to mask [gid.gio2.types.TlsCertificateFlags.Expired] if you want to allow
      expired certificates, because this could potentially be the only
      error flag set even if other problems exist with the certificate.
      
      Prior to GLib 2.48, GLib's default TLS backend modified chain to
      represent the certification path built by #GTlsDatabase during
      certificate verification by adjusting the #GTlsCertificate:issuer
      property of each certificate in chain. Since GLib 2.48, this no
      longer occurs, so you cannot rely on #GTlsCertificate:issuer to
      represent the actual certification path used during certificate
      verification.
      
      Because TLS session context is not used, #GTlsDatabase may not
      perform as many checks on the certificates as #GTlsConnection would.
      For example, certificate constraints may not be honored, and
      revocation checks may not be performed. The best way to verify TLS
      certificates used by a TLS connection is to let #GTlsConnection
      handle the verification.
      
      The TLS backend may attempt to look up and add missing certificates
      to the chain. This may involve HTTP requests to download missing
      certificates.
      
      This function can block. Use [gid.gio2.tls_database.TlsDatabase.verifyChainAsync] to
      perform the verification operation asynchronously.
  
      Params:
        chain = a #GTlsCertificate chain
        purpose = the purpose that this certificate chain will be used for.
        identity = the expected peer identity
        interaction = used to interact with the user if necessary
        flags = additional verify flags
        cancellable = a #GCancellable, or null
      Returns: the appropriate #GTlsCertificateFlags which represents the
        result of verification.
      Throws: [ErrorWrap]
  */
  gid.gio2.types.TlsCertificateFlags verifyChain(gid.gio2.tls_certificate.TlsCertificate chain, string purpose, gid.gio2.socket_connectable.SocketConnectable identity, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseVerifyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GTlsCertificateFlags _cretval;
    const(char)* _purpose = purpose.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_tls_database_verify_chain(cast(GTlsDatabase*)this._cPtr, chain ? cast(GTlsCertificate*)chain._cPtr(No.Dup) : null, _purpose, identity ? cast(GSocketConnectable*)(cast(gid.gobject2.object.ObjectWrap)identity)._cPtr(No.Dup) : null, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsCertificateFlags _retval = cast(gid.gio2.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
      Asynchronously determines the validity of a certificate chain after
      looking up and adding any missing certificates to the chain. See
      [gid.gio2.tls_database.TlsDatabase.verifyChain] for more information.
  
      Params:
        chain = a #GTlsCertificate chain
        purpose = the purpose that this certificate chain will be used for.
        identity = the expected peer identity
        interaction = used to interact with the user if necessary
        flags = additional verify flags
        cancellable = a #GCancellable, or null
        callback = callback to call when the operation completes
  */
  void verifyChainAsync(gid.gio2.tls_certificate.TlsCertificate chain, string purpose, gid.gio2.socket_connectable.SocketConnectable identity, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseVerifyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    const(char)* _purpose = purpose.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_tls_database_verify_chain_async(cast(GTlsDatabase*)this._cPtr, chain ? cast(GTlsCertificate*)chain._cPtr(No.Dup) : null, _purpose, identity ? cast(GSocketConnectable*)(cast(gid.gobject2.object.ObjectWrap)identity)._cPtr(No.Dup) : null, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous verify chain operation. See
      [gid.gio2.tls_database.TlsDatabase.verifyChain] for more information.
      
      If chain is found to be valid, then the return value will be 0. If
      chain is found to be invalid, then the return value will indicate
      the problems found. If the function is unable to determine whether
      chain is valid or not (eg, because cancellable is triggered
      before it completes) then the return value will be
      [gid.gio2.types.TlsCertificateFlags.GenericError] and error will be set
      accordingly. error is not set when chain is successfully analyzed
      but found to be invalid.
  
      Params:
        result = a #GAsyncResult.
      Returns: the appropriate #GTlsCertificateFlags which represents the
        result of verification.
      Throws: [ErrorWrap]
  */
  gid.gio2.types.TlsCertificateFlags verifyChainFinish(gid.gio2.async_result.AsyncResult result)
  {
    GTlsCertificateFlags _cretval;
    GError *_err;
    _cretval = g_tls_database_verify_chain_finish(cast(GTlsDatabase*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsCertificateFlags _retval = cast(gid.gio2.types.TlsCertificateFlags)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.tls_database.TlsDatabase]
class TlsDatabaseGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.tls_database.TlsDatabase]
final class TlsDatabaseGidBuilder : TlsDatabaseGidBuilderImpl!TlsDatabaseGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TlsDatabase build() nothrow
  {
    return new TlsDatabase(cast(void*)createGObject(TlsDatabase._getGType), Yes.Take);
  }
}
