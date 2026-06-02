/// Module for [DevicePadIfaceProxy] interface proxy object
module gdk.device_pad_iface_proxy;

import gobject.object;
import gdk.device_pad;
import gdk.device_pad_mixin;

/// Proxy object for [gdk.device_pad.DevicePad] interface when a GObject has no applicable D binding
class DevicePadIfaceProxy : IfaceProxy, gdk.device_pad.DevicePad
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gdk.device_pad.DevicePad);
  }

  mixin DevicePadT!();
}
