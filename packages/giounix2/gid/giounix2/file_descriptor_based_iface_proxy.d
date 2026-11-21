/// Module for [FileDescriptorBasedIfaceProxy] interface proxy object
module gid.giounix2.file_descriptor_based_iface_proxy;

import gid.gobject2.object;
import gid.giounix2.file_descriptor_based;
import gid.giounix2.file_descriptor_based_mixin;

/// Proxy object for [gid.giounix2.file_descriptor_based.FileDescriptorBased] interface when a GObject has no applicable D binding
class FileDescriptorBasedIfaceProxy : IfaceProxy, gid.giounix2.file_descriptor_based.FileDescriptorBased
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.giounix2.file_descriptor_based.FileDescriptorBased);
  }

  mixin FileDescriptorBasedT!();
}
