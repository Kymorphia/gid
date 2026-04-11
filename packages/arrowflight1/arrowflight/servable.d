/// Module for [Servable] interface
module arrowflight.servable;

public import arrowflight.servable_iface_proxy;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;

/** */
interface Servable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_servable_get_type != &gidSymbolNotFound ? gaflight_servable_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [arrowflight.servable.Servable]
interface ServableGidBuilderImpl(T)
{
}
