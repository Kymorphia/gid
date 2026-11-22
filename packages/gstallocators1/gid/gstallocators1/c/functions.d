/// C functions for gstallocators1 library
module gid.gstallocators1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gstallocators1.c.types;
public import gid.gst1.c.types;

private immutable LIBS = ["gstallocators-1.0_0"];

// DRMDumbAllocator
private alias c_gst_drm_dumb_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_drm_dumb_allocator_get_typeFn c_gst_drm_dumb_allocator_get_type; ///
private alias c_gst_drm_dumb_allocator_new_with_device_pathFn = extern(C) GstAllocator* function(const(char)* drmDevicePath) nothrow;
__gshared c_gst_drm_dumb_allocator_new_with_device_pathFn c_gst_drm_dumb_allocator_new_with_device_path; ///
private alias c_gst_drm_dumb_allocator_new_with_fdFn = extern(C) GstAllocator* function(int drmFd) nothrow;
__gshared c_gst_drm_dumb_allocator_new_with_fdFn c_gst_drm_dumb_allocator_new_with_fd; ///
private alias c_gst_drm_dumb_allocator_allocFn = extern(C) GstMemory* function(GstAllocator* allocator, uint drmFourcc, uint width, uint height, uint* outPitch) nothrow;
__gshared c_gst_drm_dumb_allocator_allocFn c_gst_drm_dumb_allocator_alloc; ///
private alias c_gst_drm_dumb_allocator_has_prime_exportFn = extern(C) gboolean function(GstAllocator* allocator) nothrow;
__gshared c_gst_drm_dumb_allocator_has_prime_exportFn c_gst_drm_dumb_allocator_has_prime_export; ///

// DmaBufAllocator
private alias c_gst_dmabuf_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_dmabuf_allocator_get_typeFn c_gst_dmabuf_allocator_get_type; ///
private alias c_gst_dmabuf_allocator_newFn = extern(C) GstAllocator* function() nothrow;
__gshared c_gst_dmabuf_allocator_newFn c_gst_dmabuf_allocator_new; ///
private alias c_gst_dmabuf_allocator_allocFn = extern(C) GstMemory* function(GstAllocator* allocator, int fd, size_t size) nothrow;
__gshared c_gst_dmabuf_allocator_allocFn c_gst_dmabuf_allocator_alloc; ///
private alias c_gst_dmabuf_allocator_alloc_with_flagsFn = extern(C) GstMemory* function(GstAllocator* allocator, int fd, size_t size, GstFdMemoryFlags flags) nothrow;
__gshared c_gst_dmabuf_allocator_alloc_with_flagsFn c_gst_dmabuf_allocator_alloc_with_flags; ///

// FdAllocator
private alias c_gst_fd_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_fd_allocator_get_typeFn c_gst_fd_allocator_get_type; ///
private alias c_gst_fd_allocator_newFn = extern(C) GstAllocator* function() nothrow;
__gshared c_gst_fd_allocator_newFn c_gst_fd_allocator_new; ///
private alias c_gst_fd_allocator_allocFn = extern(C) GstMemory* function(GstAllocator* allocator, int fd, size_t size, GstFdMemoryFlags flags) nothrow;
__gshared c_gst_fd_allocator_allocFn c_gst_fd_allocator_alloc; ///
private alias c_gst_fd_allocator_alloc_fullFn = extern(C) GstMemory* function(GstAllocator* allocator, int fd, size_t maxsize, size_t offset, size_t size, GstFdMemoryFlags flags) nothrow;
__gshared c_gst_fd_allocator_alloc_fullFn c_gst_fd_allocator_alloc_full; ///

// PhysMemoryAllocator
private alias c_gst_phys_memory_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_phys_memory_allocator_get_typeFn c_gst_phys_memory_allocator_get_type; ///

// ShmAllocator
private alias c_gst_shm_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_shm_allocator_get_typeFn c_gst_shm_allocator_get_type; ///
private alias c_gst_shm_allocator_getFn = extern(C) GstAllocator* function() nothrow;
__gshared c_gst_shm_allocator_getFn c_gst_shm_allocator_get; ///
private alias c_gst_shm_allocator_init_onceFn = extern(C) void function() nothrow;
__gshared c_gst_shm_allocator_init_onceFn c_gst_shm_allocator_init_once; ///

// UdmabufAllocator
private alias c_gst_udmabuf_allocator_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_udmabuf_allocator_get_typeFn c_gst_udmabuf_allocator_get_type; ///
private alias c_gst_udmabuf_allocator_getFn = extern(C) GstAllocator* function() nothrow;
__gshared c_gst_udmabuf_allocator_getFn c_gst_udmabuf_allocator_get; ///
private alias c_gst_udmabuf_allocator_init_onceFn = extern(C) void function() nothrow;
__gshared c_gst_udmabuf_allocator_init_onceFn c_gst_udmabuf_allocator_init_once; ///

