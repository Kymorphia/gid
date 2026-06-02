/// Module for [ColorBalanceIfaceProxy] interface proxy object
module gstvideo.color_balance_iface_proxy;

import gobject.object;
import gstvideo.color_balance;
import gstvideo.color_balance_mixin;

/// Proxy object for [gstvideo.color_balance.ColorBalance] interface when a GObject has no applicable D binding
class ColorBalanceIfaceProxy : IfaceProxy, gstvideo.color_balance.ColorBalance
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gstvideo.color_balance.ColorBalance);
  }

  mixin ColorBalanceT!();
}
