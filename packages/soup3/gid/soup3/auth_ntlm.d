/// Module for [AuthNTLM] class
module gid.soup3.auth_ntlm;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.soup3.auth;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/**
    HTTP-based NTLM authentication.
    
    [gid.soup3.session.Session]s do not support this type by default; if you want to
    enable support for it, call [gid.soup3.session.Session.addFeatureByType],
    passing `SOUP_TYPE_AUTH_NTLM`.
*/
class AuthNTLM : gid.soup3.auth.Auth
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
    return cast(void function())soup_auth_ntlm_get_type != &gidSymbolNotFound ? soup_auth_ntlm_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupAuthNTLM";
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthNTLM self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.auth_ntlm.AuthNTLM]
      Returns: New builder object
  */
  static AuthNTLMGidBuilder builder() nothrow
  {
    return new AuthNTLMGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.soup3.auth_ntlm.AuthNTLM]
class AuthNTLMGidBuilderImpl(T) : gid.soup3.auth.AuthGidBuilderImpl!T
{
}

/// Fluent builder for [gid.soup3.auth_ntlm.AuthNTLM]
final class AuthNTLMGidBuilder : AuthNTLMGidBuilderImpl!AuthNTLMGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AuthNTLM build() nothrow
  {
    return new AuthNTLM(cast(void*)createGObject(AuthNTLM._getGType), Yes.Take);
  }
}
