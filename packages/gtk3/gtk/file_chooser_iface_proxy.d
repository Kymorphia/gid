/// Module for [FileChooserIfaceProxy] interface proxy object
module gtk.file_chooser_iface_proxy;

import gobject.object;
import gtk.file_chooser;
import gtk.file_chooser_mixin;

/// Proxy object for [gtk.file_chooser.FileChooser] interface when a GObject has no applicable D binding
class FileChooserIfaceProxy : IfaceProxy, gtk.file_chooser.FileChooser
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gtk.file_chooser.FileChooser);
  }

  mixin FileChooserT!();
}
