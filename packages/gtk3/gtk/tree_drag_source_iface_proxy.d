/// Module for [TreeDragSourceIfaceProxy] interface proxy object
module gtk.tree_drag_source_iface_proxy;

import gobject.object;
import gtk.tree_drag_source;
import gtk.tree_drag_source_mixin;

/// Proxy object for [gtk.tree_drag_source.TreeDragSource] interface when a GObject has no applicable D binding
class TreeDragSourceIfaceProxy : IfaceProxy, gtk.tree_drag_source.TreeDragSource
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.tree_drag_source.TreeDragSource);
  }

  mixin TreeDragSourceT!();
}