// global
private alias c_gst_dmabuf_memory_get_fdFn = extern(C) int function(GstMemory* mem) nothrow;
__gshared c_gst_dmabuf_memory_get_fdFn c_gst_dmabuf_memory_get_fd; ///
private alias c_gst_drm_dumb_memory_export_dmabufFn = extern(C) GstMemory* function(GstMemory* mem) nothrow;
__gshared c_gst_drm_dumb_memory_export_dmabufFn c_gst_drm_dumb_memory_export_dmabuf; ///
private alias c_gst_drm_dumb_memory_get_handleFn = extern(C) uint function(GstMemory* mem) nothrow;
__gshared c_gst_drm_dumb_memory_get_handleFn c_gst_drm_dumb_memory_get_handle; ///
private alias c_gst_fd_memory_get_fdFn = extern(C) int function(GstMemory* mem) nothrow;
__gshared c_gst_fd_memory_get_fdFn c_gst_fd_memory_get_fd; ///
private alias c_gst_is_dmabuf_memoryFn = extern(C) gboolean function(GstMemory* mem) nothrow;
__gshared c_gst_is_dmabuf_memoryFn c_gst_is_dmabuf_memory; ///
private alias c_gst_is_drm_dumb_memoryFn = extern(C) gboolean function(GstMemory* mem) nothrow;
__gshared c_gst_is_drm_dumb_memoryFn c_gst_is_drm_dumb_memory; ///
private alias c_gst_is_fd_memoryFn = extern(C) gboolean function(GstMemory* mem) nothrow;
__gshared c_gst_is_fd_memoryFn c_gst_is_fd_memory; ///
private alias c_gst_is_phys_memoryFn = extern(C) gboolean function(GstMemory* mem) nothrow;
__gshared c_gst_is_phys_memoryFn c_gst_is_phys_memory; ///
private alias c_gst_phys_memory_get_phys_addrFn = extern(C) size_t function(GstMemory* mem) nothrow;
__gshared c_gst_phys_memory_get_phys_addrFn c_gst_phys_memory_get_phys_addr; ///

// DRMDumbAllocator

/** */
alias gst_drm_dumb_allocator_get_type = c_gst_drm_dumb_allocator_get_type;

/** */
alias gst_drm_dumb_allocator_new_with_device_path = c_gst_drm_dumb_allocator_new_with_device_path;

/** */
alias gst_drm_dumb_allocator_new_with_fd = c_gst_drm_dumb_allocator_new_with_fd;

/** */
alias gst_drm_dumb_allocator_alloc = c_gst_drm_dumb_allocator_alloc;

/** */
alias gst_drm_dumb_allocator_has_prime_export = c_gst_drm_dumb_allocator_has_prime_export;

// DmaBufAllocator

/** */
alias gst_dmabuf_allocator_get_type = c_gst_dmabuf_allocator_get_type;

/** */
alias gst_dmabuf_allocator_new = c_gst_dmabuf_allocator_new;

/** */
alias gst_dmabuf_allocator_alloc = c_gst_dmabuf_allocator_alloc;

/** */
alias gst_dmabuf_allocator_alloc_with_flags = c_gst_dmabuf_allocator_alloc_with_flags;

// FdAllocator

/** */
alias gst_fd_allocator_get_type = c_gst_fd_allocator_get_type;

/** */
alias gst_fd_allocator_new = c_gst_fd_allocator_new;

/** */
alias gst_fd_allocator_alloc = c_gst_fd_allocator_alloc;

/** */
alias gst_fd_allocator_alloc_full = c_gst_fd_allocator_alloc_full;

// PhysMemoryAllocator

/** */
alias gst_phys_memory_allocator_get_type = c_gst_phys_memory_allocator_get_type;

// ShmAllocator

/** */
alias gst_shm_allocator_get_type = c_gst_shm_allocator_get_type;

/** */
alias gst_shm_allocator_get = c_gst_shm_allocator_get;

/** */
alias gst_shm_allocator_init_once = c_gst_shm_allocator_init_once;

// UdmabufAllocator

/** */
alias gst_udmabuf_allocator_get_type = c_gst_udmabuf_allocator_get_type;

/** */
alias gst_udmabuf_allocator_get = c_gst_udmabuf_allocator_get;

/** */
alias gst_udmabuf_allocator_init_once = c_gst_udmabuf_allocator_init_once;

// global

/** */
alias gst_dmabuf_memory_get_fd = c_gst_dmabuf_memory_get_fd;

