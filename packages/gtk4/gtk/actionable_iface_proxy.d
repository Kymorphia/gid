/// Module for [ActionableIfaceProxy] interface proxy object
module gtk.actionable_iface_proxy;

import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;

/// Proxy object for [gtk.actionable.Actionable] interface when a GObject has no applicable D binding
class ActionableIfaceProxy : IfaceProxy, gtk.actionable.Actionable
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.actionable.Actionable);
  }

  mixin ActionableT!();
}
