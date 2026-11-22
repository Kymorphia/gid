/// Module for [FileIfaceProxy] interface proxy object
module gid.gio2.file_iface_proxy;

import gid.gobject2.object;
import gid.gio2.file;
import gid.gio2.file_mixin;

/// Proxy object for [gid.gio2.file.File] interface when a GObject has no applicable D binding
class FileIfaceProxy : IfaceProxy, gid.gio2.file.File
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.file.File);
  }

  mixin FileT!();
}
