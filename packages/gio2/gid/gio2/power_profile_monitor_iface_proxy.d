/// Module for [PowerProfileMonitorIfaceProxy] interface proxy object
module gid.gio2.power_profile_monitor_iface_proxy;

import gid.gobject2.object;
import gid.gio2.power_profile_monitor;
import gid.gio2.power_profile_monitor_mixin;
import gid.gio2.initable;
import gid.gio2.initable_mixin;

/// Proxy object for [gid.gio2.power_profile_monitor.PowerProfileMonitor] interface when a GObject has no applicable D binding
class PowerProfileMonitorIfaceProxy : IfaceProxy, gid.gio2.power_profile_monitor.PowerProfileMonitor
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.power_profile_monitor.PowerProfileMonitor);
  }

  mixin PowerProfileMonitorT!();
  mixin gid.gio2.initable_mixin.InitableT!();
}
