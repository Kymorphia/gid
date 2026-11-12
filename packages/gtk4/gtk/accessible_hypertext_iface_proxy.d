/// Module for [AccessibleHypertextIfaceProxy] interface proxy object
module gtk.accessible_hypertext_iface_proxy;

import gobject.object;
import gtk.accessible_hypertext;
import gtk.accessible_hypertext_mixin;
import gtk.accessible;
import gtk.accessible_mixin;

/// Proxy object for [gtk.accessible_hypertext.AccessibleHypertext] interface when a GObject has no applicable D binding
class AccessibleHypertextIfaceProxy : IfaceProxy, gtk.accessible_hypertext.AccessibleHypertext
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.accessible_hypertext.AccessibleHypertext);
  }

  mixin AccessibleHypertextT!();
  mixin gtk.accessible_mixin.AccessibleT!();
}
