/// Module for [PhysMemoryAllocator] interface
module gid.gstallocators1.phys_memory_allocator;

public import gid.core.basictypes;
public import gid.gstallocators1.phys_memory_allocator_iface_proxy;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstallocators1.c.functions;
import gid.gstallocators1.c.types;
import gid.gstallocators1.types;

/** */
interface PhysMemoryAllocator : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_phys_memory_allocator_get_type != &gidSymbolNotFound ? gst_phys_memory_allocator_get_type() : cast(GType)0;
  }

}

/// Fluent builder implementation template for [gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator]
interface PhysMemoryAllocatorGidBuilderImpl(T)
{
}
