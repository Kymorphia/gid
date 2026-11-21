/// Module for [AppInfoIfaceProxy] interface proxy object
module gid.gio2.app_info_iface_proxy;

import gid.gobject2.object;
import gid.gio2.app_info;
import gid.gio2.app_info_mixin;

/// Proxy object for [gid.gio2.app_info.AppInfo] interface when a GObject has no applicable D binding
class AppInfoIfaceProxy : IfaceProxy, gid.gio2.app_info.AppInfo
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.app_info.AppInfo);
  }

  mixin AppInfoT!();
}
