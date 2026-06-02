/// Module for [FontMapIfaceProxy] interface proxy object
module pangocairo.font_map_iface_proxy;

import gobject.object;
import pangocairo.font_map;
import pangocairo.font_map_mixin;

/// Proxy object for [pangocairo.font_map.FontMap] interface when a GObject has no applicable D binding
class FontMapIfaceProxy : IfaceProxy, pangocairo.font_map.FontMap
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(pangocairo.font_map.FontMap);
  }

  mixin FontMapT!();
}
