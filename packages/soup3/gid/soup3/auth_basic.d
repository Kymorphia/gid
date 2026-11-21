/// Module for [AuthBasic] class
module gid.soup3.auth_basic;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.soup3.auth;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/**
    HTTP "Basic" authentication.
    
    [gid.soup3.session.Session]s support this by default; if you want to disable
    support for it, call [gid.soup3.session.Session.removeFeatureByType],
    passing `SOUP_TYPE_AUTH_BASIC`.
*/
class AuthBasic : gid.soup3.auth.Auth
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
    return cast(void function())soup_auth_basic_get_type != &gidSymbolNotFound ? soup_auth_basic_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupAuthBasic";
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthBasic self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.auth_basic.AuthBasic]
      Returns: New builder object
  */
  static AuthBasicGidBuilder builder() nothrow
  {
    return new AuthBasicGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.soup3.auth_basic.AuthBasic]
class AuthBasicGidBuilderImpl(T) : gid.soup3.auth.AuthGidBuilderImpl!T
{
}

/// Fluent builder for [gid.soup3.auth_basic.AuthBasic]
final class AuthBasicGidBuilder : AuthBasicGidBuilderImpl!AuthBasicGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AuthBasic build() nothrow
  {
    return new AuthBasic(cast(void*)createGObject(AuthBasic._getGType), Yes.Take);
  }
}
