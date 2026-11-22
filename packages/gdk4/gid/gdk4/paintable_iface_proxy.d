/// Module for [PaintableIfaceProxy] interface proxy object
module gid.gdk4.paintable_iface_proxy;

import gid.gobject2.object;
import gid.gdk4.paintable;
import gid.gdk4.paintable_mixin;

/// Proxy object for [gid.gdk4.paintable.Paintable] interface when a GObject has no applicable D binding
class PaintableIfaceProxy : IfaceProxy, gid.gdk4.paintable.Paintable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gdk4.paintable.Paintable);
  }

  mixin PaintableT!();
}
