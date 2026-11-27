/// Module for [AuthDomainBasic] class
module gid.soup3.auth_domain_basic;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.auth_domain;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.server_message;
import gid.soup3.types;

/**
    Server-side "Basic" authentication.
    
    [gid.soup3.auth_domain_basic.AuthDomainBasic] handles the server side of HTTP "Basic" (ie,
    cleartext password) authentication.
*/
@gidGir("AuthDomainBasic", "AuthDomainBasicClass")
class AuthDomainBasic : gid.soup3.auth_domain.AuthDomain
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
    return cast(void function())soup_auth_domain_basic_get_type != &gidSymbolNotFound ? soup_auth_domain_basic_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupAuthDomainBasic";
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthDomainBasic self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.auth_domain_basic.AuthDomainBasic]
      Returns: New builder object
  */
  static AuthDomainBasicGidBuilder builder() nothrow
  {
    return new AuthDomainBasicGidBuilder;
  }

  /**
      Get `authData` property.
      Returns: The data to pass to the [gid.soup3.types.AuthDomainBasicAuthCallback].
  */
  @property void* authData() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(void*)("auth-data");
  }

  /**
      Set `authData` property.
      Params:
        propval = The data to pass to the [gid.soup3.types.AuthDomainBasicAuthCallback].
  */
  @property void authData(void* propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(void*)("auth-data", propval);
  }

  /**
      Sets the callback that domain will use to authenticate incoming
      requests.
      
      For each request containing authorization, domain will invoke the callback,
      and then either accept or reject the request based on callback's return
      value.
      
      You can also set the auth callback by setting the
      [gid.soup3.auth_domain_basic.AuthDomainBasic.authCallback] and
      [gid.soup3.auth_domain_basic.AuthDomainBasic.authData] properties, which can also be used to
      set the callback at construct time.
  
      Params:
        callback = the callback
  */
  void setAuthCallback(gid.soup3.types.AuthDomainBasicAuthCallback callback) nothrow
  {
    extern(C) gboolean _callbackCallback(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.soup3.types.AuthDomainBasicAuthCallback*)userData;
      string _username = username.fromCString!(No.Free);
      string _password = password.fromCString!(No.Free);

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.auth_domain_basic.AuthDomainBasic)(cast(void*)domain, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.server_message.ServerMessage)(cast(void*)msg, No.Take), _username, _password);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.types.AuthDomainBasicAuthCallback");
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

/// Fluent builder implementation template for [gid.soup3.auth_domain_basic.AuthDomainBasic]
class AuthDomainBasicGidBuilderImpl(T) : gid.soup3.auth_domain.AuthDomainGidBuilderImpl!T
{

  /**
      Set `authData` property.
      Params:
        propval = The data to pass to the [gid.soup3.types.AuthDomainBasicAuthCallback].
      Returns: Builder instance for fluent chaining
  */
  T authData(void* propval) nothrow
  {
    return setProperty("auth-data", propval);
  }
}

/// Fluent builder for [gid.soup3.auth_domain_basic.AuthDomainBasic]
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
