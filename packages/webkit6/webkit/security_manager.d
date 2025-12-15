/// Module for [SecurityManager] class
module webkit.security_manager;

import gid.gid;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Controls security settings in a #WebKitWebContext.
    
    The #WebKitSecurityManager defines security settings for URI
    schemes in a #WebKitWebContext. Get it from the context with
    [webkit.web_context.WebContext.getSecurityManager], and use it to register a
    URI scheme with a certain security level, or to check if it already
    has it.
*/
class SecurityManager : gobject.object.ObjectWrap
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
    return cast(void function())webkit_security_manager_get_type != &gidSymbolNotFound ? webkit_security_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SecurityManager self()
  {
    return this;
  }

  /**
      Register scheme as a CORS (Cross-origin resource sharing) enabled scheme.
      
      This means that CORS requests are allowed. See W3C CORS specification
      http://www.w3.org/TR/cors/.
  
      Params:
        scheme = a URI scheme
  */
  void registerUriSchemeAsCorsEnabled(string scheme)
  {
    const(char)* _scheme = scheme.toCString(No.Alloc);
    webkit_security_manager_register_uri_scheme_as_cors_enabled(cast(WebKitSecurityManager*)this._cPtr, _scheme);
  }

  /**
      Register scheme as a display isolated scheme.
      
      This means that pages cannot
      display these URIs unless they are from the same scheme.
  
      Params:
        scheme = a URI scheme
  */
  void registerUriSchemeAsDisplayIsolated(string scheme)
  {
    const(char)* _scheme = scheme.toCString(No.Alloc);
    webkit_security_manager_register_uri_scheme_as_display_isolated(cast(WebKitSecurityManager*)this._cPtr, _scheme);
  }

  /**
      Register scheme as an empty document scheme.
      
      This means that
      they are allowed to commit synchronously.
  
      Params:
        scheme = a URI scheme
  */
  void registerUriSchemeAsEmptyDocument(string scheme)
  {
    const(char)* _scheme = scheme.toCString(No.Alloc);
    webkit_security_manager_register_uri_scheme_as_empty_document(cast(WebKitSecurityManager*)this._cPtr, _scheme);
  }

  /**
      Register scheme as a local scheme.
      
      This means that other non-local pages
      cannot link to or access URIs of this scheme.
  
      Params:
        scheme = a URI scheme
  */
  void registerUriSchemeAsLocal(string scheme)
  {
    const(char)* _scheme = scheme.toCString(No.Alloc);
    webkit_security_manager_register_uri_scheme_as_local(cast(WebKitSecurityManager*)this._cPtr, _scheme);
  }

  /**
      Register scheme as a no-access scheme.
      
      This means that pages loaded
      with this URI scheme cannot access pages loaded with any other URI scheme.
  
      Params:
        scheme = a URI scheme
  */
  void registerUriSchemeAsNoAccess(string scheme)
  {
    const(char)* _scheme = scheme.toCString(No.Alloc);
    webkit_security_manager_register_uri_scheme_as_no_access(cast(WebKitSecurityManager*)this._cPtr, _scheme);
  }

  /**
      Register scheme as a secure scheme.
      
      This means that mixed
      content warnings won't be generated for this scheme when
      included by an HTTPS page.
  
      Params:
        scheme = a URI scheme
  */
  void registerUriSchemeAsSecure(string scheme)
  {
    const(char)* _scheme = scheme.toCString(No.Alloc);
    webkit_security_manager_register_uri_scheme_as_secure(cast(WebKitSecurityManager*)this._cPtr, _scheme);
  }

  /**
      Whether scheme is considered as a CORS enabled scheme.
      
      See also [webkit.security_manager.SecurityManager.registerUriSchemeAsCorsEnabled].
  
      Params:
        scheme = a URI scheme
      Returns: true if scheme is a CORS enabled scheme or false otherwise.
  */
  bool uriSchemeIsCorsEnabled(string scheme)
  {
    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    _retval = cast(bool)webkit_security_manager_uri_scheme_is_cors_enabled(cast(WebKitSecurityManager*)this._cPtr, _scheme);
    return _retval;
  }

  /**
      Whether scheme is considered as a display isolated scheme.
      
      See also [webkit.security_manager.SecurityManager.registerUriSchemeAsDisplayIsolated].
  
      Params:
        scheme = a URI scheme
      Returns: true if scheme is a display isolated scheme or false otherwise.
  */
  bool uriSchemeIsDisplayIsolated(string scheme)
  {
    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    _retval = cast(bool)webkit_security_manager_uri_scheme_is_display_isolated(cast(WebKitSecurityManager*)this._cPtr, _scheme);
    return _retval;
  }

  /**
      Whether scheme is considered as an empty document scheme.
      
      See also [webkit.security_manager.SecurityManager.registerUriSchemeAsEmptyDocument].
  
      Params:
        scheme = a URI scheme
      Returns: true if scheme is an empty document scheme or false otherwise.
  */
  bool uriSchemeIsEmptyDocument(string scheme)
  {
    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    _retval = cast(bool)webkit_security_manager_uri_scheme_is_empty_document(cast(WebKitSecurityManager*)this._cPtr, _scheme);
    return _retval;
  }

  /**
      Whether scheme is considered as a local scheme.
      
      See also [webkit.security_manager.SecurityManager.registerUriSchemeAsLocal].
  
      Params:
        scheme = a URI scheme
      Returns: true if scheme is a local scheme or false otherwise.
  */
  bool uriSchemeIsLocal(string scheme)
  {
    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    _retval = cast(bool)webkit_security_manager_uri_scheme_is_local(cast(WebKitSecurityManager*)this._cPtr, _scheme);
    return _retval;
  }

  /**
      Whether scheme is considered as a no-access scheme.
      
      See also [webkit.security_manager.SecurityManager.registerUriSchemeAsNoAccess].
  
      Params:
        scheme = a URI scheme
      Returns: true if scheme is a no-access scheme or false otherwise.
  */
  bool uriSchemeIsNoAccess(string scheme)
  {
    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    _retval = cast(bool)webkit_security_manager_uri_scheme_is_no_access(cast(WebKitSecurityManager*)this._cPtr, _scheme);
    return _retval;
  }

  /**
      Whether scheme is considered as a secure scheme.
      
      See also [webkit.security_manager.SecurityManager.registerUriSchemeAsSecure].
  
      Params:
        scheme = a URI scheme
      Returns: true if scheme is a secure scheme or false otherwise.
  */
  bool uriSchemeIsSecure(string scheme)
  {
    bool _retval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    _retval = cast(bool)webkit_security_manager_uri_scheme_is_secure(cast(WebKitSecurityManager*)this._cPtr, _scheme);
    return _retval;
  }
}
