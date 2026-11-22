/// Module for [LoadableIconIfaceProxy] interface proxy object
module gid.gio2.loadable_icon_iface_proxy;

import gid.gobject2.object;
import gid.gio2.loadable_icon;
import gid.gio2.loadable_icon_mixin;
import gid.gio2.icon;
import gid.gio2.icon_mixin;

/// Proxy object for [gid.gio2.loadable_icon.LoadableIcon] interface when a GObject has no applicable D binding
class LoadableIconIfaceProxy : IfaceProxy, gid.gio2.loadable_icon.LoadableIcon
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.loadable_icon.LoadableIcon);
  }

  mixin LoadableIconT!();
  mixin gid.gio2.icon_mixin.IconT!();
}
