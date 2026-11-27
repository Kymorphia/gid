/// Module for [Auth] class
module gid.soup3.auth;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.uri;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.message;
import gid.soup3.types;

/**
    The abstract base class for handling authentication.
    
    Specific HTTP Authentication mechanisms are implemented by its subclasses,
    but applications never need to be aware of the specific subclasses being
    used.
    
    [gid.soup3.auth.Auth] objects store the authentication data associated with a given bit
    of web space. They are created automatically by [gid.soup3.session.Session].
*/
@gidGir("Auth", "AuthClass")
class Auth : gid.gobject2.object.ObjectWrap
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
    return cast(void function())soup_auth_get_type != &gidSymbolNotFound ? soup_auth_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupAuth";
  }

  /** Returns `this`, for use in `with` statements. */
  override Auth self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.auth.Auth]
      Returns: New builder object
  */
  static AuthGidBuilder builder() nothrow
  {
    return new AuthGidBuilder;
  }

  /**
      Get `authority` property.
      Returns: The authority (host:port) being authenticated to.
  */
  @property string authority() nothrow
  {
    return getAuthority();
  }

  /**
      Set `authority` property.
      Params:
        propval = The authority (host:port) being authenticated to.
  */
  @property void authority(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("authority", propval);
  }

  /**
      Get `realm` property.
      Returns: The authentication realm.
  */
  @property string realm() nothrow
  {
    return getRealm();
  }

  /**
      Set `realm` property.
      Params:
        propval = The authentication realm.
  */
  @property void realm(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("realm", propval);
  }

  /**
      Get `schemeName` property.
      Returns: The authentication scheme name.
  */
  @property string schemeName() nothrow
  {
    return getSchemeName();
  }

  /**
      Creates a new [gid.soup3.auth.Auth] of type type with the information from
      msg and auth_header.
      
      This is called by [gid.soup3.session.Session]; you will normally not create auths
      yourself.
  
      Params:
        type = the type of auth to create (a subtype of [gid.soup3.auth.Auth])
        msg = the #SoupMessage the auth is being created for
        authHeader = the WWW-Authenticate/Proxy-Authenticate header
      Returns: the new [gid.soup3.auth.Auth], or null if it could
          not be created
  */
  this(gid.gobject2.types.GType type, gid.soup3.message.Message msg, string authHeader) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      SoupAuth* _cretval;
      const(char)* _authHeader = authHeader.toCString!(No.Malloc, No.Nullable);
      _cretval = soup_auth_new(type, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, _authHeader);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Call this on an auth to authenticate it.
      
      Normally this will cause the auth's message to be requeued with the new
      authentication info.
  
      Params:
        username = the username provided by the user or client
        password = the password provided by the user or client
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAuthenticate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncAuthenticate(string username, string password)
  {
    auto _klass = cast(SoupAuthClass*)_vfuncClass;
    if (!_klass.authenticate)
      return;

    const(char)* _username = username.toCString!(No.Malloc, No.Nullable);
    const(char)* _password = password.toCString!(No.Malloc, No.Nullable);
    _klass.authenticate(cast(SoupAuth*)this._cPtr, _username, _password);
  }

  /**
      Tests if auth is able to authenticate by providing credentials to the
      [gid.soup3.auth.Auth.authenticate].
      Returns: true if auth is able to accept credentials.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCanAuthenticate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncCanAuthenticate()
  {
    auto _klass = cast(SoupAuthClass*)_vfuncClass;
    if (!_klass.canAuthenticate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canAuthenticate(cast(SoupAuth*)this._cPtr);
    return _retval;
  }

  /**
      Generates an appropriate "Authorization" header for msg.
      
      (The session will only call this if [gid.soup3.auth.Auth.isAuthenticated] returned
      true.)
  
      Params:
        msg = the #SoupMessage to be authorized
      Returns: the "Authorization" header, which must be freed.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetAuthorization` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected string vfuncGetAuthorization(gid.soup3.message.Message msg)
  {
    auto _klass = cast(SoupAuthClass*)_vfuncClass;
    if (!_klass.getAuthorization)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getAuthorization(cast(SoupAuth*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns a list of paths on the server which auth extends over.
      
      (All subdirectories of these paths are also assumed to be part
      of auth's protection space, unless otherwise discovered not to
      be.)
  
      Params:
        sourceUri = the URI of the request that auth was generated in
            response to. (modified in place, changes are seen by the caller)
      Returns: the list of
          paths, which can be freed with [gid.soup3.auth.Auth.freeProtectionSpace].
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetProtectionSpace` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected string[] vfuncGetProtectionSpace(gid.glib2.uri.Uri sourceUri)
  {
    auto _klass = cast(SoupAuthClass*)_vfuncClass;
    if (!_klass.getProtectionSpace)
      return typeof(return).init;

    GSList* _cretval;
    _cretval = _klass.getProtectionSpace(cast(SoupAuth*)this._cPtr, sourceUri ? cast(GUri*)sourceUri._cPtr(No.Dup) : null);
    auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Tests if auth has been given a username and password.
      Returns: true if auth has been given a username and password
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsAuthenticated` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncIsAuthenticated()
  {
    auto _klass = cast(SoupAuthClass*)_vfuncClass;
    if (!_klass.isAuthenticated)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isAuthenticated(cast(SoupAuth*)this._cPtr);
    return _retval;
  }

  /**
      Tests if auth is ready to make a request for msg with.
      
      For most auths, this is equivalent to [gid.soup3.auth.Auth.isAuthenticated], but for
      some auth types (eg, NTLM), the auth may be sendable (eg, as an
      authentication request) even before it is authenticated.
  
      Params:
        msg = a #SoupMessage
      Returns: true if auth is ready to make a request with.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsReady` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncIsReady(gid.soup3.message.Message msg)
  {
    auto _klass = cast(SoupAuthClass*)_vfuncClass;
    if (!_klass.isReady)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isReady(cast(SoupAuth*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Call this on an auth to authenticate it.
      
      Normally this will cause the auth's message to be requeued with the new
      authentication info.
  
      Params:
        username = the username provided by the user or client
        password = the password provided by the user or client
  */
  void authenticate(string username, string password) nothrow
  {
    const(char)* _username = username.toCString!(No.Malloc, No.Nullable);
    const(char)* _password = password.toCString!(No.Malloc, No.Nullable);
    soup_auth_authenticate(cast(SoupAuth*)this._cPtr, _username, _password);
  }

  /**
      Tests if auth is able to authenticate by providing credentials to the
      [gid.soup3.auth.Auth.authenticate].
      Returns: true if auth is able to accept credentials.
  */
  bool canAuthenticate() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_auth_can_authenticate(cast(SoupAuth*)this._cPtr);
    return _retval;
  }

  /**
      Call this on an auth to cancel it.
      
      You need to cancel an auth to complete an asynchronous authenticate operation
      when no credentials are provided ([gid.soup3.auth.Auth.authenticate] is not called).
      The [gid.soup3.auth.Auth] will be cancelled on dispose if it hasn't been authenticated.
  */
  void cancel() nothrow
  {
    soup_auth_cancel(cast(SoupAuth*)this._cPtr);
  }

  /**
      Returns the authority (host:port) that auth is associated with.
      Returns: the authority
  */
  string getAuthority() nothrow
  {
    const(char)* _cretval;
    _cretval = soup_auth_get_authority(cast(SoupAuth*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Generates an appropriate "Authorization" header for msg.
      
      (The session will only call this if [gid.soup3.auth.Auth.isAuthenticated] returned
      true.)
  
      Params:
        msg = the #SoupMessage to be authorized
      Returns: the "Authorization" header, which must be freed.
  */
  string getAuthorization(gid.soup3.message.Message msg) nothrow
  {
    char* _cretval;
    _cretval = soup_auth_get_authorization(cast(SoupAuth*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets an opaque identifier for auth.
      
      The identifier can be used as a hash key or the like. [gid.soup3.auth.Auth] objects from
      the same server with the same identifier refer to the same authentication
      domain (eg, the URLs associated with them take the same usernames and
      passwords).
      Returns: the identifier
  */
  string getInfo() nothrow
  {
    char* _cretval;
    _cretval = soup_auth_get_info(cast(SoupAuth*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns a list of paths on the server which auth extends over.
      
      (All subdirectories of these paths are also assumed to be part
      of auth's protection space, unless otherwise discovered not to
      be.)
  
      Params:
        sourceUri = the URI of the request that auth was generated in
            response to.
      Returns: the list of
          paths, which can be freed with [gid.soup3.auth.Auth.freeProtectionSpace].
  */
  string[] getProtectionSpace(gid.glib2.uri.Uri sourceUri) nothrow
  {
    GSList* _cretval;
    _cretval = soup_auth_get_protection_space(cast(SoupAuth*)this._cPtr, sourceUri ? cast(GUri*)sourceUri._cPtr(No.Dup) : null);
    auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns auth's realm.
      
      This is an identifier that distinguishes separate authentication spaces on a
      given server, and may be some string that is meaningful to the user.
      (Although it is probably not localized.)
      Returns: the realm name
  */
  string getRealm() nothrow
  {
    const(char)* _cretval;
    _cretval = soup_auth_get_realm(cast(SoupAuth*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      soup_auth_get_scheme_name: (attributes org.gtk.Method.get_property=scheme-name)
      Returns auth's scheme name. (Eg, "Basic", "Digest", or "NTLM")
      Returns: the scheme name
  */
  string getSchemeName() nothrow
  {
    const(char)* _cretval;
    _cretval = soup_auth_get_scheme_name(cast(SoupAuth*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Tests if auth has been given a username and password.
      Returns: true if auth has been given a username and password
  */
  bool isAuthenticated() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_auth_is_authenticated(cast(SoupAuth*)this._cPtr);
    return _retval;
  }

  /**
      Tests if auth has been cancelled
      Returns: true if auth has been cancelled
  */
  bool isCancelled() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_auth_is_cancelled(cast(SoupAuth*)this._cPtr);
    return _retval;
  }

  /**
      Tests whether or not auth is associated with a proxy server rather
      than an "origin" server.
      Returns: true or false
  */
  bool isForProxy() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_auth_is_for_proxy(cast(SoupAuth*)this._cPtr);
    return _retval;
  }

  /**
      Tests if auth is ready to make a request for msg with.
      
      For most auths, this is equivalent to [gid.soup3.auth.Auth.isAuthenticated], but for
      some auth types (eg, NTLM), the auth may be sendable (eg, as an
      authentication request) even before it is authenticated.
  
      Params:
        msg = a #SoupMessage
      Returns: true if auth is ready to make a request with.
  */
  bool isReady(gid.soup3.message.Message msg) nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_auth_is_ready(cast(SoupAuth*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Updates auth with the information from msg and auth_header,
      possibly un-authenticating it.
      
      As with [gid.soup3.auth.Auth.new_], this is normally only used by [gid.soup3.session.Session].
  
      Params:
        msg = the #SoupMessage auth is being updated for
        authHeader = the WWW-Authenticate/Proxy-Authenticate header
      Returns: true if auth is still a valid (but potentially
          unauthenticated) [gid.soup3.auth.Auth]. false if something about auth_params
          could not be parsed or incorporated into auth at all.
  */
  bool update(gid.soup3.message.Message msg, string authHeader) nothrow
  {
    bool _retval;
    const(char)* _authHeader = authHeader.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)soup_auth_update(cast(SoupAuth*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, _authHeader);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Auth
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.soup3.auth.Auth), T.stringof ~ " is not derived from gid.soup3.auth.Auth");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAuthenticate", true)[0]) == gid.soup3.auth.Auth))
      _installVfunc(klass, "authenticate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCanAuthenticate", true)[0]) == gid.soup3.auth.Auth))
      _installVfunc(klass, "can_authenticate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetAuthorization", true)[0]) == gid.soup3.auth.Auth))
      _installVfunc(klass, "get_authorization");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetProtectionSpace", true)[0]) == gid.soup3.auth.Auth))
      _installVfunc(klass, "get_protection_space");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsAuthenticated", true)[0]) == gid.soup3.auth.Auth))
      _installVfunc(klass, "is_authenticated");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsReady", true)[0]) == gid.soup3.auth.Auth))
      _installVfunc(klass, "is_ready");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(SoupAuthClass*)klass;

    switch (vfunc)
    {
      case "authenticate":
      {
        static extern(C) void _vfuncAuthenticateTramp(SoupAuth* auth, const(char)* username, const(char)* password) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.auth.Auth)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)auth);
          if (!_obj)
          {
            auto _klass = cast(SoupAuthClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)auth);
            if (_klass.authenticate)
              return (cast(typeof(&_vfuncAuthenticateTramp))_klass.authenticate)(auth, username, password);
            return;
          }

          string _username = username.fromCString!(No.Free);
          string _password = password.fromCString!(No.Free);

          try
          {
            _obj.vfuncAuthenticate(_username, _password);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.auth.Auth.vfuncAuthenticate");
          }
        }

        _klass.authenticate = cast(typeof(_klass.authenticate))&_vfuncAuthenticateTramp;
        break;
      }
      case "can_authenticate":
      {
        static extern(C) gboolean _vfuncCanAuthenticateTramp(SoupAuth* auth) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.auth.Auth)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)auth);
          if (!_obj)
          {
            auto _klass = cast(SoupAuthClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)auth);
            if (_klass.canAuthenticate)
              return (cast(typeof(&_vfuncCanAuthenticateTramp))_klass.canAuthenticate)(auth);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanAuthenticate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.auth.Auth.vfuncCanAuthenticate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canAuthenticate = cast(typeof(_klass.canAuthenticate))&_vfuncCanAuthenticateTramp;
        break;
      }
      case "get_authorization":
      {
        static extern(C) char* _vfuncGetAuthorizationTramp(SoupAuth* auth, SoupMessage* msg) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.auth.Auth)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)auth);
          if (!_obj)
          {
            auto _klass = cast(SoupAuthClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)auth);
            if (_klass.getAuthorization)
              return (cast(typeof(&_vfuncGetAuthorizationTramp))_klass.getAuthorization)(auth, msg);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetAuthorization(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(void*)msg, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.auth.Auth.vfuncGetAuthorization");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getAuthorization = cast(typeof(_klass.getAuthorization))&_vfuncGetAuthorizationTramp;
        break;
      }
      case "get_protection_space":
      {
        static extern(C) GSList* _vfuncGetProtectionSpaceTramp(SoupAuth* auth, GUri* sourceUri) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.auth.Auth)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)auth);
          if (!_obj)
          {
            auto _klass = cast(SoupAuthClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)auth);
            if (_klass.getProtectionSpace)
              return (cast(typeof(&_vfuncGetProtectionSpaceTramp))_klass.getProtectionSpace)(auth, sourceUri);
            return typeof(return).init;
          }

          string[] _dretval;
          auto _sourceUri = sourceUri ? new gid.glib2.uri.Uri(cast(void*)sourceUri, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetProtectionSpace(_sourceUri);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.auth.Auth.vfuncGetProtectionSpace");
          }
          auto _retval = gSListFromD!(string)(_dretval);
          if (_sourceUri)
            _sourceUri._cUnborrow;

          return _retval;
        }

        _klass.getProtectionSpace = cast(typeof(_klass.getProtectionSpace))&_vfuncGetProtectionSpaceTramp;
        break;
      }
      case "is_authenticated":
      {
        static extern(C) gboolean _vfuncIsAuthenticatedTramp(SoupAuth* auth) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.auth.Auth)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)auth);
          if (!_obj)
          {
            auto _klass = cast(SoupAuthClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)auth);
            if (_klass.isAuthenticated)
              return (cast(typeof(&_vfuncIsAuthenticatedTramp))_klass.isAuthenticated)(auth);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsAuthenticated();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.auth.Auth.vfuncIsAuthenticated");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isAuthenticated = cast(typeof(_klass.isAuthenticated))&_vfuncIsAuthenticatedTramp;
        break;
      }
      case "is_ready":
      {
        static extern(C) gboolean _vfuncIsReadyTramp(SoupAuth* auth, SoupMessage* msg) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.auth.Auth)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)auth);
          if (!_obj)
          {
            auto _klass = cast(SoupAuthClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)auth);
            if (_klass.isReady)
              return (cast(typeof(&_vfuncIsReadyTramp))_klass.isReady)(auth, msg);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsReady(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(void*)msg, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.auth.Auth.vfuncIsReady");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isReady = cast(typeof(_klass.isReady))&_vfuncIsReadyTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.soup3.auth.Auth]
class AuthGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `authority` property.
      Params:
        propval = The authority (host:port) being authenticated to.
      Returns: Builder instance for fluent chaining
  */
  T authority(string propval) nothrow
  {
    return setProperty("authority", propval);
  }

  /**
      Set `realm` property.
      Params:
        propval = The authentication realm.
      Returns: Builder instance for fluent chaining
  */
  T realm(string propval) nothrow
  {
    return setProperty("realm", propval);
  }
}

/// Fluent builder for [gid.soup3.auth.Auth]
final class AuthGidBuilder : AuthGidBuilderImpl!AuthGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Auth build() nothrow
  {
    return new Auth(cast(void*)createGObject(Auth._getGType), Yes.Take);
  }
}
