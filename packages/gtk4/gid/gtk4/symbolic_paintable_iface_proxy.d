/// Module for [SymbolicPaintableIfaceProxy] interface proxy object
module gid.gtk4.symbolic_paintable_iface_proxy;

import gid.gobject2.object;
import gid.gtk4.symbolic_paintable;
import gid.gtk4.symbolic_paintable_mixin;
import gid.gdk4.paintable;
import gid.gdk4.paintable_mixin;

/// Proxy object for [gid.gtk4.symbolic_paintable.SymbolicPaintable] interface when a GObject has no applicable D binding
class SymbolicPaintableIfaceProxy : IfaceProxy, gid.gtk4.symbolic_paintable.SymbolicPaintable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk4.symbolic_paintable.SymbolicPaintable);
  }

  mixin SymbolicPaintableT!();
  mixin gid.gdk4.paintable_mixin.PaintableT!();
}
