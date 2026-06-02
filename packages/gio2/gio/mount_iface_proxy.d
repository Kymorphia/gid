/// Module for [MountIfaceProxy] interface proxy object
module gio.mount_iface_proxy;

import gobject.object;
import gio.mount;
import gio.mount_mixin;

/// Proxy object for [gio.mount.Mount] interface when a GObject has no applicable D binding
class MountIfaceProxy : IfaceProxy, gio.mount.Mount
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.mount.Mount);
  }

  mixin MountT!();
}
