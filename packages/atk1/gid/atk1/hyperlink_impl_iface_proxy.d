/// Module for [HyperlinkImplIfaceProxy] interface proxy object
module gid.atk1.hyperlink_impl_iface_proxy;

import gid.gobject2.object;
import gid.atk1.hyperlink_impl;
import gid.atk1.hyperlink_impl_mixin;

/// Proxy object for [gid.atk1.hyperlink_impl.HyperlinkImpl] interface when a GObject has no applicable D binding
class HyperlinkImplIfaceProxy : IfaceProxy, gid.atk1.hyperlink_impl.HyperlinkImpl
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.atk1.hyperlink_impl.HyperlinkImpl);
  }

  mixin HyperlinkImplT!();
}
