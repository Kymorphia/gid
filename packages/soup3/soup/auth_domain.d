/// Module for [AuthDomain] class
module soup.auth_domain;

import gid.gid;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.server_message;
import soup.types;

/**
    Server-side authentication.
    
    A #SoupAuthDomain manages authentication for all or part of a
    `class@Server`. To make a server require authentication, first create
    an appropriate subclass of #SoupAuthDomain, and then add it to the
    server with [soup.server.Server.addAuthDomain].
    
    In order for an auth domain to have any effect, you must add one or more
    paths to it (via [soup.auth_domain.AuthDomain.addPath]). To require authentication for
    all ordinary requests, add the path `"/"`. (Note that this does not include
    the special `"*"` URI (eg, "OPTIONS *"), which must be added as a separate
    path if you want to cover it.)
    
    If you need greater control over which requests should and shouldn't be
    authenticated, add paths covering everything you *might* want authenticated,
    and then use a filter ([soup.auth_domain.AuthDomain.setFilter] to bypass
    authentication for those requests that don't need it.
*/
class AuthDomain : gobject.object.ObjectWrap
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
    return cast(void function())soup_auth_domain_get_type != &gidSymbolNotFound ? soup_auth_domain_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthDomain self()
  {
    return this;
  }

  /**
      Get `filter` property.
      Returns: The `callback@AuthDomainFilter` for the domain.
  */
  @property soup.types.AuthDomainFilter filter()
  {
    return gobject.object.ObjectWrap.getProperty!(soup.types.AuthDomainFilter)("filter");
  }

  /**
      Set `filter` property.
      Params:
        propval = The `callback@AuthDomainFilter` for the domain.
  */
  @property void filter(soup.types.AuthDomainFilter propval)
  {
    gobject.object.ObjectWrap.setProperty!(soup.types.AuthDomainFilter)("filter", propval);
  }

  /**
      Get `filterData` property.
      Returns: Data to pass to the `callback@AuthDomainFilter`.
  */
  @property void* filterData()
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("filter-data");
  }

  /**
      Set `filterData` property.
      Params:
        propval = Data to pass to the `callback@AuthDomainFilter`.
  */
  @property void filterData(void* propval)
  {
    gobject.object.ObjectWrap.setProperty!(void*)("filter-data", propval);
  }

  /**
      Get `genericAuthCallback` property.
      Returns: The `callback@AuthDomainGenericAuthCallback`.
  */
  @property soup.types.AuthDomainGenericAuthCallback genericAuthCallback()
  {
    return gobject.object.ObjectWrap.getProperty!(soup.types.AuthDomainGenericAuthCallback)("generic-auth-callback");
  }

  /**
      Set `genericAuthCallback` property.
      Params:
        propval = The `callback@AuthDomainGenericAuthCallback`.
  */
  @property void genericAuthCallback(soup.types.AuthDomainGenericAuthCallback propval)
  {
    gobject.object.ObjectWrap.setProperty!(soup.types.AuthDomainGenericAuthCallback)("generic-auth-callback", propval);
  }

  /**
      Get `genericAuthData` property.
      Returns: The data to pass to the `callback@AuthDomainGenericAuthCallback`.
  */
  @property void* genericAuthData()
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("generic-auth-data");
  }

  /**
      Set `genericAuthData` property.
      Params:
        propval = The data to pass to the `callback@AuthDomainGenericAuthCallback`.
  */
  @property void genericAuthData(void* propval)
  {
    gobject.object.ObjectWrap.setProperty!(void*)("generic-auth-data", propval);
  }

  /**
      Checks if msg contains appropriate authorization for domain to
      accept it.
      
      Mirroring [soup.auth_domain.AuthDomain.covers], this does not check whether or not
      domain *cares* if msg is authorized.
      
      This is used by `classServer` internally and is probably of no use to
      anyone else.
  
      Params:
        msg = a #SoupServerMessage
      Returns: the username that msg has authenticated
          as, if in fact it has authenticated. null otherwise.
  */
  string accepts(soup.server_message.ServerMessage msg)
  {
    char* _cretval;
    _cretval = soup_auth_domain_accepts(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Adds path to domain.
      
      Requests under path on domain's server will require authentication (unless
      overridden by [soup.auth_domain.AuthDomain.removePath] or
      [soup.auth_domain.AuthDomain.setFilter]).
  
      Params:
        path = the path to add to domain
  */
  void addPath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    soup_auth_domain_add_path(cast(SoupAuthDomain*)this._cPtr, _path);
  }

  /**
      Adds a "WWW-Authenticate" or "Proxy-Authenticate" header to msg.
      
      It requests that the client authenticate, and sets msg's status accordingly.
      
      This is used by `classServer` internally and is probably of no use to
      anyone else.
  
      Params:
        msg = a #SoupServerMessage
  */
  void challenge(soup.server_message.ServerMessage msg)
  {
    soup_auth_domain_challenge(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null);
  }

  /**
      Checks if msg authenticates to domain via username and
      password.
      
      This would normally be called from a
      `callbackAuthDomainGenericAuthCallback`.
  
      Params:
        msg = a #SoupServerMessage
        username = a username
        password = a password
      Returns: whether or not the message is authenticated
  */
  bool checkPassword(soup.server_message.ServerMessage msg, string username, string password)
  {
    bool _retval;
    const(char)* _username = username.toCString(No.Alloc);
    const(char)* _password = password.toCString(No.Alloc);
    _retval = cast(bool)soup_auth_domain_check_password(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null, _username, _password);
    return _retval;
  }

  /**
      Checks if domain requires msg to be authenticated (according to
      its paths and filter function).
      
      This does not actually look at whether msg *is* authenticated, merely
      whether or not it needs to be.
      
      This is used by `classServer` internally and is probably of no use to
      anyone else.
  
      Params:
        msg = a #SoupServerMessage
      Returns: true if domain requires msg to be authenticated
  */
  bool covers(soup.server_message.ServerMessage msg)
  {
    bool _retval;
    _retval = cast(bool)soup_auth_domain_covers(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the realm name associated with domain.
      Returns: domain's realm
  */
  string getRealm()
  {
    const(char)* _cretval;
    _cretval = soup_auth_domain_get_realm(cast(SoupAuthDomain*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Removes path from domain.
      
      Requests under path on domain's server will NOT require
      authentication.
      
      This is not simply an undo-er for [soup.auth_domain.AuthDomain.addPath]; it
      can be used to "carve out" a subtree that does not require
      authentication inside a hierarchy that does. Note also that unlike
      with [soup.auth_domain.AuthDomain.addPath], this cannot be overridden by
      adding a filter, as filters can only bypass authentication that
      would otherwise be required, not require it where it would
      otherwise be unnecessary.
  
      Params:
        path = the path to remove from domain
  */
  void removePath(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
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
      and `propertyAuthDomain:filter-data properties`, which can also be
      used to set the filter at construct time.
  
      Params:
        filter = the auth filter for domain
  */
  void setFilter(soup.types.AuthDomainFilter filter)
  {
    extern(C) gboolean _filterCallback(SoupAuthDomain* domain, SoupServerMessage* msg, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(soup.types.AuthDomainFilter*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.auth_domain.AuthDomain)(cast(void*)domain, No.Take), gobject.object.ObjectWrap._getDObject!(soup.server_message.ServerMessage)(cast(void*)msg, No.Take));
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
      domain-specific auth callback (eg, `callbackAuthDomainDigestAuthCallback`),
      the generic auth callback will be invoked. See
      `callbackAuthDomainGenericAuthCallback` for information on what the callback
      should do.
  
      Params:
        authCallback = the auth callback
  */
  void setGenericAuthCallback(soup.types.AuthDomainGenericAuthCallback authCallback)
  {
    extern(C) gboolean _authCallbackCallback(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(soup.types.AuthDomainGenericAuthCallback*)userData;
      string _username = username.fromCString(No.Free);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.auth_domain.AuthDomain)(cast(void*)domain, No.Take), gobject.object.ObjectWrap._getDObject!(soup.server_message.ServerMessage)(cast(void*)msg, No.Take), _username);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _authCallbackCB = authCallback ? &_authCallbackCallback : null;
    auto _authCallback = authCallback ? freezeDelegate(cast(void*)&authCallback) : null;
    GDestroyNotify _authCallbackDestroyCB = authCallback ? &thawDelegate : null;
    soup_auth_domain_set_generic_auth_callback(cast(SoupAuthDomain*)this._cPtr, _authCallbackCB, _authCallback, _authCallbackDestroyCB);
  }
}
