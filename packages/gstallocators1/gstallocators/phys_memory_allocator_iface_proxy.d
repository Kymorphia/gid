/// Module for [PhysMemoryAllocatorIfaceProxy] interface proxy object
module gstallocators.phys_memory_allocator_iface_proxy;

import gobject.object;
import gstallocators.phys_memory_allocator;
import gstallocators.phys_memory_allocator_mixin;

/// Proxy object for [gstallocators.phys_memory_allocator.PhysMemoryAllocator] interface when a GObject has no applicable D binding
class PhysMemoryAllocatorIfaceProxy : IfaceProxy, gstallocators.phys_memory_allocator.PhysMemoryAllocator
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gstallocators.phys_memory_allocator.PhysMemoryAllocator);
  }

  mixin PhysMemoryAllocatorT!();
}
