/// Module for [FontIfaceProxy] interface proxy object
module gid.pangocairo1.font_iface_proxy;

import gid.gobject2.object;
import gid.pangocairo1.font;
import gid.pangocairo1.font_mixin;

/// Proxy object for [gid.pangocairo1.font.Font] interface when a GObject has no applicable D binding
class FontIfaceProxy : IfaceProxy, gid.pangocairo1.font.Font
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.pangocairo1.font.Font);
  }

  mixin FontT!();
}
