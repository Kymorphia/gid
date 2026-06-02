/// Module for [FileDescriptorBasedIfaceProxy] interface proxy object
module gio.file_descriptor_based_iface_proxy;

import gobject.object;
import gio.file_descriptor_based;
import gio.file_descriptor_based_mixin;

/// Proxy object for [gio.file_descriptor_based.FileDescriptorBased] interface when a GObject has no applicable D binding
class FileDescriptorBasedIfaceProxy : IfaceProxy, gio.file_descriptor_based.FileDescriptorBased
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.file_descriptor_based.FileDescriptorBased);
  }

  mixin FileDescriptorBasedT!();
}
