/// Module for [AuthDigest] class
module soup.auth_digest;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import soup.auth;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    HTTP "Digest" authentication.
    
    [soup.session.Session]s support this by default; if you want to disable
    support for it, call [soup.session.Session.removeFeatureByType]
    passing `SOUP_TYPE_AUTH_DIGEST`.
*/
class AuthDigest : soup.auth.Auth
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
    return cast(void function())soup_auth_digest_get_type != &gidSymbolNotFound ? soup_auth_digest_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthDigest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [soup.auth_digest.AuthDigest]
      Returns: New builder object
  */
  static AuthDigestGidBuilder builder() nothrow
  {
    return new AuthDigestGidBuilder;
  }
}

/// Fluent builder implementation template for [soup.auth_digest.AuthDigest]
class AuthDigestGidBuilderImpl(T) : soup.auth.AuthGidBuilderImpl!T
{
}

/// Fluent builder for [soup.auth_digest.AuthDigest]
final class AuthDigestGidBuilder : AuthDigestGidBuilderImpl!AuthDigestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AuthDigest build() nothrow
  {
    return new AuthDigest(cast(void*)createGObject(AuthDigest._getGType), No.Take);
  }
}
