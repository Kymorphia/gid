/// Module for [DragSurfaceIfaceProxy] interface proxy object
module gdk.drag_surface_iface_proxy;

import gobject.object;
import gdk.drag_surface;
import gdk.drag_surface_mixin;

/// Proxy object for [gdk.drag_surface.DragSurface] interface when a GObject has no applicable D binding
class DragSurfaceIfaceProxy : IfaceProxy, gdk.drag_surface.DragSurface
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gdk.drag_surface.DragSurface);
  }

  mixin DragSurfaceT!();
}
