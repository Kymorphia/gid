/// Module for [AuthDomainBasic] class
module soup.auth_domain_basic;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import soup.auth_domain;
import soup.c.functions;
import soup.c.types;
import soup.server_message;
import soup.types;

/**
    Server-side "Basic" authentication.
    
    #SoupAuthDomainBasic handles the server side of HTTP "Basic" (ie,
    cleartext password) authentication.
*/
class AuthDomainBasic : soup.auth_domain.AuthDomain
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
    return cast(void function())soup_auth_domain_basic_get_type != &gidSymbolNotFound ? soup_auth_domain_basic_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthDomainBasic self() nothrow
  {
    return this;
  }

  /**
      Get builder for [soup.auth_domain_basic.AuthDomainBasic]
      Returns: New builder object
  */
  static AuthDomainBasicGidBuilder builder() nothrow
  {
    return new AuthDomainBasicGidBuilder;
  }

  /**
      Get `authCallback` property.
      Returns: The [soup.types.AuthDomainBasicAuthCallback].
  */
  @property soup.types.AuthDomainBasicAuthCallback authCallback() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(soup.types.AuthDomainBasicAuthCallback)("auth-callback");
  }

  /**
      Set `authCallback` property.
      Params:
        propval = The [soup.types.AuthDomainBasicAuthCallback].
  */
  @property void authCallback(soup.types.AuthDomainBasicAuthCallback propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(soup.types.AuthDomainBasicAuthCallback)("auth-callback", propval);
  }

  /**
      Get `authData` property.
      Returns: The data to pass to the [soup.types.AuthDomainBasicAuthCallback].
  */
  @property void* authData() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("auth-data");
  }

  /**
      Set `authData` property.
      Params:
        propval = The data to pass to the [soup.types.AuthDomainBasicAuthCallback].
  */
  @property void authData(void* propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(void*)("auth-data", propval);
  }

  /**
      Sets the callback that domain will use to authenticate incoming
      requests.
      
      For each request containing authorization, domain will invoke the callback,
      and then either accept or reject the request based on callback's return
      value.
      
      You can also set the auth callback by setting the
      [soup.auth_domain_basic.AuthDomainBasic.authCallback] and
      [soup.auth_domain_basic.AuthDomainBasic.authData] properties, which can also be used to
      set the callback at construct time.
  
      Params:
        callback = the callback
  */
  void setAuthCallback(soup.types.AuthDomainBasicAuthCallback callback) nothrow
  {
    extern(C) gboolean _callbackCallback(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(soup.types.AuthDomainBasicAuthCallback*)userData;
      string _username = username.fromCString(No.Free);
      string _password = password.fromCString(No.Free);

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.auth_domain_basic.AuthDomainBasic)(cast(void*)domain, No.Take), gobject.object.ObjectWrap._getDObject!(soup.server_message.ServerMessage)(cast(void*)msg, No.Take), _username, _password);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "soup.types.AuthDomainBasicAuthCallback");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    soup_auth_domain_basic_set_auth_callback(cast(SoupAuthDomain*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }
}

/// Fluent builder implementation template for [soup.auth_domain_basic.AuthDomainBasic]
class AuthDomainBasicGidBuilderImpl(T) : soup.auth_domain.AuthDomainGidBuilderImpl!T
{

  /**
      Set `authCallback` property.
      Params:
        propval = The [soup.types.AuthDomainBasicAuthCallback].
      Returns: Builder instance for fluent chaining
  */
  T authCallback(soup.types.AuthDomainBasicAuthCallback propval) nothrow
  {
    return setProperty("auth-callback", propval);
  }

  /**
      Set `authData` property.
      Params:
        propval = The data to pass to the [soup.types.AuthDomainBasicAuthCallback].
      Returns: Builder instance for fluent chaining
  */
  T authData(void* propval) nothrow
  {
    return setProperty("auth-data", propval);
  }
}

/// Fluent builder for [soup.auth_domain_basic.AuthDomainBasic]
final class AuthDomainBasicGidBuilder : AuthDomainBasicGidBuilderImpl!AuthDomainBasicGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AuthDomainBasic build() nothrow
  {
    return new AuthDomainBasic(cast(void*)createGObject(AuthDomainBasic._getGType), Yes.Take);
  }
}
