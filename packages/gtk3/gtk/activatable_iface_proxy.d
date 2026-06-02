/// Module for [ActivatableIfaceProxy] interface proxy object
module gtk.activatable_iface_proxy;

import gobject.object;
import gtk.activatable;
import gtk.activatable_mixin;

/// Proxy object for [gtk.activatable.Activatable] interface when a GObject has no applicable D binding
class ActivatableIfaceProxy : IfaceProxy, gtk.activatable.Activatable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.activatable.Activatable);
  }

  mixin ActivatableT!();
}
