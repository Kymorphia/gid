/// Module for [PowerProfileMonitorIfaceProxy] interface proxy object
module gio.power_profile_monitor_iface_proxy;

import gobject.object;
import gio.power_profile_monitor;
import gio.power_profile_monitor_mixin;

/// Proxy object for [gio.power_profile_monitor.PowerProfileMonitor] interface when a GObject has no applicable D binding
class PowerProfileMonitorIfaceProxy : IfaceProxy, gio.power_profile_monitor.PowerProfileMonitor
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.power_profile_monitor.PowerProfileMonitor);
  }

  mixin PowerProfileMonitorT!();
}
