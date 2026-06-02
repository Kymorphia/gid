/// Module for [BuildableIfaceProxy] interface proxy object
module gtk.buildable_iface_proxy;

import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;

/// Proxy object for [gtk.buildable.Buildable] interface when a GObject has no applicable D binding
class BuildableIfaceProxy : IfaceProxy, gtk.buildable.Buildable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.buildable.Buildable);
  }

  mixin BuildableT!();
}
