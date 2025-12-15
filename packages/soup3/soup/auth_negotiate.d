/// Module for [AuthNegotiate] class
module soup.auth_negotiate;

import gid.gid;
import soup.auth;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    HTTP-based GSS-Negotiate authentication, as defined by
    [RFC 4559](https://datatracker.ietf.org/doc/html/rfc4559).
    
    `class@Session`s do not support this type by default; if you want to
    enable support for it, call [soup.session.Session.addFeatureByType],
    passing `SOUP_TYPE_AUTH_NEGOTIATE`.
    
    This auth type will only work if libsoup was compiled with GSSAPI
    support; you can check [soup.auth_negotiate.AuthNegotiate.supported] to see if it
    was.
*/
class AuthNegotiate : soup.auth.Auth
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
    return cast(void function())soup_auth_negotiate_get_type != &gidSymbolNotFound ? soup_auth_negotiate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AuthNegotiate self()
  {
    return this;
  }

  /**
      Indicates whether libsoup was built with GSSAPI support.
      
      If this is false, `SOUP_TYPE_AUTH_NEGOTIATE` will still be defined and can
      still be added to a `classSession`, but libsoup will never attempt to
      actually use this auth type.
      Returns: true if supported otherwise false
  */
  static bool supported()
  {
    bool _retval;
    _retval = cast(bool)soup_auth_negotiate_supported();
    return _retval;
  }
}
