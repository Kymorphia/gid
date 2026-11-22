/// Module for [PopupIfaceProxy] interface proxy object
module gid.gdk4.popup_iface_proxy;

import gid.gobject2.object;
import gid.gdk4.popup;
import gid.gdk4.popup_mixin;

/// Proxy object for [gid.gdk4.popup.Popup] interface when a GObject has no applicable D binding
class PopupIfaceProxy : IfaceProxy, gid.gdk4.popup.Popup
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gdk4.popup.Popup);
  }

  mixin PopupT!();
}
