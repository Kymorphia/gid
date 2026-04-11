/// Module for [AuthNTLM] class
module soup.auth_ntlm;

import gid.gid;
import gobject.gid_builder;
import soup.auth;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    HTTP-based NTLM authentication.
    
    `class@Session`s do not support this type by default; if you want to
    enable support for it, call [soup.session.Session.addFeatureByType],
    passing `SOUP_TYPE_AUTH_NTLM`.
*/
class AuthNTLM : soup.auth.Auth
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
    return cast(void function())soup_auth_ntlm_get_type != &gidSymbolNotFound ? soup_auth_ntlm_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthNTLM self()
  {
    return this;
  }

  /**
      Get builder for [soup.auth_ntlm.AuthNTLM]
      Returns: New builder object
  */
  static AuthNTLMGidBuilder builder()
  {
    return new AuthNTLMGidBuilder;
  }
}

/// Fluent builder implementation template for [soup.auth_ntlm.AuthNTLM]
class AuthNTLMGidBuilderImpl(T) : soup.auth.AuthGidBuilderImpl!T
{
}

/// Fluent builder for [soup.auth_ntlm.AuthNTLM]
final class AuthNTLMGidBuilder : AuthNTLMGidBuilderImpl!AuthNTLMGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AuthNTLM build()
  {
    return new AuthNTLM(cast(void*)createGObject(AuthNTLM._getGType), No.Take);
  }
}
