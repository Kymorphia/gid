/// Module for [AuthDigest] class
module gid.soup3.auth_digest;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.soup3.auth;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/**
    HTTP "Digest" authentication.
    
    [gid.soup3.session.Session]s support this by default; if you want to disable
    support for it, call [gid.soup3.session.Session.removeFeatureByType]
    passing `SOUP_TYPE_AUTH_DIGEST`.
*/
class AuthDigest : gid.soup3.auth.Auth
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
    return cast(void function())soup_auth_digest_get_type != &gidSymbolNotFound ? soup_auth_digest_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupAuthDigest";
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthDigest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.auth_digest.AuthDigest]
      Returns: New builder object
  */
  static AuthDigestGidBuilder builder() nothrow
  {
    return new AuthDigestGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.soup3.auth_digest.AuthDigest]
class AuthDigestGidBuilderImpl(T) : gid.soup3.auth.AuthGidBuilderImpl!T
{
}

/// Fluent builder for [gid.soup3.auth_digest.AuthDigest]
final class AuthDigestGidBuilder : AuthDigestGidBuilderImpl!AuthDigestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AuthDigest build() nothrow
  {
    return new AuthDigest(cast(void*)createGObject(AuthDigest._getGType), Yes.Take);
  }
}
