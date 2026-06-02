/// Module for [DebugControllerIfaceProxy] interface proxy object
module gio.debug_controller_iface_proxy;

import gobject.object;
import gio.debug_controller;
import gio.debug_controller_mixin;

/// Proxy object for [gio.debug_controller.DebugController] interface when a GObject has no applicable D binding
class DebugControllerIfaceProxy : IfaceProxy, gio.debug_controller.DebugController
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.debug_controller.DebugController);
  }

  mixin DebugControllerT!();
}
