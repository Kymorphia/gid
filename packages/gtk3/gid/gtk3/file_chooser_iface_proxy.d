/// Module for [FileChooserIfaceProxy] interface proxy object
module gid.gtk3.file_chooser_iface_proxy;

import gid.gobject2.object;
import gid.gtk3.file_chooser;
import gid.gtk3.file_chooser_mixin;

/// Proxy object for [gid.gtk3.file_chooser.FileChooser] interface when a GObject has no applicable D binding
class FileChooserIfaceProxy : IfaceProxy, gid.gtk3.file_chooser.FileChooser
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gtk3.file_chooser.FileChooser);
  }

  mixin FileChooserT!();
}
