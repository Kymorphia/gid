/// Module for [ImplementorIface] interface
module atk.implementor_iface;

public import atk.implementor_iface_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.gid_builder;

/**
    The AtkImplementor interface is implemented by objects for which
    AtkObject peers may be obtained via calls to
    iface->(ref_accessible)(implementor);
*/
interface ImplementorIface
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_implementor_get_type != &gidSymbolNotFound ? atk_implementor_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [atk.implementor_iface.ImplementorIface]
interface ImplementorIfaceGidBuilderImpl(T)
{
}
