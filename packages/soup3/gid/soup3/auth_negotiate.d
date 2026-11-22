/// Module for [AuthNegotiate] class
module gid.soup3.auth_negotiate;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.soup3.auth;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/**
    HTTP-based GSS-Negotiate authentication, as defined by
    [RFC 4559](https://datatracker.ietf.org/doc/html/rfc4559).
    
    [gid.soup3.session.Session]s do not support this type by default; if you want to
    enable support for it, call [gid.soup3.session.Session.addFeatureByType],
    passing `SOUP_TYPE_AUTH_NEGOTIATE`.
    
    This auth type will only work if libsoup was compiled with GSSAPI
    support; you can check [gid.soup3.auth_negotiate.AuthNegotiate.supported] to see if it
    was.
*/
class AuthNegotiate : gid.soup3.auth.Auth
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
    return cast(void function())soup_auth_negotiate_get_type != &gidSymbolNotFound ? soup_auth_negotiate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupAuthNegotiate";
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthNegotiate self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.auth_negotiate.AuthNegotiate]
      Returns: New builder object
  */
  static AuthNegotiateGidBuilder builder() nothrow
  {
    return new AuthNegotiateGidBuilder;
  }

  /**
      Indicates whether libsoup was built with GSSAPI support.
      
      If this is false, `SOUP_TYPE_AUTH_NEGOTIATE` will still be defined and can
      still be added to a [gid.soup3.session.Session], but libsoup will never attempt to
      actually use this auth type.
      Returns: true if supported otherwise false
  */
  static bool supported() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_auth_negotiate_supported();
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.soup3.auth_negotiate.AuthNegotiate]
class AuthNegotiateGidBuilderImpl(T) : gid.soup3.auth.AuthGidBuilderImpl!T
{
}

/// Fluent builder for [gid.soup3.auth_negotiate.AuthNegotiate]
final class AuthNegotiateGidBuilder : AuthNegotiateGidBuilderImpl!AuthNegotiateGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AuthNegotiate build() nothrow
  {
    return new AuthNegotiate(cast(void*)createGObject(AuthNegotiate._getGType), Yes.Take);
  }
}
