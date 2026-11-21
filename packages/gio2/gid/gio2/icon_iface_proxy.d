/// Module for [IconIfaceProxy] interface proxy object
module gid.gio2.icon_iface_proxy;

import gid.gobject2.object;
import gid.gio2.icon;
import gid.gio2.icon_mixin;

/// Proxy object for [gid.gio2.icon.Icon] interface when a GObject has no applicable D binding
class IconIfaceProxy : IfaceProxy, gid.gio2.icon.Icon
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.icon.Icon);
  }

  mixin IconT!();
}
