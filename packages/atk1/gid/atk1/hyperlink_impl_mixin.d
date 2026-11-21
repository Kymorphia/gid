/// Module for [HyperlinkImpl] interface mixin
module gid.atk1.hyperlink_impl_mixin;

public import gid.core.basictypes;
public import gid.atk1.hyperlink_impl_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.hyperlink;
public import gid.atk1.types;
public import gid.core.gid;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    A queryable interface which allows AtkHyperlink instances
    associated with an AtkObject to be obtained.  AtkHyperlinkImpl
    corresponds to AT-SPI's Hyperlink interface, and differs from
    AtkHyperlink in that AtkHyperlink is an object type, rather than an
    interface, and thus cannot be directly queried. FTW
*/
template HyperlinkImplT()
{

  /**
      Gets the hyperlink associated with this object.
      Returns: an AtkHyperlink object which points to this
        implementing AtkObject.
  */
  override gid.atk1.hyperlink.Hyperlink getHyperlink() nothrow
  {
    AtkHyperlink* _cretval;
    _cretval = atk_hyperlink_impl_get_hyperlink(cast(AtkHyperlinkImpl*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.hyperlink.Hyperlink)(cast(AtkHyperlink*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.atk1.hyperlink_impl.HyperlinkImpl]
template HyperlinkImplGidBuilderT()
{
}
