/// Module for [PhysMemoryAllocator] interface
module gstallocators.phys_memory_allocator;

public import gstallocators.phys_memory_allocator_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gstallocators.c.functions;
import gstallocators.c.types;
import gstallocators.types;

/** */
interface PhysMemoryAllocator
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_phys_memory_allocator_get_type != &gidSymbolNotFound ? gst_phys_memory_allocator_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [gstallocators.phys_memory_allocator.PhysMemoryAllocator]
interface PhysMemoryAllocatorGidBuilderImpl(T)
{
}
