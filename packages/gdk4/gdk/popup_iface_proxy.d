/// Module for [PopupIfaceProxy] interface proxy object
module gdk.popup_iface_proxy;

import gobject.object;
import gdk.popup;
import gdk.popup_mixin;

/// Proxy object for [gdk.popup.Popup] interface when a GObject has no applicable D binding
class PopupIfaceProxy : IfaceProxy, gdk.popup.Popup
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gdk.popup.Popup);
  }

  mixin PopupT!();
}
