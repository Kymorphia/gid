/// Module for [SymbolicPaintableIfaceProxy] interface proxy object
module gtk.symbolic_paintable_iface_proxy;

import gobject.object;
import gtk.symbolic_paintable;
import gtk.symbolic_paintable_mixin;

/// Proxy object for [gtk.symbolic_paintable.SymbolicPaintable] interface when a GObject has no applicable D binding
class SymbolicPaintableIfaceProxy : IfaceProxy, gtk.symbolic_paintable.SymbolicPaintable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.symbolic_paintable.SymbolicPaintable);
  }

  mixin SymbolicPaintableT!();
}
