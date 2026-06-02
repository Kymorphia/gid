/// Module for [FontChooserIfaceProxy] interface proxy object
module gtk.font_chooser_iface_proxy;

import gobject.object;
import gtk.font_chooser;
import gtk.font_chooser_mixin;

/// Proxy object for [gtk.font_chooser.FontChooser] interface when a GObject has no applicable D binding
class FontChooserIfaceProxy : IfaceProxy, gtk.font_chooser.FontChooser
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.font_chooser.FontChooser);
  }

  mixin FontChooserT!();
}
