/// Module for [GpgContext] class
module gid.gmime3.gpg_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.crypto_context;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A GnuPG crypto context.
*/
class GpgContext : gid.gmime3.crypto_context.CryptoContext
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
    return cast(void function())g_mime_gpg_context_get_type != &gidSymbolNotFound ? g_mime_gpg_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeGpgContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override GpgContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.gpg_context.GpgContext]
      Returns: New builder object
  */
  static GpgContextGidBuilder builder() nothrow
  {
    return new GpgContextGidBuilder;
  }

  /**
      Creates a new gpg crypto context object.
      Returns: a new gpg crypto context object.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeCryptoContext* _cretval;
      _cretval = g_mime_gpg_context_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.gpg_context.GpgContext]
class GpgContextGidBuilderImpl(T) : gid.gmime3.crypto_context.CryptoContextGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.gpg_context.GpgContext]
final class GpgContextGidBuilder : GpgContextGidBuilderImpl!GpgContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GpgContext build() nothrow
  {
    return new GpgContext(cast(void*)createGObject(GpgContext._getGType), Yes.Take);
  }
}
