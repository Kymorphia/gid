/// Module for [HyperlinkImpl] interface mixin
module atk.hyperlink_impl_mixin;

public import atk.hyperlink_impl_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.hyperlink;
public import atk.types;
public import gid.gid;
public import gobject.gid_builder;
public import gobject.object;

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
  override atk.hyperlink.Hyperlink getHyperlink()
  {
    AtkHyperlink* _cretval;
    _cretval = atk_hyperlink_impl_get_hyperlink(cast(AtkHyperlinkImpl*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.hyperlink.Hyperlink)(cast(AtkHyperlink*)_cretval, Yes.Take);
    return _retval;
  }
}

template HyperlinkImplGidBuilderT()
{
}
