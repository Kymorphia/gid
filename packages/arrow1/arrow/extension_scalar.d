/// Module for [ExtensionScalar] class
module arrow.extension_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class ExtensionScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_extension_scalar_get_type != &gidSymbolNotFound ? garrow_extension_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExtensionScalar self()
  {
    return this;
  }
}
