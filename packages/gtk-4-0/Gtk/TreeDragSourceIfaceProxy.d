module Gtk.TreeDragSourceIfaceProxy;

import GObject.ObjectG;
import Gtk.TreeDragSource;
import Gtk.TreeDragSourceT;

/// Proxy object for Gtk.TreeDragSource interface when a GObject has no applicable D binding
class TreeDragSourceIfaceProxy : IfaceProxy, TreeDragSource
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(TreeDragSource);
  }

  mixin TreeDragSourceT!();
}
