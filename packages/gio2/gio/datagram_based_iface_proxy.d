/// Module for [DatagramBasedIfaceProxy] interface proxy object
module gio.datagram_based_iface_proxy;

import gobject.object;
import gio.datagram_based;
import gio.datagram_based_mixin;

/// Proxy object for [gio.datagram_based.DatagramBased] interface when a GObject has no applicable D binding
class DatagramBasedIfaceProxy : IfaceProxy, gio.datagram_based.DatagramBased
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.datagram_based.DatagramBased);
  }

  mixin DatagramBasedT!();
}
