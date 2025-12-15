/// Module for [AuthenticationRequest] class
module webkit.authentication_request;

import gid.gid;
import gio.types;
import gobject.dclosure;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.credential;
import webkit.security_origin;
import webkit.types;

/**
    Represents an authentication request.
    
    Whenever a client attempts to load a page protected by HTTP
    authentication, credentials will need to be provided to authorize access.
    To allow the client to decide how it wishes to handle authentication,
    WebKit will fire a #WebKitWebView::authenticate signal with a
    WebKitAuthenticationRequest object to provide client side
    authentication support. Credentials are exposed through the
    #WebKitCredential object.
    
    In case the client application does not wish
    to handle this signal WebKit will provide a default handler. To handle
    authentication asynchronously, simply increase the reference count of the
    WebKitAuthenticationRequest object.
*/
class AuthenticationRequest : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_authentication_request_get_type != &gidSymbolNotFound ? webkit_authentication_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthenticationRequest self()
  {
    return this;
  }

  /**
      Authenticate the #WebKitAuthenticationRequest.
      
      Authenticate the #WebKitAuthenticationRequest using the #WebKitCredential
      supplied. To continue without credentials, pass null as credential.
  
      Params:
        credential = A #WebKitCredential, or null
  */
  void authenticate(webkit.credential.Credential credential = null)
  {
    webkit_authentication_request_authenticate(cast(WebKitAuthenticationRequest*)this._cPtr, credential ? cast(WebKitCredential*)credential._cPtr(No.Dup) : null);
  }

  /**
      Determine whether this #WebKitAuthenticationRequest should allow the storage of credentials.
      
      Determine whether the authentication method associated with this
      #WebKitAuthenticationRequest should allow the storage of credentials.
      This will return false if WebKit doesn't support credential storing,
      if private browsing is enabled, or if persistent credential storage has been
      disabled in #WebKitWebsiteDataManager, unless credentials saving has been
      explicitly enabled with [webkit.authentication_request.AuthenticationRequest.setCanSaveCredentials].
      Returns: true if WebKit can store credentials or false otherwise.
  */
  bool canSaveCredentials()
  {
    bool _retval;
    _retval = cast(bool)webkit_authentication_request_can_save_credentials(cast(WebKitAuthenticationRequest*)this._cPtr);
    return _retval;
  }

  /**
      Cancel the authentication challenge.
      
      This will also cancel the page loading and result in a
      #WebKitWebView::load-failed signal with a #WebKitNetworkError of type [webkit.types.NetworkError.Cancelled] being emitted.
  */
  void cancel()
  {
    webkit_authentication_request_cancel(cast(WebKitAuthenticationRequest*)this._cPtr);
  }

  /**
      Get the #GTlsPasswordFlags of the [webkit.types.AuthenticationScheme.ClientCertificatePinRequested] authentication challenge.
      Returns: a #GTlsPasswordFlags
  */
  gio.types.TlsPasswordFlags getCertificatePinFlags()
  {
    GTlsPasswordFlags _cretval;
    _cretval = webkit_authentication_request_get_certificate_pin_flags(cast(WebKitAuthenticationRequest*)this._cPtr);
    gio.types.TlsPasswordFlags _retval = cast(gio.types.TlsPasswordFlags)_cretval;
    return _retval;
  }

  /**
      Get the host that this authentication challenge is applicable to.
      Returns: The host of request.
  */
  string getHost()
  {
    const(char)* _cretval;
    _cretval = webkit_authentication_request_get_host(cast(WebKitAuthenticationRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the port that this authentication challenge is applicable to.
      Returns: The port of request.
  */
  uint getPort()
  {
    uint _retval;
    _retval = webkit_authentication_request_get_port(cast(WebKitAuthenticationRequest*)this._cPtr);
    return _retval;
  }

  /**
      Get the #WebKitCredential of the proposed authentication challenge.
      
      Get the #WebKitCredential of the proposed authentication challenge that was
      stored from a previous session. The client can use this directly for
      authentication or construct their own #WebKitCredential.
      Returns: A #WebKitCredential encapsulating credential details
        or null if there is no stored credential.
  */
  webkit.credential.Credential getProposedCredential()
  {
    WebKitCredential* _cretval;
    _cretval = webkit_authentication_request_get_proposed_credential(cast(WebKitAuthenticationRequest*)this._cPtr);
    auto _retval = _cretval ? new webkit.credential.Credential(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the realm that this authentication challenge is applicable to.
      Returns: The realm of request.
  */
  string getRealm()
  {
    const(char)* _cretval;
    _cretval = webkit_authentication_request_get_realm(cast(WebKitAuthenticationRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the authentication scheme of the authentication challenge.
      Returns: The #WebKitAuthenticationScheme of request.
  */
  webkit.types.AuthenticationScheme getScheme()
  {
    WebKitAuthenticationScheme _cretval;
    _cretval = webkit_authentication_request_get_scheme(cast(WebKitAuthenticationRequest*)this._cPtr);
    webkit.types.AuthenticationScheme _retval = cast(webkit.types.AuthenticationScheme)_cretval;
    return _retval;
  }

  /**
      Get the #WebKitSecurityOrigin that this authentication challenge is applicable to.
      Returns: a newly created #WebKitSecurityOrigin.
  */
  webkit.security_origin.SecurityOrigin getSecurityOrigin()
  {
    WebKitSecurityOrigin* _cretval;
    _cretval = webkit_authentication_request_get_security_origin(cast(WebKitAuthenticationRequest*)this._cPtr);
    auto _retval = _cretval ? new webkit.security_origin.SecurityOrigin(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Determine whether the authentication challenge is associated with a proxy server.
      
      Determine whether the authentication challenge is associated with a proxy server rather than an "origin" server.
      Returns: true if authentication is for a proxy or false otherwise.
  */
  bool isForProxy()
  {
    bool _retval;
    _retval = cast(bool)webkit_authentication_request_is_for_proxy(cast(WebKitAuthenticationRequest*)this._cPtr);
    return _retval;
  }

  /**
      Determine whether this this is a first attempt or a retry for this authentication challenge.
      Returns: true if authentication attempt is a retry or false otherwise.
  */
  bool isRetry()
  {
    bool _retval;
    _retval = cast(bool)webkit_authentication_request_is_retry(cast(WebKitAuthenticationRequest*)this._cPtr);
    return _retval;
  }

  /**
      Set whether the authentication method associated with request
      should allow the storage of credentials.
      
      Set whether the authentication method associated with request
      should allow the storage of credentials.
      This should be used by applications handling their own credentials
      storage to indicate that it should be supported even when internal
      credential storage is disabled or unsupported.
      Note that storing of credentials will not be allowed on ephemeral
      sessions in any case.
  
      Params:
        enabled = value to set
  */
  void setCanSaveCredentials(bool enabled)
  {
    webkit_authentication_request_set_can_save_credentials(cast(WebKitAuthenticationRequest*)this._cPtr, enabled);
  }

  /**
      Set the #WebKitCredential of the proposed authentication challenge.
      
      Set the #WebKitCredential of the proposed authentication challenge that was
      stored from a previous session. This should only be used by applications handling
      their own credential storage. (When using the default WebKit credential storage,
      [webkit.authentication_request.AuthenticationRequest.getProposedCredential] already contains previously-stored
      credentials.)
      Passing a null credential will clear the proposed credential.
  
      Params:
        credential = a #WebKitCredential, or null
  */
  void setProposedCredential(webkit.credential.Credential credential)
  {
    webkit_authentication_request_set_proposed_credential(cast(WebKitAuthenticationRequest*)this._cPtr, credential ? cast(WebKitCredential*)credential._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Authenticated` signal.
  
      This signal is emitted when the user authentication request succeeded.
      Applications handling their own credential storage should connect to
      this signal to save the credentials.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.credential.Credential credential, webkit.authentication_request.AuthenticationRequest authenticationRequest))
  
          `credential` the #WebKitCredential accepted (optional)
  
          `authenticationRequest` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAuthenticated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == webkit.credential.Credential)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.authentication_request.AuthenticationRequest)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("authenticated", closure, after);
  }

  /**
      Connect to `Cancelled` signal.
  
      This signal is emitted when the user authentication request is
      cancelled. It allows the application to dismiss its authentication
      dialog in case of page load failure for example.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.authentication_request.AuthenticationRequest authenticationRequest))
  
          `authenticationRequest` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCancelled(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.authentication_request.AuthenticationRequest)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancelled", closure, after);
  }
}
