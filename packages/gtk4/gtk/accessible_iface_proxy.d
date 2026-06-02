/// Module for [AccessibleIfaceProxy] interface proxy object
module gtk.accessible_iface_proxy;

import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;

/// Proxy object for [gtk.accessible.Accessible] interface when a GObject has no applicable D binding
class AccessibleIfaceProxy : IfaceProxy, gtk.accessible.Accessible
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.accessible.Accessible);
  }

  mixin AccessibleT!();
}
