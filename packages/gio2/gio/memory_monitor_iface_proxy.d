/// Module for [MemoryMonitorIfaceProxy] interface proxy object
module gio.memory_monitor_iface_proxy;

import gobject.object;
import gio.memory_monitor;
import gio.memory_monitor_mixin;
import gio.initable;
import gio.initable_mixin;

/// Proxy object for [gio.memory_monitor.MemoryMonitor] interface when a GObject has no applicable D binding
class MemoryMonitorIfaceProxy : IfaceProxy, gio.memory_monitor.MemoryMonitor
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.memory_monitor.MemoryMonitor);
  }

  mixin MemoryMonitorT!();
  mixin gio.initable_mixin.InitableT!();
}
