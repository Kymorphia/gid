/// Module for [ColorBalanceIfaceProxy] interface proxy object
module gid.gstvideo1.color_balance_iface_proxy;

import gid.gobject2.object;
import gid.gstvideo1.color_balance;
import gid.gstvideo1.color_balance_mixin;

/// Proxy object for [gid.gstvideo1.color_balance.ColorBalance] interface when a GObject has no applicable D binding
class ColorBalanceIfaceProxy : IfaceProxy, gid.gstvideo1.color_balance.ColorBalance
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gstvideo1.color_balance.ColorBalance);
  }

  mixin ColorBalanceT!();
}
