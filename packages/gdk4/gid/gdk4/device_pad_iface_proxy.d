/// Module for [DevicePadIfaceProxy] interface proxy object
module gid.gdk4.device_pad_iface_proxy;

import gid.gobject2.object;
import gid.gdk4.device_pad;
import gid.gdk4.device_pad_mixin;

/// Proxy object for [gid.gdk4.device_pad.DevicePad] interface when a GObject has no applicable D binding
class DevicePadIfaceProxy : IfaceProxy, gid.gdk4.device_pad.DevicePad
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gdk4.device_pad.DevicePad);
  }

  mixin DevicePadT!();
}
