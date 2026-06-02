/// Module for [WritableFileIfaceProxy] interface proxy object
module arrow.writable_file_iface_proxy;

import gobject.object;
import arrow.writable_file;
import arrow.writable_file_mixin;

/// Proxy object for [arrow.writable_file.WritableFile] interface when a GObject has no applicable D binding
class WritableFileIfaceProxy : IfaceProxy, arrow.writable_file.WritableFile
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(arrow.writable_file.WritableFile);
  }

  mixin WritableFileT!();
}
