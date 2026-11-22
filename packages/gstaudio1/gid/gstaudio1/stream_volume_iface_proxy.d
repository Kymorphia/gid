/// Module for [StreamVolumeIfaceProxy] interface proxy object
module gid.gstaudio1.stream_volume_iface_proxy;

import gid.gobject2.object;
import gid.gstaudio1.stream_volume;
import gid.gstaudio1.stream_volume_mixin;

/// Proxy object for [gid.gstaudio1.stream_volume.StreamVolume] interface when a GObject has no applicable D binding
class StreamVolumeIfaceProxy : IfaceProxy, gid.gstaudio1.stream_volume.StreamVolume
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gstaudio1.stream_volume.StreamVolume);
  }

  mixin StreamVolumeT!();
}
