/// Module for [PhysMemoryAllocator] interface mixin
module gstallocators.phys_memory_allocator_mixin;

public import gstallocators.phys_memory_allocator_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gstallocators.c.functions;
public import gstallocators.c.types;
public import gstallocators.types;

/** */
template PhysMemoryAllocatorT()
{
}

/// Fluent builder implementation template for [gstallocators.phys_memory_allocator.PhysMemoryAllocator]
template PhysMemoryAllocatorGidBuilderT()
{
}
