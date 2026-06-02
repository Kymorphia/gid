/// Module for [DriveIfaceProxy] interface proxy object
module gio.drive_iface_proxy;

import gobject.object;
import gio.drive;
import gio.drive_mixin;

/// Proxy object for [gio.drive.Drive] interface when a GObject has no applicable D binding
class DriveIfaceProxy : IfaceProxy, gio.drive.Drive
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.drive.Drive);
  }

  mixin DriveT!();
}
