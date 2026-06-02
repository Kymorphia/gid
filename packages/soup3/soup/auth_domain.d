/// Module for [AuthDomain] class
module soup.auth_domain;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.server_message;
import soup.types;

/**
    Server-side authentication.
    
    A #SoupAuthDomain manages authentication for all or part of a
    [soup.server.Server]. To make a server require authentication, first create
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_auth_domain_get_type != &gidSymbolNotFound ? soup_auth_domain_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthDomain self() nothrow
  {
    return this;
  }

  /**
      Get builder for [soup.auth_domain.AuthDomain]
      Returns: New builder object
  */
  static AuthDomainGidBuilder builder() nothrow
  {
    return new AuthDomainGidBuilder;
  }

  /**
      Get `filter` property.
      Returns: The [soup.types.AuthDomainFilter] for the domain.
  */
  @property soup.types.AuthDomainFilter filter() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(soup.types.AuthDomainFilter)("filter");
  }

  /**
      Set `filter` property.
      Params:
        propval = The [soup.types.AuthDomainFilter] for the domain.
  */
  @property void filter(soup.types.AuthDomainFilter propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(soup.types.AuthDomainFilter)("filter", propval);
  }

  /**
      Get `filterData` property.
      Returns: Data to pass to the [soup.types.AuthDomainFilter].
  */
  @property void* filterData() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("filter-data");
  }

  /**
      Set `filterData` property.
      Params:
        propval = Data to pass to the [soup.types.AuthDomainFilter].
  */
  @property void filterData(void* propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(void*)("filter-data", propval);
  }

  /**
      Get `genericAuthCallback` property.
      Returns: The [soup.types.AuthDomainGenericAuthCallback].
  */
  @property soup.types.AuthDomainGenericAuthCallback genericAuthCallback() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(soup.types.AuthDomainGenericAuthCallback)("generic-auth-callback");
  }

  /**
      Set `genericAuthCallback` property.
      Params:
        propval = The [soup.types.AuthDomainGenericAuthCallback].
  */
  @property void genericAuthCallback(soup.types.AuthDomainGenericAuthCallback propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(soup.types.AuthDomainGenericAuthCallback)("generic-auth-callback", propval);
  }

  /**
      Get `genericAuthData` property.
      Returns: The data to pass to the [soup.types.AuthDomainGenericAuthCallback].
  */
  @property void* genericAuthData() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("generic-auth-data");
  }

  /**
      Set `genericAuthData` property.
      Params:
        propval = The data to pass to the [soup.types.AuthDomainGenericAuthCallback].
  */
  @property void genericAuthData(void* propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(void*)("generic-auth-data", propval);
  }

  /**
      Get `proxy` property.
      Returns: Whether or not this is a proxy auth domain.
  */
  @property bool proxy() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("proxy");
  }

  /**
      Get `realm` property.
      Returns: The realm of this auth domain.
  */
  @property string realm() nothrow
  {
    return getRealm();
  }

  /**
      Checks if msg contains appropriate authorization for domain to
      accept it.
      
      Mirroring [soup.auth_domain.AuthDomain.covers], this does not check whether or not
      domain *cares* if msg is authorized.
      
      This is used by [soup.server.Server] internally and is probably of no use to
      anyone else.
  
      Params:
        msg = a #SoupServerMessage
      Returns: the username that msg has authenticated
          as, if in fact it has authenticated. null otherwise.
  */
  string accepts(soup.server_message.ServerMessage msg) nothrow
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
  void addPath(string path) nothrow
  {
    const(char)* _path = path.toCString(No.Alloc);
    soup_auth_domain_add_path(cast(SoupAuthDomain*)this._cPtr, _path);
  }

  /**
      Adds a "WWW-Authenticate" or "Proxy-Authenticate" header to msg.
      
      It requests that the client authenticate, and sets msg's status accordingly.
      
      This is used by [soup.server.Server] internally and is probably of no use to
      anyone else.
  
      Params:
        msg = a #SoupServerMessage
  */
  void challenge(soup.server_message.ServerMessage msg) nothrow
  {
    soup_auth_domain_challenge(cast(SoupAuthDomain*)this._cPtr, msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null);
  }

  /**
      Checks if msg authenticates to domain via username and
      password.
      
      This would normally be called from a
      [soup.types.AuthDomainGenericAuthCallback].
  
      Params:
        msg = a #SoupServerMessage
        username = a username
        password = a password
      Returns: whether or not the message is authenticated
  */
  bool checkPassword(soup.server_message.ServerMessage msg, string username, string password) nothrow
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
      
      This is used by [soup.server.Server] internally and is probably of no use to
      anyone else.
  
      Params:
        msg = a #SoupServerMessage
      Returns: true if domain requires msg to be authenticated
  */
  bool covers(soup.server_message.ServerMessage msg) nothrow
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
  void removePath(string path) nothrow
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
      and [soup.auth_domain.AuthDomain.filterData], which can also be
      used to set the filter at construct time.
  
      Params:
        filter = the auth filter for domain
  */
  void setFilter(soup.types.AuthDomainFilter filter) nothrow
  {
    extern(C) gboolean _filterCallback(SoupAuthDomain* domain, SoupServerMessage* msg, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(soup.types.AuthDomainFilter*)userData;

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.auth_domain.AuthDomain)(cast(void*)domain, No.Take), gobject.object.ObjectWrap._getDObject!(soup.server_message.ServerMessage)(cast(void*)msg, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "soup.types.AuthDomainFilter");
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
      domain-specific auth callback (eg, [soup.types.AuthDomainDigestAuthCallback]),
      the generic auth callback will be invoked. See
      [soup.types.AuthDomainGenericAuthCallback] for information on what the callback
      should do.
  
      Params:
        authCallback = the auth callback
  */
  void setGenericAuthCallback(soup.types.AuthDomainGenericAuthCallback authCallback) nothrow
  {
    extern(C) gboolean _authCallbackCallback(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(soup.types.AuthDomainGenericAuthCallback*)userData;
      string _username = username.fromCString(No.Free);

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.auth_domain.AuthDomain)(cast(void*)domain, No.Take), gobject.object.ObjectWrap._getDObject!(soup.server_message.ServerMessage)(cast(void*)msg, No.Take), _username);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "soup.types.AuthDomainGenericAuthCallback");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _authCallbackCB = authCallback ? &_authCallbackCallback : null;
    auto _authCallback = authCallback ? freezeDelegate(cast(void*)&authCallback) : null;
    GDestroyNotify _authCallbackDestroyCB = authCallback ? &thawDelegate : null;
    soup_auth_domain_set_generic_auth_callback(cast(SoupAuthDomain*)this._cPtr, _authCallbackCB, _authCallback, _authCallbackDestroyCB);
  }
}

