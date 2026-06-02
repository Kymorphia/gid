/// Module for [NetworkMonitorIfaceProxy] interface proxy object
module gio.network_monitor_iface_proxy;

import gobject.object;
import gio.network_monitor;
import gio.network_monitor_mixin;

/// Proxy object for [gio.network_monitor.NetworkMonitor] interface when a GObject has no applicable D binding
class NetworkMonitorIfaceProxy : IfaceProxy, gio.network_monitor.NetworkMonitor
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.network_monitor.NetworkMonitor);
  }

  mixin NetworkMonitorT!();
}
