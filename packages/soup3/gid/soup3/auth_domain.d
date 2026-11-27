/// Module for [AuthDomain] class
module gid.soup3.auth_domain;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.server_message;
import gid.soup3.types;

/**
    Server-side authentication.
    
    A [gid.soup3.auth_domain.AuthDomain] manages authentication for all or part of a
    [gid.soup3.server.Server]. To make a server require authentication, first create
    an appropriate subclass of [gid.soup3.auth_domain.AuthDomain], and then add it to the
    server with [gid.soup3.server.Server.addAuthDomain].
    
    In order for an auth domain to have any effect, you must add one or more
    paths to it (via [gid.soup3.auth_domain.AuthDomain.addPath]). To require authentication for
    all ordinary requests, add the path `"/"`. (Note that this does not include
    the special `"*"` URI (eg, "OPTIONS *"), which must be added as a separate
    path if you want to cover it.)
    
    If you need greater control over which requests should and shouldn't be
    authenticated, add paths covering everything you *might* want authenticated,
    and then use a filter ([gid.soup3.auth_domain.AuthDomain.setFilter] to bypass
    authentication for those requests that don't need it.
*/
@gidGir("AuthDomain", "AuthDomainClass")
class AuthDomain : gid.gobject2.object.ObjectWrap
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
    return cast(void function())soup_auth_domain_get_type != &gidSymbolNotFound ? soup_auth_domain_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupAuthDomain";
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthDomain self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.auth_domain.AuthDomain]
      Returns: New builder object
  */
  static AuthDomainGidBuilder builder() nothrow
  {
    return new AuthDomainGidBuilder;
  }

  /**
      Get `filterData` property.
      Returns: Data to pass to the [gid.soup3.types.AuthDomainFilter].
  */
  @property void* filterData() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(void*)("filter-data");
  }

  /**
      Set `filterData` property.
      Params:
        propval = Data to pass to the [gid.soup3.types.AuthDomainFilter].
  */
  @property void filterData(void* propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(void*)("filter-data", propval);
  }

  /**
      Get `genericAuthData` property.
      Returns: The data to pass to the [gid.soup3.types.AuthDomainGenericAuthCallback].
  */
  @property void* genericAuthData() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(void*)("generic-auth-data");
  }

  /**
      Set `genericAuthData` property.
      Params:
        propval = The data to pass to the [gid.soup3.types.AuthDomainGenericAuthCallback].
  */
  @property void genericAuthData(void* propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(void*)("generic-auth-data", propval);
  }

  /**
      Get `proxy` property.
      Returns: Whether or not this is a proxy auth domain.
  */
  @property bool proxy() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("proxy");
  }

  /**
      Get `realm` property.
      Returns: The realm of this auth domain.
  */
  @property string realm() nothrow
  {
    return getRealm();
  }

  /** */
  protected string vfuncAccepts(gid.soup3.server_message.ServerMessage msg, string header)
  {
    auto _klass = cast(SoupAuthDomainClass*)_vfuncClass;
    if (!_klass.accepts)
      return typeof(return).init;

    char* _cretval;
    const(char)* _header = header.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.accepts(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null, _header);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Adds a "WWW-Authenticate" or "Proxy-Authenticate" header to msg.
      
      It requests that the client authenticate, and sets msg's status accordingly.
      
      This is used by [gid.soup3.server.Server] internally and is probably of no use to
      anyone else.
  
      Params:
        msg = a #SoupServerMessage
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChallenge` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected string vfuncChallenge(gid.soup3.server_message.ServerMessage msg)
  {
    auto _klass = cast(SoupAuthDomainClass*)_vfuncClass;
    if (!_klass.challenge)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.challenge(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Checks if msg authenticates to domain via username and
      password.
      
      This would normally be called from a
      [gid.soup3.types.AuthDomainGenericAuthCallback].
  
      Params:
        msg = a #SoupServerMessage
        username = a username
        password = a password
      Returns: whether or not the message is authenticated
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCheckPassword` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncCheckPassword(gid.soup3.server_message.ServerMessage msg, string username, string password)
  {
    auto _klass = cast(SoupAuthDomainClass*)_vfuncClass;
    if (!_klass.checkPassword)
      return typeof(return).init;

    bool _retval;
    const(char)* _username = username.toCString!(No.Malloc, No.Nullable);
    const(char)* _password = password.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.checkPassword(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null, _username, _password);
    return _retval;
  }

  /**
      Checks if msg contains appropriate authorization for domain to
      accept it.
      
      Mirroring [gid.soup3.auth_domain.AuthDomain.covers], this does not check whether or not
      domain *cares* if msg is authorized.
      
      This is used by [gid.soup3.server.Server] internally and is probably of no use to
      anyone else.
  
      Params:
        msg = a #SoupServerMessage
      Returns: the username that msg has authenticated
          as, if in fact it has authenticated. null otherwise.
  */
  string accepts(gid.soup3.server_message.ServerMessage msg) nothrow
  {
    char* _cretval;
    _cretval = soup_auth_domain_accepts(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Adds path to domain.
      
      Requests under path on domain's server will require authentication (unless
      overridden by [gid.soup3.auth_domain.AuthDomain.removePath] or
      [gid.soup3.auth_domain.AuthDomain.setFilter]).
  
      Params:
        path = the path to add to domain
  */
  void addPath(string path) nothrow
  {
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    soup_auth_domain_add_path(cast(SoupAuthDomain*)this._cPtr, _path);
  }

  /**
      Adds a "WWW-Authenticate" or "Proxy-Authenticate" header to msg.
      
      It requests that the client authenticate, and sets msg's status accordingly.
      
      This is used by [gid.soup3.server.Server] internally and is probably of no use to
      anyone else.
  
      Params:
        msg = a #SoupServerMessage
  */
  void challenge(gid.soup3.server_message.ServerMessage msg) nothrow
  {
    soup_auth_domain_challenge(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null);
  }

  /**
      Checks if msg authenticates to domain via username and
      password.
      
      This would normally be called from a
      [gid.soup3.types.AuthDomainGenericAuthCallback].
  
      Params:
        msg = a #SoupServerMessage
        username = a username
        password = a password
      Returns: whether or not the message is authenticated
  */
  bool checkPassword(gid.soup3.server_message.ServerMessage msg, string username, string password) nothrow
  {
    bool _retval;
    const(char)* _username = username.toCString!(No.Malloc, No.Nullable);
    const(char)* _password = password.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)soup_auth_domain_check_password(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null, _username, _password);
    return _retval;
  }

  /**
      Checks if domain requires msg to be authenticated (according to
      its paths and filter function).
      
      This does not actually look at whether msg *is* authenticated, merely
      whether or not it needs to be.
      
      This is used by [gid.soup3.server.Server] internally and is probably of no use to
      anyone else.
  
      Params:
        msg = a #SoupServerMessage
      Returns: true if domain requires msg to be authenticated
  */
  bool covers(gid.soup3.server_message.ServerMessage msg) nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_auth_domain_covers(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the realm name associated with domain.
      Returns: domain's realm
  */
  string getRealm() nothrow
  {
    const(char)* _cretval;
    _cretval = soup_auth_domain_get_realm(cast(SoupAuthDomain*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Removes path from domain.
      
      Requests under path on domain's server will NOT require
      authentication.
      
      This is not simply an undo-er for [gid.soup3.auth_domain.AuthDomain.addPath]; it
      can be used to "carve out" a subtree that does not require
      authentication inside a hierarchy that does. Note also that unlike
      with [gid.soup3.auth_domain.AuthDomain.addPath], this cannot be overridden by
      adding a filter, as filters can only bypass authentication that
      would otherwise be required, not require it where it would
      otherwise be unnecessary.
  
      Params:
        path = the path to remove from domain
  */
  void removePath(string path) nothrow
  {
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    soup_auth_domain_remove_path(cast(SoupAuthDomain*)this._cPtr, _path);
  }

  /**
      Adds filter as an authentication filter to domain.
      
      The filter gets a chance to bypass authentication for certain requests that
      would otherwise require it. Eg, it might check the message's path in some way
      that is too complicated to do via the other methods, or it might check the
      message's method, and allow GETs but not PUTs.
      
      The filter function returns true if the request should still
      require authentication, or false if authentication is unnecessary
      for this request.
      
      To help prevent security holes, your filter should return true by
      default, and only return false under specifically-tested
      circumstances, rather than the other way around. Eg, in the example
      above, where you want to authenticate PUTs but not GETs, you should
      check if the method is GET and return false in that case, and then
      return true for all other methods (rather than returning true for
      PUT and false for all other methods). This way if it turned out
      (now or later) that some paths supported additional methods besides
      GET and PUT, those methods would default to being NOT allowed for
      unauthenticated users.
      
      You can also set the filter by setting the SoupAuthDomain:filter
      and [gid.soup3.auth_domain.AuthDomain.filterData], which can also be
      used to set the filter at construct time.
  
      Params:
        filter = the auth filter for domain
  */
  void setFilter(gid.soup3.types.AuthDomainFilter filter) nothrow
  {
    extern(C) gboolean _filterCallback(SoupAuthDomain* domain, SoupServerMessage* msg, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.soup3.types.AuthDomainFilter*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.auth_domain.AuthDomain)(cast(void*)domain, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.server_message.ServerMessage)(cast(void*)msg, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.types.AuthDomainFilter");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _filterCB = filter ? &_filterCallback : null;
    auto _filter = filter ? freezeDelegate(cast(void*)&filter) : null;
    GDestroyNotify _filterDestroyCB = filter ? &thawDelegate : null;
    soup_auth_domain_set_filter(cast(SoupAuthDomain*)this._cPtr, _filterCB, _filter, _filterDestroyCB);
  }

  /**
      Sets auth_callback as an authentication-handling callback for domain.
      
      Whenever a request comes in to domain which cannot be authenticated via a
      domain-specific auth callback (eg, [gid.soup3.types.AuthDomainDigestAuthCallback]),
      the generic auth callback will be invoked. See
      [gid.soup3.types.AuthDomainGenericAuthCallback] for information on what the callback
      should do.
  
      Params:
        authCallback = the auth callback
  */
  void setGenericAuthCallback(gid.soup3.types.AuthDomainGenericAuthCallback authCallback) nothrow
  {
    extern(C) gboolean _authCallbackCallback(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.soup3.types.AuthDomainGenericAuthCallback*)userData;
      string _username = username.fromCString!(No.Free);

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.auth_domain.AuthDomain)(cast(void*)domain, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.server_message.ServerMessage)(cast(void*)msg, No.Take), _username);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.types.AuthDomainGenericAuthCallback");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _authCallbackCB = authCallback ? &_authCallbackCallback : null;
    auto _authCallback = authCallback ? freezeDelegate(cast(void*)&authCallback) : null;
    GDestroyNotify _authCallbackDestroyCB = authCallback ? &thawDelegate : null;
    soup_auth_domain_set_generic_auth_callback(cast(SoupAuthDomain*)this._cPtr, _authCallbackCB, _authCallback, _authCallbackDestroyCB);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from AuthDomain
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.soup3.auth_domain.AuthDomain), T.stringof ~ " is not derived from gid.soup3.auth_domain.AuthDomain");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAccepts", true)[0]) == gid.soup3.auth_domain.AuthDomain))
      _installVfunc(klass, "accepts");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChallenge", true)[0]) == gid.soup3.auth_domain.AuthDomain))
      _installVfunc(klass, "challenge");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCheckPassword", true)[0]) == gid.soup3.auth_domain.AuthDomain))
      _installVfunc(klass, "check_password");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(SoupAuthDomainClass*)klass;

    switch (vfunc)
    {
      case "accepts":
      {
        static extern(C) char* _vfuncAcceptsTramp(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* header) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.auth_domain.AuthDomain)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)domain);
          if (!_obj)
          {
            auto _klass = cast(SoupAuthDomainClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)domain);
            if (_klass.accepts)
              return (cast(typeof(&_vfuncAcceptsTramp))_klass.accepts)(domain, msg, header);
            return typeof(return).init;
          }

          string _dretval;
          string _header = header.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncAccepts(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.server_message.ServerMessage)(cast(void*)msg, No.Take), _header);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.auth_domain.AuthDomain.vfuncAccepts");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.accepts = cast(typeof(_klass.accepts))&_vfuncAcceptsTramp;
        break;
      }
      case "challenge":
      {
        static extern(C) char* _vfuncChallengeTramp(SoupAuthDomain* domain, SoupServerMessage* msg) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.auth_domain.AuthDomain)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)domain);
          if (!_obj)
          {
            auto _klass = cast(SoupAuthDomainClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)domain);
            if (_klass.challenge)
              return (cast(typeof(&_vfuncChallengeTramp))_klass.challenge)(domain, msg);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncChallenge(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.server_message.ServerMessage)(cast(void*)msg, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.auth_domain.AuthDomain.vfuncChallenge");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.challenge = cast(typeof(_klass.challenge))&_vfuncChallengeTramp;
        break;
      }
      case "check_password":
      {
        static extern(C) gboolean _vfuncCheckPasswordTramp(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.auth_domain.AuthDomain)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)domain);
          if (!_obj)
          {
            auto _klass = cast(SoupAuthDomainClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)domain);
            if (_klass.checkPassword)
              return (cast(typeof(&_vfuncCheckPasswordTramp))_klass.checkPassword)(domain, msg, username, password);
            return typeof(return).init;
          }

          bool _dretval;
          string _username = username.fromCString!(No.Free);
          string _password = password.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncCheckPassword(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.server_message.ServerMessage)(cast(void*)msg, No.Take), _username, _password);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.auth_domain.AuthDomain.vfuncCheckPassword");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.checkPassword = cast(typeof(_klass.checkPassword))&_vfuncCheckPasswordTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.soup3.auth_domain.AuthDomain]
class AuthDomainGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `filterData` property.
      Params:
        propval = Data to pass to the [gid.soup3.types.AuthDomainFilter].
      Returns: Builder instance for fluent chaining
  */
  T filterData(void* propval) nothrow
  {
    return setProperty("filter-data", propval);
  }

  /**
      Set `genericAuthData` property.
      Params:
        propval = The data to pass to the [gid.soup3.types.AuthDomainGenericAuthCallback].
      Returns: Builder instance for fluent chaining
  */
  T genericAuthData(void* propval) nothrow
  {
    return setProperty("generic-auth-data", propval);
  }

  /**
      Set `proxy` property.
      Params:
        propval = Whether or not this is a proxy auth domain.
      Returns: Builder instance for fluent chaining
  */
  T proxy(bool propval) nothrow
  {
    return setProperty("proxy", propval);
  }

  /**
      Set `realm` property.
      Params:
        propval = The realm of this auth domain.
      Returns: Builder instance for fluent chaining
  */
  T realm(string propval) nothrow
  {
    return setProperty("realm", propval);
  }
}

/// Fluent builder for [gid.soup3.auth_domain.AuthDomain]
final class AuthDomainGidBuilder : AuthDomainGidBuilderImpl!AuthDomainGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AuthDomain build() nothrow
  {
    return new AuthDomain(cast(void*)createGObject(AuthDomain._getGType), Yes.Take);
  }
}
