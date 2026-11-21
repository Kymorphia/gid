/// Module for [FontMapIfaceProxy] interface proxy object
module gid.pangocairo1.font_map_iface_proxy;

import gid.gobject2.object;
import gid.pangocairo1.font_map;
import gid.pangocairo1.font_map_mixin;

/// Proxy object for [gid.pangocairo1.font_map.FontMap] interface when a GObject has no applicable D binding
class FontMapIfaceProxy : IfaceProxy, gid.pangocairo1.font_map.FontMap
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.pangocairo1.font_map.FontMap);
  }

  mixin FontMapT!();
}
