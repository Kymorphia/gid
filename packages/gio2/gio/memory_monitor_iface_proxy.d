/// Module for [MemoryMonitorIfaceProxy] interface proxy object
module gio.memory_monitor_iface_proxy;

import gobject.object;
import gio.memory_monitor;
import gio.memory_monitor_mixin;

/// Proxy object for [Gio.MemoryMonitor] interface when a GObject has no applicable D binding
class MemoryMonitorIfaceProxy : IfaceProxy, gio.memory_monitor.MemoryMonitor
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.memory_monitor.MemoryMonitor);
  }

  mixin MemoryMonitorT!();
}