/// Fluent builder implementation template for [soup.auth_domain.AuthDomain]
class AuthDomainGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `filter` property.
      Params:
        propval = The [soup.types.AuthDomainFilter] for the domain.
      Returns: Builder instance for fluent chaining
  */
  T filter(soup.types.AuthDomainFilter propval) nothrow
  {
    return setProperty("filter", propval);
  }

  /**
      Set `filterData` property.
      Params:
        propval = Data to pass to the [soup.types.AuthDomainFilter].
      Returns: Builder instance for fluent chaining
  */
  T filterData(void* propval) nothrow
  {
    return setProperty("filter-data", propval);
  }

  /**
      Set `genericAuthCallback` property.
      Params:
        propval = The [soup.types.AuthDomainGenericAuthCallback].
      Returns: Builder instance for fluent chaining
  */
  T genericAuthCallback(soup.types.AuthDomainGenericAuthCallback propval) nothrow
  {
    return setProperty("generic-auth-callback", propval);
  }

  /**
      Set `genericAuthData` property.
      Params:
        propval = The data to pass to the [soup.types.AuthDomainGenericAuthCallback].
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

/// Fluent builder for [soup.auth_domain.AuthDomain]
final class AuthDomainGidBuilder : AuthDomainGidBuilderImpl!AuthDomainGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AuthDomain build() nothrow
  {
    return new AuthDomain(cast(void*)createGObject(AuthDomain._getGType), No.Take);
  }
}
