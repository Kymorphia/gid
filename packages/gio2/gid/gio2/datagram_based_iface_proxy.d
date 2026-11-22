/// Module for [DatagramBasedIfaceProxy] interface proxy object
module gid.gio2.datagram_based_iface_proxy;

import gid.gobject2.object;
import gid.gio2.datagram_based;
import gid.gio2.datagram_based_mixin;

/// Proxy object for [gid.gio2.datagram_based.DatagramBased] interface when a GObject has no applicable D binding
class DatagramBasedIfaceProxy : IfaceProxy, gid.gio2.datagram_based.DatagramBased
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.datagram_based.DatagramBased);
  }

  mixin DatagramBasedT!();
}
