/// Module for [Pkcs7Context] class
module gmime.pkcs7_context;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.crypto_context;
import gmime.types;

/**
    A PKCS7 crypto context.
*/
class Pkcs7Context : gmime.crypto_context.CryptoContext
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
    return cast(void function())g_mime_pkcs7_context_get_type != &gidSymbolNotFound ? g_mime_pkcs7_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Pkcs7Context self()
  {
    return this;
  }

  /**
      Creates a new pkcs7 crypto context object.
      Returns: a new pkcs7 crypto context object.
  */
  this()
  {
    GMimeCryptoContext* _cretval;
    _cretval = g_mime_pkcs7_context_new();
    this(_cretval, Yes.Take);
  }
}
