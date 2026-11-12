/// Module for [LoadableIconIfaceProxy] interface proxy object
module gio.loadable_icon_iface_proxy;

import gobject.object;
import gio.loadable_icon;
import gio.loadable_icon_mixin;
import gio.icon;
import gio.icon_mixin;

/// Proxy object for [gio.loadable_icon.LoadableIcon] interface when a GObject has no applicable D binding
class LoadableIconIfaceProxy : IfaceProxy, gio.loadable_icon.LoadableIcon
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.loadable_icon.LoadableIcon);
  }

  mixin LoadableIconT!();
  mixin gio.icon_mixin.IconT!();
}
