/// Module for [VolumeIfaceProxy] interface proxy object
module gid.gio2.volume_iface_proxy;

import gid.gobject2.object;
import gid.gio2.volume;
import gid.gio2.volume_mixin;

/// Proxy object for [gid.gio2.volume.Volume] interface when a GObject has no applicable D binding
class VolumeIfaceProxy : IfaceProxy, gid.gio2.volume.Volume
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.volume.Volume);
  }

  mixin VolumeT!();
}
