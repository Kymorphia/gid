/// Module for [DragSurfaceIfaceProxy] interface proxy object
module gid.gdk4.drag_surface_iface_proxy;

import gid.gobject2.object;
import gid.gdk4.drag_surface;
import gid.gdk4.drag_surface_mixin;

/// Proxy object for [gid.gdk4.drag_surface.DragSurface] interface when a GObject has no applicable D binding
class DragSurfaceIfaceProxy : IfaceProxy, gid.gdk4.drag_surface.DragSurface
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gdk4.drag_surface.DragSurface);
  }

  mixin DragSurfaceT!();
}
