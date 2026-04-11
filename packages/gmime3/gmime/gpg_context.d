/// Module for [GpgContext] class
module gmime.gpg_context;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.crypto_context;
import gmime.types;
import gobject.gid_builder;

/**
    A GnuPG crypto context.
*/
class GpgContext : gmime.crypto_context.CryptoContext
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
    return cast(void function())g_mime_gpg_context_get_type != &gidSymbolNotFound ? g_mime_gpg_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GpgContext self()
  {
    return this;
  }

  /**
      Get builder for [gmime.gpg_context.GpgContext]
      Returns: New builder object
  */
  static GpgContextGidBuilder builder()
  {
    return new GpgContextGidBuilder;
  }

  /**
      Creates a new gpg crypto context object.
      Returns: a new gpg crypto context object.
  */
  this()
  {
    GMimeCryptoContext* _cretval;
    _cretval = g_mime_gpg_context_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gmime.gpg_context.GpgContext]
class GpgContextGidBuilderImpl(T) : gmime.crypto_context.CryptoContextGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.gpg_context.GpgContext]
final class GpgContextGidBuilder : GpgContextGidBuilderImpl!GpgContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GpgContext build()
  {
    return new GpgContext(cast(void*)createGObject(GpgContext._getGType), Yes.Take);
  }
}
