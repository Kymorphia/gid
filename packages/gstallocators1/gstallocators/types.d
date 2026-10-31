/// D types for gstallocators1 library
module gstallocators.types;

import gid.gid;
import gstallocators.c.functions;
import gstallocators.c.types;


// Enums

/** */
alias FdMemoryFlags = GstFdMemoryFlags;

/** */
enum ALLOCATOR_DMABUF = "dmabuf";

/** */
enum ALLOCATOR_FD = "fd";

/**
    Name of this allocator, to be used for example with [gst.allocator.Allocator.find] and
    [gst.memory.Memory.isType].
*/
enum ALLOCATOR_SHM = "shm";

/**
    Name of this allocator, to be used for example with [gst.allocator.Allocator.find] and
    [gst.memory.Memory.isType].
*/
enum ALLOCATOR_UDMABUF = "udmabuf";

/**
    Constant that defines the caps feature name for DMA buffer sharing.
    
    It has to be used for non-mappable dma-buf only, i.e. when the underlying
    memory is not mappable to user space. Or when the mapped memory contains
    non meaningful data. It can be the case for protected content or when the
    user wants explicitly avoid any software post processing.
    
    In these cases all elements between the exported and the importer has to work
    in passthrough mode. This is done by adding this caps feature.
    
    When the memory is mappable for read and write requests then it is assumes
    to be a fast path and so this caps feature should not be used. Though
    according to the dma-buf protocol, while it is mapped it prevents the
    exporter to migrate the buffer.
    
    This caps feature should not serve at all the purpose of selecting the
    @GST_ALLOCATOR_DMABUF allocator during caps negotiation.
    When the exporter is the upstream element from the importer point of view,
    the exporter should try to map the dma buffer at runtime (preferably during
    decide_allocation phase). When it succeeds for #GST_MAP_READWRITE this caps
    feature should not be used. This allows scalers, color converts and any image
    processing filters to work directly on the dma buffer.
    In this case the importer element should check all incoming memory using
    [gstallocators.global.isDmabufMemory].
*/
enum CAPS_FEATURE_MEMORY_DMABUF = "memory:DMABuf";
