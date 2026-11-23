/// Module for [TlsDatabase] class
module gid.gio2.tls_database;

public import gid.core.basictypes;
import gid.core.utils;
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreateCertificateHandle` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected string vfuncCreateCertificateHandle(gid.gio2.tls_certificate.TlsCertificate certificate)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.createCertificateHandle)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.createCertificateHandle(cast(GTlsDatabase*)this._cPtr, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupCertificateForHandle` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.tls_certificate.TlsCertificate vfuncLookupCertificateForHandle(string handle, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.lookupCertificateForHandle)
      return typeof(return).init;

    GTlsCertificate* _cretval;
    const(char)* _handle = handle.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.lookupCertificateForHandle(cast(GTlsDatabase*)this._cPtr, _handle, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupCertificateForHandleAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncLookupCertificateForHandleAsync(string handle, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.lookupCertificateForHandleAsync)
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
    const(char)* _handle = handle.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.lookupCertificateForHandleAsync(cast(GTlsDatabase*)this._cPtr, _handle, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupCertificateForHandleFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.tls_certificate.TlsCertificate vfuncLookupCertificateForHandleFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.lookupCertificateForHandleFinish)
      return typeof(return).init;

    GTlsCertificate* _cretval;
    GError *_err;
    _cretval = _klass.lookupCertificateForHandleFinish(cast(GTlsDatabase*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupCertificateIssuer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.tls_certificate.TlsCertificate vfuncLookupCertificateIssuer(gid.gio2.tls_certificate.TlsCertificate certificate, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.lookupCertificateIssuer)
      return typeof(return).init;

    GTlsCertificate* _cretval;
    GError *_err;
    _cretval = _klass.lookupCertificateIssuer(cast(GTlsDatabase*)this._cPtr, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupCertificateIssuerAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncLookupCertificateIssuerAsync(gid.gio2.tls_certificate.TlsCertificate certificate, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.lookupCertificateIssuerAsync)
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
    _klass.lookupCertificateIssuerAsync(cast(GTlsDatabase*)this._cPtr, certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous lookup issuer operation. See
      [gid.gio2.tls_database.TlsDatabase.lookupCertificateIssuer] for more information.
  
      Params:
        result = a #GAsyncResult.
      Returns: a newly allocated issuer #GTlsCertificate,
        or null. Use [gid.gobject2.object.ObjectWrap.unref] to release the certificate.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupCertificateIssuerFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.tls_certificate.TlsCertificate vfuncLookupCertificateIssuerFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.lookupCertificateIssuerFinish)
      return typeof(return).init;

    GTlsCertificate* _cretval;
    GError *_err;
    _cretval = _klass.lookupCertificateIssuerFinish(cast(GTlsDatabase*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupCertificatesIssuedBy` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.tls_certificate.TlsCertificate[] vfuncLookupCertificatesIssuedBy(ubyte[] issuerRawDn, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.lookupCertificatesIssuedBy)
      return typeof(return).init;

    GList* _cretval;
    auto _issuerRawDn = gByteArrayFromD(issuerRawDn);
    scope(exit) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_issuerRawDn);
    GError *_err;
    _cretval = _klass.lookupCertificatesIssuedBy(cast(GTlsDatabase*)this._cPtr, _issuerRawDn, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupCertificatesIssuedByAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncLookupCertificatesIssuedByAsync(ubyte[] issuerRawDn, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseLookupFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.lookupCertificatesIssuedByAsync)
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
    auto _issuerRawDn = gByteArrayFromD(issuerRawDn);
    scope(exit) containerFree!(GByteArray*, ubyte, GidOwnership.None)(_issuerRawDn);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.lookupCertificatesIssuedByAsync(cast(GTlsDatabase*)this._cPtr, _issuerRawDn, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finish an asynchronous lookup of certificates. See
      [gid.gio2.tls_database.TlsDatabase.lookupCertificatesIssuedBy] for more information.
  
      Params:
        result = a #GAsyncResult.
      Returns: a newly allocated list of #GTlsCertificate
        objects. Use [gid.gobject2.object.ObjectWrap.unref] on each certificate, and [gid.glib2.list.List.free] on the release the list.
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncLookupCertificatesIssuedByFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.tls_certificate.TlsCertificate[] vfuncLookupCertificatesIssuedByFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.lookupCertificatesIssuedByFinish)
      return typeof(return).init;

    GList* _cretval;
    GError *_err;
    _cretval = _klass.lookupCertificatesIssuedByFinish(cast(GTlsDatabase*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncVerifyChain` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.types.TlsCertificateFlags vfuncVerifyChain(gid.gio2.tls_certificate.TlsCertificate chain, string purpose, gid.gio2.socket_connectable.SocketConnectable identity, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseVerifyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.verifyChain)
      return typeof(return).init;

    GTlsCertificateFlags _cretval;
    const(char)* _purpose = purpose.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.verifyChain(cast(GTlsDatabase*)this._cPtr, chain ? cast(GTlsCertificate*)chain._cPtr(No.Dup) : null, _purpose, identity ? cast(GSocketConnectable*)(cast(gid.gobject2.object.ObjectWrap)identity)._cPtr(No.Dup) : null, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncVerifyChainAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncVerifyChainAsync(gid.gio2.tls_certificate.TlsCertificate chain, string purpose, gid.gio2.socket_connectable.SocketConnectable identity, gid.gio2.tls_interaction.TlsInteraction interaction, gid.gio2.types.TlsDatabaseVerifyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.verifyChainAsync)
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
    const(char)* _purpose = purpose.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.verifyChainAsync(cast(GTlsDatabase*)this._cPtr, chain ? cast(GTlsCertificate*)chain._cPtr(No.Dup) : null, _purpose, identity ? cast(GSocketConnectable*)(cast(gid.gobject2.object.ObjectWrap)identity)._cPtr(No.Dup) : null, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncVerifyChainFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.types.TlsCertificateFlags vfuncVerifyChainFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GTlsDatabaseClass*)_vfuncClass;
    if (!_klass.verifyChainFinish)
      return typeof(return).init;

    GTlsCertificateFlags _cretval;
    GError *_err;
    _cretval = _klass.verifyChainFinish(cast(GTlsDatabase*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.TlsCertificateFlags _retval = cast(gid.gio2.types.TlsCertificateFlags)_cretval;
    return _retval;
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TlsDatabase
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.tls_database.TlsDatabase), T.stringof ~ " is not derived from gid.gio2.tls_database.TlsDatabase");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreateCertificateHandle", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      _installVfunc(klass, "create_certificate_handle");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupCertificateForHandle", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      _installVfunc(klass, "lookup_certificate_for_handle");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupCertificateForHandleAsync", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      static assert(0, "Overriding gid.gio2.tls_database.TlsDatabase.vfuncLookupCertificateForHandleAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupCertificateForHandleFinish", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      _installVfunc(klass, "lookup_certificate_for_handle_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupCertificateIssuer", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      _installVfunc(klass, "lookup_certificate_issuer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupCertificateIssuerAsync", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      static assert(0, "Overriding gid.gio2.tls_database.TlsDatabase.vfuncLookupCertificateIssuerAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupCertificateIssuerFinish", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      _installVfunc(klass, "lookup_certificate_issuer_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupCertificatesIssuedBy", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      _installVfunc(klass, "lookup_certificates_issued_by");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupCertificatesIssuedByAsync", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      static assert(0, "Overriding gid.gio2.tls_database.TlsDatabase.vfuncLookupCertificatesIssuedByAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLookupCertificatesIssuedByFinish", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      _installVfunc(klass, "lookup_certificates_issued_by_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncVerifyChain", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      _installVfunc(klass, "verify_chain");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncVerifyChainAsync", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      static assert(0, "Overriding gid.gio2.tls_database.TlsDatabase.vfuncVerifyChainAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncVerifyChainFinish", true)[0]) == gid.gio2.tls_database.TlsDatabase))
      _installVfunc(klass, "verify_chain_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GTlsDatabaseClass*)klass;

    switch (vfunc)
    {
      case "create_certificate_handle":
      {
        static extern(C) char* _vfuncCreateCertificateHandleTramp(GTlsDatabase* self, GTlsCertificate* certificate) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_database.TlsDatabase)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GTlsDatabaseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.createCertificateHandle)
              return (cast(typeof(&_vfuncCreateCertificateHandleTramp))_klass.createCertificateHandle)(self, certificate);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncCreateCertificateHandle(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(void*)certificate, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.tls_database.TlsDatabase.vfuncCreateCertificateHandle");
          }
          auto _retval = toCString!(Yes.Malloc, Yes.Nullable)(_dretval);

          return _retval;
        }

        _klass.createCertificateHandle = cast(typeof(_klass.createCertificateHandle))&_vfuncCreateCertificateHandleTramp;
        break;
      }
      case "lookup_certificate_for_handle":
      {
        static extern(C) GTlsCertificate* _vfuncLookupCertificateForHandleTramp(GTlsDatabase* self, const(char)* handle, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_database.TlsDatabase)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GTlsDatabaseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.lookupCertificateForHandle)
              return (cast(typeof(&_vfuncLookupCertificateForHandleTramp))_klass.lookupCertificateForHandle)(self, handle, interaction, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.tls_certificate.TlsCertificate _dretval;
          string _handle = handle.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncLookupCertificateForHandle(_handle, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_interaction.TlsInteraction)(cast(void*)interaction, No.Take), flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GTlsCertificate*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.lookupCertificateForHandle = cast(typeof(_klass.lookupCertificateForHandle))&_vfuncLookupCertificateForHandleTramp;
        break;
      }
      case "lookup_certificate_for_handle_finish":
      {
        static extern(C) GTlsCertificate* _vfuncLookupCertificateForHandleFinishTramp(GTlsDatabase* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_database.TlsDatabase)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GTlsDatabaseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.lookupCertificateForHandleFinish)
              return (cast(typeof(&_vfuncLookupCertificateForHandleFinishTramp))_klass.lookupCertificateForHandleFinish)(self, result, _err);
            return typeof(return).init;
          }

          gid.gio2.tls_certificate.TlsCertificate _dretval;

          try
          {
            _dretval = _obj.vfuncLookupCertificateForHandleFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GTlsCertificate*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.lookupCertificateForHandleFinish = cast(typeof(_klass.lookupCertificateForHandleFinish))&_vfuncLookupCertificateForHandleFinishTramp;
        break;
      }
      case "lookup_certificate_issuer":
      {
        static extern(C) GTlsCertificate* _vfuncLookupCertificateIssuerTramp(GTlsDatabase* self, GTlsCertificate* certificate, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_database.TlsDatabase)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GTlsDatabaseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.lookupCertificateIssuer)
              return (cast(typeof(&_vfuncLookupCertificateIssuerTramp))_klass.lookupCertificateIssuer)(self, certificate, interaction, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.tls_certificate.TlsCertificate _dretval;

          try
          {
            _dretval = _obj.vfuncLookupCertificateIssuer(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(void*)certificate, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_interaction.TlsInteraction)(cast(void*)interaction, No.Take), flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GTlsCertificate*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.lookupCertificateIssuer = cast(typeof(_klass.lookupCertificateIssuer))&_vfuncLookupCertificateIssuerTramp;
        break;
      }
      case "lookup_certificate_issuer_finish":
      {
        static extern(C) GTlsCertificate* _vfuncLookupCertificateIssuerFinishTramp(GTlsDatabase* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_database.TlsDatabase)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GTlsDatabaseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.lookupCertificateIssuerFinish)
              return (cast(typeof(&_vfuncLookupCertificateIssuerFinishTramp))_klass.lookupCertificateIssuerFinish)(self, result, _err);
            return typeof(return).init;
          }

          gid.gio2.tls_certificate.TlsCertificate _dretval;

          try
          {
            _dretval = _obj.vfuncLookupCertificateIssuerFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GTlsCertificate*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.lookupCertificateIssuerFinish = cast(typeof(_klass.lookupCertificateIssuerFinish))&_vfuncLookupCertificateIssuerFinishTramp;
        break;
      }
      case "lookup_certificates_issued_by":
      {
        static extern(C) GList* _vfuncLookupCertificatesIssuedByTramp(GTlsDatabase* self, GByteArray* issuerRawDn, GTlsInteraction* interaction, GTlsDatabaseLookupFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_database.TlsDatabase)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GTlsDatabaseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.lookupCertificatesIssuedBy)
              return (cast(typeof(&_vfuncLookupCertificatesIssuedByTramp))_klass.lookupCertificatesIssuedBy)(self, issuerRawDn, interaction, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.tls_certificate.TlsCertificate[] _dretval;
          auto _issuerRawDn = gByteArrayToD!(GidOwnership.None)(issuerRawDn);

          try
          {
            _dretval = _obj.vfuncLookupCertificatesIssuedBy(_issuerRawDn, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_interaction.TlsInteraction)(cast(void*)interaction, No.Take), flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = gListFromD!(gid.gio2.tls_certificate.TlsCertificate)(_dretval);

          return _retval;
        }

        _klass.lookupCertificatesIssuedBy = cast(typeof(_klass.lookupCertificatesIssuedBy))&_vfuncLookupCertificatesIssuedByTramp;
        break;
      }
      case "lookup_certificates_issued_by_finish":
      {
        static extern(C) GList* _vfuncLookupCertificatesIssuedByFinishTramp(GTlsDatabase* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_database.TlsDatabase)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GTlsDatabaseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.lookupCertificatesIssuedByFinish)
              return (cast(typeof(&_vfuncLookupCertificatesIssuedByFinishTramp))_klass.lookupCertificatesIssuedByFinish)(self, result, _err);
            return typeof(return).init;
          }

          gid.gio2.tls_certificate.TlsCertificate[] _dretval;

          try
          {
            _dretval = _obj.vfuncLookupCertificatesIssuedByFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = gListFromD!(gid.gio2.tls_certificate.TlsCertificate)(_dretval);

          return _retval;
        }

        _klass.lookupCertificatesIssuedByFinish = cast(typeof(_klass.lookupCertificatesIssuedByFinish))&_vfuncLookupCertificatesIssuedByFinishTramp;
        break;
      }
      case "verify_chain":
      {
        static extern(C) GTlsCertificateFlags _vfuncVerifyChainTramp(GTlsDatabase* self, GTlsCertificate* chain, const(char)* purpose, GSocketConnectable* identity, GTlsInteraction* interaction, GTlsDatabaseVerifyFlags flags, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_database.TlsDatabase)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GTlsDatabaseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.verifyChain)
              return (cast(typeof(&_vfuncVerifyChainTramp))_klass.verifyChain)(self, chain, purpose, identity, interaction, flags, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.types.TlsCertificateFlags _dretval;
          string _purpose = purpose.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncVerifyChain(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(void*)chain, No.Take), _purpose, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_connectable.SocketConnectable)(cast(void*)identity, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_interaction.TlsInteraction)(cast(void*)interaction, No.Take), flags, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(GTlsCertificateFlags)_dretval;

          return _retval;
        }

        _klass.verifyChain = cast(typeof(_klass.verifyChain))&_vfuncVerifyChainTramp;
        break;
      }
      case "verify_chain_finish":
      {
        static extern(C) GTlsCertificateFlags _vfuncVerifyChainFinishTramp(GTlsDatabase* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.tls_database.TlsDatabase)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GTlsDatabaseClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.verifyChainFinish)
              return (cast(typeof(&_vfuncVerifyChainFinishTramp))_klass.verifyChainFinish)(self, result, _err);
            return typeof(return).init;
          }

          gid.gio2.types.TlsCertificateFlags _dretval;

          try
          {
            _dretval = _obj.vfuncVerifyChainFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(GTlsCertificateFlags)_dretval;

          return _retval;
        }

        _klass.verifyChainFinish = cast(typeof(_klass.verifyChainFinish))&_vfuncVerifyChainFinishTramp;
        break;
      }
      default:
      break;
    }
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
