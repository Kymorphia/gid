/// Module for [AccessibleTextIfaceProxy] interface proxy object
module gtk.accessible_text_iface_proxy;

import gobject.object;
import gtk.accessible_text;
import gtk.accessible_text_mixin;

/// Proxy object for [gtk.accessible_text.AccessibleText] interface when a GObject has no applicable D binding
class AccessibleTextIfaceProxy : IfaceProxy, gtk.accessible_text.AccessibleText
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.accessible_text.AccessibleText);
  }

  mixin AccessibleTextT!();
}
