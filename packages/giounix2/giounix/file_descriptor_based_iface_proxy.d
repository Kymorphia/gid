/// Module for [FileDescriptorBasedIfaceProxy] interface proxy object
module giounix.file_descriptor_based_iface_proxy;

import gobject.object;
import giounix.file_descriptor_based;
import giounix.file_descriptor_based_mixin;

/// Proxy object for [giounix.file_descriptor_based.FileDescriptorBased] interface when a GObject has no applicable D binding
class FileDescriptorBasedIfaceProxy : IfaceProxy, giounix.file_descriptor_based.FileDescriptorBased
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(giounix.file_descriptor_based.FileDescriptorBased);
  }

  mixin FileDescriptorBasedT!();
}
