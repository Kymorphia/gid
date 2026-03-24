/// Module for [AuthBasic] class
module soup.auth_basic;

import gid.gid;
import gobject.gid_builder;
import soup.auth;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    HTTP "Basic" authentication.
    
    `class@Session`s support this by default; if you want to disable
    support for it, call [soup.session.Session.removeFeatureByType],
    passing `SOUP_TYPE_AUTH_BASIC`.
*/
class AuthBasic : soup.auth.Auth
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
    return cast(void function())soup_auth_basic_get_type != &gidSymbolNotFound ? soup_auth_basic_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthBasic self()
  {
    return this;
  }

  /**
  Get builder for [soup.auth_basic.AuthBasic]
  Returns: New builder object
  */
  static AuthBasicGidBuilder builder()
  {
    return new AuthBasicGidBuilder;
  }
}

class AuthBasicGidBuilderImpl(T) : soup.auth.AuthGidBuilderImpl!T
{
}

/// Fluent builder for [soup.auth_basic.AuthBasic]
final class AuthBasicGidBuilder : AuthBasicGidBuilderImpl!AuthBasicGidBuilder
{
  AuthBasic build()
  {
    return new AuthBasic(cast(void*)createGObject(AuthBasic._getGType), No.Take);
  }
}
