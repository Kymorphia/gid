/// Module for [FileIfaceProxy] interface proxy object
module gio.file_iface_proxy;

import gobject.object;
import gio.file;
import gio.file_mixin;

/// Proxy object for [gio.file.File] interface when a GObject has no applicable D binding
class FileIfaceProxy : IfaceProxy, gio.file.File
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.file.File);
  }

  mixin FileT!();
}
