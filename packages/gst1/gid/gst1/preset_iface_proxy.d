/// Module for [PresetIfaceProxy] interface proxy object
module gid.gst1.preset_iface_proxy;

import gid.gobject2.object;
import gid.gst1.preset;
import gid.gst1.preset_mixin;

/// Proxy object for [gid.gst1.preset.Preset] interface when a GObject has no applicable D binding
class PresetIfaceProxy : IfaceProxy, gid.gst1.preset.Preset
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gst1.preset.Preset);
  }

  mixin PresetT!();
}
