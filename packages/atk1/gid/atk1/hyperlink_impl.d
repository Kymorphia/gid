/// Module for [HyperlinkImpl] interface
module gid.atk1.hyperlink_impl;

public import gid.core.basictypes;
public import gid.atk1.hyperlink_impl_iface_proxy;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.hyperlink;
import gid.atk1.types;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A queryable interface which allows AtkHyperlink instances
    associated with an AtkObject to be obtained.  AtkHyperlinkImpl
    corresponds to AT-SPI's Hyperlink interface, and differs from
    AtkHyperlink in that AtkHyperlink is an object type, rather than an
    interface, and thus cannot be directly queried. FTW
*/
interface HyperlinkImpl : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())atk_hyperlink_impl_get_type != &gidSymbolNotFound ? atk_hyperlink_impl_get_type() : cast(GType)0;
  }

  /**
      Gets the hyperlink associated with this object.
      Returns: an AtkHyperlink object which points to this
        implementing AtkObject.
  */
  gid.atk1.hyperlink.Hyperlink getHyperlink();
}

/// Fluent builder implementation template for [gid.atk1.hyperlink_impl.HyperlinkImpl]
interface HyperlinkImplGidBuilderImpl(T)
{
}
