/// Module for [MountIfaceProxy] interface proxy object
module gid.gio2.mount_iface_proxy;

import gid.gobject2.object;
import gid.gio2.mount;
import gid.gio2.mount_mixin;

/// Proxy object for [gid.gio2.mount.Mount] interface when a GObject has no applicable D binding
class MountIfaceProxy : IfaceProxy, gid.gio2.mount.Mount
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.mount.Mount);
  }

  mixin MountT!();
}
