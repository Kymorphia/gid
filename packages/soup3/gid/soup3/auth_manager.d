/// Module for [AuthManager] class
module gid.soup3.auth_manager;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.uri;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.auth;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;
import gid.soup3.types;

/**
    HTTP client-side authentication handler.
    
    [gid.soup3.auth_manager.AuthManager] is the [gid.soup3.session_feature.SessionFeature] that handles HTTP
    authentication for a [gid.soup3.session.Session].
    
    A [gid.soup3.auth_manager.AuthManager] is added to the session by default, and normally
    you don't need to worry about it at all. However, if you want to
    disable HTTP authentication, you can remove the feature from the
    session with [gid.soup3.session.Session.removeFeatureByType] or disable it on
    individual requests with [gid.soup3.message.Message.disableFeature].
    
    You can use this with [gid.soup3.session.Session.removeFeatureByType] or
    [gid.soup3.message.Message.disableFeature].
    
    (Although this type has only been publicly visible since libsoup 2.42, it has
    always existed in the background, and you can use `g_type_from_name
    ("SoupAuthManager")` to get its [gid.gobject2.types.size_t] in earlier releases.)
*/
class AuthManager : gid.gobject2.object.ObjectWrap, gid.soup3.session_feature.SessionFeature
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_auth_manager_get_type != &gidSymbolNotFound ? soup_auth_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupAuthManager";
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthManager self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.auth_manager.AuthManager]
      Returns: New builder object
  */
  static AuthManagerGidBuilder builder() nothrow
  {
    return new AuthManagerGidBuilder;
  }

  mixin SessionFeatureT!();

  /**
      Clear all credentials cached by manager.
  */
  void clearCachedCredentials() nothrow
  {
    soup_auth_manager_clear_cached_credentials(cast(SoupAuthManager*)this._cPtr);
  }

  /**
      Records that auth is to be used under uri, as though a
      WWW-Authenticate header had been received at that URI.
      
      This can be used to "preload" manager's auth cache, to avoid an extra HTTP
      round trip in the case where you know ahead of time that a 401 response will
      be returned.
      
      This is only useful for authentication types where the initial
      Authorization header does not depend on any additional information
      from the server. (Eg, Basic or NTLM, but not Digest.)
  
      Params:
        uri = the #GUri under which auth is to be used
        auth = the #SoupAuth to use
  */
  void useAuth(gid.glib2.uri.Uri uri, gid.soup3.auth.Auth auth) nothrow
  {
    soup_auth_manager_use_auth(cast(SoupAuthManager*)this._cPtr, uri ? cast(GUri*)uri._cPtr(No.Dup) : null, auth ? cast(SoupAuth*)auth._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.soup3.auth_manager.AuthManager]
class AuthManagerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.soup3.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();
}

/// Fluent builder for [gid.soup3.auth_manager.AuthManager]
final class AuthManagerGidBuilder : AuthManagerGidBuilderImpl!AuthManagerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AuthManager build() nothrow
  {
    return new AuthManager(cast(void*)createGObject(AuthManager._getGType), Yes.Take);
  }
}
