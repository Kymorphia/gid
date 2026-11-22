/// Module for [DriveIfaceProxy] interface proxy object
module gid.gio2.drive_iface_proxy;

import gid.gobject2.object;
import gid.gio2.drive;
import gid.gio2.drive_mixin;

/// Proxy object for [gid.gio2.drive.Drive] interface when a GObject has no applicable D binding
class DriveIfaceProxy : IfaceProxy, gid.gio2.drive.Drive
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.drive.Drive);
  }

  mixin DriveT!();
}
