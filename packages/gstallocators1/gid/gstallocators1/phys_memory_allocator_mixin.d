/// Module for [PhysMemoryAllocator] interface mixin
module gid.gstallocators1.phys_memory_allocator_mixin;

public import gid.core.basictypes;
public import gid.gstallocators1.phys_memory_allocator_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.gid_builder;
public import gid.gstallocators1.c.functions;
public import gid.gstallocators1.c.types;
public import gid.gstallocators1.types;

/** */
template PhysMemoryAllocatorT()
{
}

/// Fluent builder implementation template for [gid.gstallocators1.phys_memory_allocator.PhysMemoryAllocator]
template PhysMemoryAllocatorGidBuilderT()
{
}
