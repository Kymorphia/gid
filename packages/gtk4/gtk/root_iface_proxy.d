/// Module for [RootIfaceProxy] interface proxy object
module gtk.root_iface_proxy;

import gobject.object;
import gtk.root;
import gtk.root_mixin;

/// Proxy object for [gtk.root.Root] interface when a GObject has no applicable D binding
class RootIfaceProxy : IfaceProxy, gtk.root.Root
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.root.Root);
  }

  mixin RootT!();
}
