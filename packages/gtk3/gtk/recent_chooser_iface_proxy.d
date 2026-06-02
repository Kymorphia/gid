/// Module for [RecentChooserIfaceProxy] interface proxy object
module gtk.recent_chooser_iface_proxy;

import gobject.object;
import gtk.recent_chooser;
import gtk.recent_chooser_mixin;

/// Proxy object for [gtk.recent_chooser.RecentChooser] interface when a GObject has no applicable D binding
class RecentChooserIfaceProxy : IfaceProxy, gtk.recent_chooser.RecentChooser
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.recent_chooser.RecentChooser);
  }

  mixin RecentChooserT!();
}
