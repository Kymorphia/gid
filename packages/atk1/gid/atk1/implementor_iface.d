/// Module for [ImplementorIface] interface
module gid.atk1.implementor_iface;

public import gid.core.basictypes;
public import gid.atk1.implementor_iface_iface_proxy;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;

/**
    The AtkImplementor interface is implemented by objects for which
    AtkObject peers may be obtained via calls to
    iface->(ref_accessible)(implementor);
*/
@gidGir("ImplementorIface")
interface ImplementorIface : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())atk_implementor_get_type != &gidSymbolNotFound ? atk_implementor_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [gid.atk1.implementor_iface.ImplementorIface]
interface ImplementorIfaceGidBuilderImpl(T)
{
}
