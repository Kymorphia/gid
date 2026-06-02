/// Module for [ColorChooserIfaceProxy] interface proxy object
module gtk.color_chooser_iface_proxy;

import gobject.object;
import gtk.color_chooser;
import gtk.color_chooser_mixin;

/// Proxy object for [gtk.color_chooser.ColorChooser] interface when a GObject has no applicable D binding
class ColorChooserIfaceProxy : IfaceProxy, gtk.color_chooser.ColorChooser
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.color_chooser.ColorChooser);
  }

  mixin ColorChooserT!();
}
