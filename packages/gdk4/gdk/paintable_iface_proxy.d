/// Module for [PaintableIfaceProxy] interface proxy object
module gdk.paintable_iface_proxy;

import gobject.object;
import gdk.paintable;
import gdk.paintable_mixin;

/// Proxy object for [gdk.paintable.Paintable] interface when a GObject has no applicable D binding
class PaintableIfaceProxy : IfaceProxy, gdk.paintable.Paintable
{
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gdk.paintable.Paintable);
  }

  mixin PaintableT!();
}
