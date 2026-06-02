/// Module for [StreamVolumeIfaceProxy] interface proxy object
module gstaudio.stream_volume_iface_proxy;

import gobject.object;
import gstaudio.stream_volume;
import gstaudio.stream_volume_mixin;

/// Proxy object for [gstaudio.stream_volume.StreamVolume] interface when a GObject has no applicable D binding
class StreamVolumeIfaceProxy : IfaceProxy, gstaudio.stream_volume.StreamVolume
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gstaudio.stream_volume.StreamVolume);
  }

  mixin StreamVolumeT!();
}
