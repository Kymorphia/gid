/// Module for [HyperlinkImpl] interface
module atk.hyperlink_impl;

public import atk.hyperlink_impl_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.hyperlink;
import atk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    A queryable interface which allows AtkHyperlink instances
    associated with an AtkObject to be obtained.  AtkHyperlinkImpl
    corresponds to AT-SPI's Hyperlink interface, and differs from
    AtkHyperlink in that AtkHyperlink is an object type, rather than an
    interface, and thus cannot be directly queried. FTW
*/
interface HyperlinkImpl
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_hyperlink_impl_get_type != &gidSymbolNotFound ? atk_hyperlink_impl_get_type() : cast(GType)0;
  }

  /**
      Gets the hyperlink associated with this object.
      Returns: an AtkHyperlink object which points to this
        implementing AtkObject.
  */
  atk.hyperlink.Hyperlink getHyperlink();
}

interface HyperlinkImplGidBuilderImpl(T)
{
}