/** */
alias gst_drm_dumb_memory_export_dmabuf = c_gst_drm_dumb_memory_export_dmabuf;

/** */
alias gst_drm_dumb_memory_get_handle = c_gst_drm_dumb_memory_get_handle;

/** */
alias gst_fd_memory_get_fd = c_gst_fd_memory_get_fd;

/** */
alias gst_is_dmabuf_memory = c_gst_is_dmabuf_memory;

/** */
alias gst_is_drm_dumb_memory = c_gst_is_drm_dumb_memory;

/** */
alias gst_is_fd_memory = c_gst_is_fd_memory;

/** */
alias gst_is_phys_memory = c_gst_is_phys_memory;

/** */
alias gst_phys_memory_get_phys_addr = c_gst_phys_memory_get_phys_addr;

shared static this()
{
  auto libs = gidResolveLibs(LIBS, "gid.gstallocators1");

  // DRMDumbAllocator
  gidLink(cast(void**)&gst_drm_dumb_allocator_get_type, "gst_drm_dumb_allocator_get_type", libs);
  gidLink(cast(void**)&gst_drm_dumb_allocator_new_with_device_path, "gst_drm_dumb_allocator_new_with_device_path", libs);
  gidLink(cast(void**)&gst_drm_dumb_allocator_new_with_fd, "gst_drm_dumb_allocator_new_with_fd", libs);
  gidLink(cast(void**)&gst_drm_dumb_allocator_alloc, "gst_drm_dumb_allocator_alloc", libs);
  gidLink(cast(void**)&gst_drm_dumb_allocator_has_prime_export, "gst_drm_dumb_allocator_has_prime_export", libs);

  // DmaBufAllocator
  gidLink(cast(void**)&gst_dmabuf_allocator_get_type, "gst_dmabuf_allocator_get_type", libs);
  gidLink(cast(void**)&gst_dmabuf_allocator_new, "gst_dmabuf_allocator_new", libs);
  gidLink(cast(void**)&gst_dmabuf_allocator_alloc, "gst_dmabuf_allocator_alloc", libs);
  gidLink(cast(void**)&gst_dmabuf_allocator_alloc_with_flags, "gst_dmabuf_allocator_alloc_with_flags", libs);

  // FdAllocator
  gidLink(cast(void**)&gst_fd_allocator_get_type, "gst_fd_allocator_get_type", libs);
  gidLink(cast(void**)&gst_fd_allocator_new, "gst_fd_allocator_new", libs);
  gidLink(cast(void**)&gst_fd_allocator_alloc, "gst_fd_allocator_alloc", libs);
  gidLink(cast(void**)&gst_fd_allocator_alloc_full, "gst_fd_allocator_alloc_full", libs);

  // PhysMemoryAllocator
  gidLink(cast(void**)&gst_phys_memory_allocator_get_type, "gst_phys_memory_allocator_get_type", libs);

  // ShmAllocator
  gidLink(cast(void**)&gst_shm_allocator_get_type, "gst_shm_allocator_get_type", libs);
  gidLink(cast(void**)&gst_shm_allocator_get, "gst_shm_allocator_get", libs);
  gidLink(cast(void**)&gst_shm_allocator_init_once, "gst_shm_allocator_init_once", libs);

  // UdmabufAllocator
  gidLink(cast(void**)&gst_udmabuf_allocator_get_type, "gst_udmabuf_allocator_get_type", libs);
  gidLink(cast(void**)&gst_udmabuf_allocator_get, "gst_udmabuf_allocator_get", libs);
  gidLink(cast(void**)&gst_udmabuf_allocator_init_once, "gst_udmabuf_allocator_init_once", libs);

  // global
  gidLink(cast(void**)&gst_dmabuf_memory_get_fd, "gst_dmabuf_memory_get_fd", libs);
  gidLink(cast(void**)&gst_drm_dumb_memory_export_dmabuf, "gst_drm_dumb_memory_export_dmabuf", libs);
  gidLink(cast(void**)&gst_drm_dumb_memory_get_handle, "gst_drm_dumb_memory_get_handle", libs);
  gidLink(cast(void**)&gst_fd_memory_get_fd, "gst_fd_memory_get_fd", libs);
  gidLink(cast(void**)&gst_is_dmabuf_memory, "gst_is_dmabuf_memory", libs);
  gidLink(cast(void**)&gst_is_drm_dumb_memory, "gst_is_drm_dumb_memory", libs);
  gidLink(cast(void**)&gst_is_fd_memory, "gst_is_fd_memory", libs);
  gidLink(cast(void**)&gst_is_phys_memory, "gst_is_phys_memory", libs);
  gidLink(cast(void**)&gst_phys_memory_get_phys_addr, "gst_phys_memory_get_phys_addr", libs);
}
