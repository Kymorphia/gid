/// Module for [PhysMemoryAllocatorIfaceProxy] interface proxy object
module gid.gstallocators1.phys_memory_allocator_iface_proxy;

import gid.gobject2.object;
import gid.gstallocators1.phys_memory_allocator;
import gid.gstallocators1.phys_memory_allocator_mixin;

/// Proxy object for [gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator] interface when a GObject has no applicable D binding
class PhysMemoryAllocatorIfaceProxy : IfaceProxy, gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator);
  }

  mixin PhysMemoryAllocatorT!();
}
