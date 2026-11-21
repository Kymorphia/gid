/// Module for [DebugControllerIfaceProxy] interface proxy object
module gid.gio2.debug_controller_iface_proxy;

import gid.gobject2.object;
import gid.gio2.debug_controller;
import gid.gio2.debug_controller_mixin;
import gid.gio2.initable;
import gid.gio2.initable_mixin;

/// Proxy object for [gid.gio2.debug_controller.DebugController] interface when a GObject has no applicable D binding
class DebugControllerIfaceProxy : IfaceProxy, gid.gio2.debug_controller.DebugController
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.debug_controller.DebugController);
  }

  mixin DebugControllerT!();
  mixin gid.gio2.initable_mixin.InitableT!();
}
