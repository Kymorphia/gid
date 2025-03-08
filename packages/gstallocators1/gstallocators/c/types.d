module gstallocators.c.types;

public import gid.basictypes;
public import gst.c.types;

/**
    Various flags to control the operation of the fd backed memory.
*/
enum GstFdMemoryFlags : uint
{
  /**
      no flag
  */
  none = 0,

  /**
      once the memory is mapped,
           keep it mapped until the memory is destroyed.
  */
  keepMapped = 1,

  /**
      do a private mapping instead of
           the default shared mapping.
  */
  mapPrivate = 2,

  /**
      don't close the file descriptor when
           the memory is freed. Since: 1.10
  */
  dontClose = 4,
}

/**
    Private intance object for #GstDRMDumbAllocator.
*/
struct GstDRMDumbAllocator;

/** */
struct GstDRMDumbAllocatorClass
{
  /**
      Parent Class.
  */
  GstAllocatorClass parentClass;
}

/**
    Base class for allocators with dmabuf-backed memory
*/
struct GstDmaBufAllocator
{
  /** */
  GstFdAllocator parent;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstDmaBufAllocatorClass
{
  /** */
  GstFdAllocatorClass parentClass;

  /** */
  void*[4] GstReserved;
}

/**
    Base class for allocators with fd-backed memory
*/
struct GstFdAllocator
{
  /** */
  GstAllocator parent;
}

/** */
struct GstFdAllocatorClass
{
  /** */
  GstAllocatorClass parentClass;
}

/** */
struct GstPhysMemoryAllocator;

/**
    Marker interface for allocators with physical address backed memory
*/
struct GstPhysMemoryAllocatorInterface
{
  /** */
  GTypeInterface parentIface;

  /**
      Implementations shall return the physicall memory address
       that is backing the provided memory, or 0 if none.
  */
  extern(C) size_t function(GstPhysMemoryAllocator* allocator, GstMemory* mem) getPhysAddr;
}

/**
    This is a subclass of #GstFdAllocator that implements the
  [gst.allocator.Allocator.alloc] method using `memfd_create()` when available, POSIX
  `shm_open()` otherwise. Platforms not supporting any of those (Windows) will
  always return null.
  
  Note that allocating new shared memories has a significant performance cost,
  it is thus recommended to keep a pool of pre-allocated #GstMemory, using
  #GstBufferPool. For that reason, this allocator has the
  [gst.types.AllocatorFlags.noCopy] flag set.
*/
struct GstShmAllocator;

/** */
struct GstShmAllocatorClass
{
  /**
      Parent Class.
  */
  GstFdAllocatorClass parentClass;
}

