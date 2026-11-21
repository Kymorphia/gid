/// Module for [NetworkMonitorIfaceProxy] interface proxy object
module gid.gio2.network_monitor_iface_proxy;

import gid.gobject2.object;
import gid.gio2.network_monitor;
import gid.gio2.network_monitor_mixin;
import gid.gio2.initable;
import gid.gio2.initable_mixin;

/// Proxy object for [gid.gio2.network_monitor.NetworkMonitor] interface when a GObject has no applicable D binding
class NetworkMonitorIfaceProxy : IfaceProxy, gid.gio2.network_monitor.NetworkMonitor
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.network_monitor.NetworkMonitor);
  }

  mixin NetworkMonitorT!();
  mixin gid.gio2.initable_mixin.InitableT!();
}
