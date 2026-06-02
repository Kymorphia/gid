/// Module for [VolumeIfaceProxy] interface proxy object
module gio.volume_iface_proxy;

import gobject.object;
import gio.volume;
import gio.volume_mixin;

/// Proxy object for [gio.volume.Volume] interface when a GObject has no applicable D binding
class VolumeIfaceProxy : IfaceProxy, gio.volume.Volume
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.volume.Volume);
  }

  mixin VolumeT!();
}
