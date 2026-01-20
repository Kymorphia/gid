/// Module for [AuthDomainBasic] class
module soup.auth_domain_basic;

import gid.gid;
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_auth_domain_basic_get_type != &gidSymbolNotFound ? soup_auth_domain_basic_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthDomainBasic self()
  {
    return this;
  }

  /**
      Get `authCallback` property.
      Returns: The `callback@AuthDomainBasicAuthCallback`.
  */
  @property soup.types.AuthDomainBasicAuthCallback authCallback()
  {
    return gobject.object.ObjectWrap.getProperty!(soup.types.AuthDomainBasicAuthCallback)("auth-callback");
  }

  /**
      Set `authCallback` property.
      Params:
        propval = The `callback@AuthDomainBasicAuthCallback`.
  */
  @property void authCallback(soup.types.AuthDomainBasicAuthCallback propval)
  {
    gobject.object.ObjectWrap.setProperty!(soup.types.AuthDomainBasicAuthCallback)("auth-callback", propval);
  }

  /**
      Get `authData` property.
      Returns: The data to pass to the `callback@AuthDomainBasicAuthCallback`.
  */
  @property void* authData()
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("auth-data");
  }

  /**
      Set `authData` property.
      Params:
        propval = The data to pass to the `callback@AuthDomainBasicAuthCallback`.
  */
  @property void authData(void* propval)
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
      `propertyAuthDomainBasic:auth-callback` and
      `propertyAuthDomainBasic:auth-data` properties, which can also be used to
      set the callback at construct time.
  
      Params:
        callback = the callback
  */
  void setAuthCallback(soup.types.AuthDomainBasicAuthCallback callback)
  {
    extern(C) gboolean _callbackCallback(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(soup.types.AuthDomainBasicAuthCallback*)userData;
      string _username = username.fromCString(No.Free);
      string _password = password.fromCString(No.Free);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(soup.auth_domain_basic.AuthDomainBasic)(cast(void*)domain, No.Take), gobject.object.ObjectWrap._getDObject!(soup.server_message.ServerMessage)(cast(void*)msg, No.Take), _username, _password);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    soup_auth_domain_basic_set_auth_callback(cast(SoupAuthDomain*)this._cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }
}
