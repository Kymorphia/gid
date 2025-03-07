module gstallocators.c.functions;

public import gid.basictypes;
import gid.loader;
import gstallocators.c.types;
public import gst.c.types;

version(Windows)
  private immutable LIBS = ["libgstallocators-1.0-0.dll;gstallocators-1.0-0.dll;gstallocators-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgstallocators-1.0.0.dylib"];
else
  private immutable LIBS = ["libgstallocators-1.0.so.0"];

__gshared extern(C)
{
  // DRMDumbAllocator
  extern(C) GType function() c_gst_drm_dumb_allocator_get_type;
  GstAllocator* function(const(char)* drmDevicePath) c_gst_drm_dumb_allocator_new_with_device_path;
  GstAllocator* function(int drmFd) c_gst_drm_dumb_allocator_new_with_fd;
  GstMemory* function(GstAllocator* allocator, uint drmFourcc, uint width, uint height, uint* outPitch) c_gst_drm_dumb_allocator_alloc;
  bool function(GstAllocator* allocator) c_gst_drm_dumb_allocator_has_prime_export;

  // DmaBufAllocator
  extern(C) GType function() c_gst_dmabuf_allocator_get_type;
  GstAllocator* function() c_gst_dmabuf_allocator_new;
  GstMemory* function(GstAllocator* allocator, int fd, size_t size) c_gst_dmabuf_allocator_alloc;
  GstMemory* function(GstAllocator* allocator, int fd, size_t size, GstFdMemoryFlags flags) c_gst_dmabuf_allocator_alloc_with_flags;

  // FdAllocator
  extern(C) GType function() c_gst_fd_allocator_get_type;
  GstAllocator* function() c_gst_fd_allocator_new;
  GstMemory* function(GstAllocator* allocator, int fd, size_t size, GstFdMemoryFlags flags) c_gst_fd_allocator_alloc;

  // PhysMemoryAllocator
  extern(C) GType function() c_gst_phys_memory_allocator_get_type;

  // ShmAllocator
  extern(C) GType function() c_gst_shm_allocator_get_type;
  GstAllocator* function() c_gst_shm_allocator_get;
  void function() c_gst_shm_allocator_init_once;

  // global
  int function(GstMemory* mem) c_gst_dmabuf_memory_get_fd;
  GstMemory* function(GstMemory* mem) c_gst_drm_dumb_memory_export_dmabuf;
  uint function(GstMemory* mem) c_gst_drm_dumb_memory_get_handle;
  int function(GstMemory* mem) c_gst_fd_memory_get_fd;
  bool function(GstMemory* mem) c_gst_is_dmabuf_memory;
  bool function(GstMemory* mem) c_gst_is_drm_dumb_memory;
  bool function(GstMemory* mem) c_gst_is_fd_memory;
  bool function(GstMemory* mem) c_gst_is_phys_memory;
  size_t function(GstMemory* mem) c_gst_phys_memory_get_phys_addr;
}

// DRMDumbAllocator
alias gst_drm_dumb_allocator_get_type = c_gst_drm_dumb_allocator_get_type;
alias gst_drm_dumb_allocator_new_with_device_path = c_gst_drm_dumb_allocator_new_with_device_path;
alias gst_drm_dumb_allocator_new_with_fd = c_gst_drm_dumb_allocator_new_with_fd;
alias gst_drm_dumb_allocator_alloc = c_gst_drm_dumb_allocator_alloc;
alias gst_drm_dumb_allocator_has_prime_export = c_gst_drm_dumb_allocator_has_prime_export;

// DmaBufAllocator
alias gst_dmabuf_allocator_get_type = c_gst_dmabuf_allocator_get_type;
alias gst_dmabuf_allocator_new = c_gst_dmabuf_allocator_new;
alias gst_dmabuf_allocator_alloc = c_gst_dmabuf_allocator_alloc;
alias gst_dmabuf_allocator_alloc_with_flags = c_gst_dmabuf_allocator_alloc_with_flags;

// FdAllocator
alias gst_fd_allocator_get_type = c_gst_fd_allocator_get_type;
alias gst_fd_allocator_new = c_gst_fd_allocator_new;
alias gst_fd_allocator_alloc = c_gst_fd_allocator_alloc;

// PhysMemoryAllocator
alias gst_phys_memory_allocator_get_type = c_gst_phys_memory_allocator_get_type;

// ShmAllocator
alias gst_shm_allocator_get_type = c_gst_shm_allocator_get_type;
alias gst_shm_allocator_get = c_gst_shm_allocator_get;
alias gst_shm_allocator_init_once = c_gst_shm_allocator_init_once;

// global
alias gst_dmabuf_memory_get_fd = c_gst_dmabuf_memory_get_fd;
alias gst_drm_dumb_memory_export_dmabuf = c_gst_drm_dumb_memory_export_dmabuf;
alias gst_drm_dumb_memory_get_handle = c_gst_drm_dumb_memory_get_handle;
alias gst_fd_memory_get_fd = c_gst_fd_memory_get_fd;
alias gst_is_dmabuf_memory = c_gst_is_dmabuf_memory;
alias gst_is_drm_dumb_memory = c_gst_is_drm_dumb_memory;
alias gst_is_fd_memory = c_gst_is_fd_memory;
alias gst_is_phys_memory = c_gst_is_phys_memory;
alias gst_phys_memory_get_phys_addr = c_gst_phys_memory_get_phys_addr;

shared static this()
{
  // DRMDumbAllocator
  gidLink(cast(void**)&gst_drm_dumb_allocator_get_type, "gst_drm_dumb_allocator_get_type", LIBS);
  gidLink(cast(void**)&gst_drm_dumb_allocator_new_with_device_path, "gst_drm_dumb_allocator_new_with_device_path", LIBS);
  gidLink(cast(void**)&gst_drm_dumb_allocator_new_with_fd, "gst_drm_dumb_allocator_new_with_fd", LIBS);
  gidLink(cast(void**)&gst_drm_dumb_allocator_alloc, "gst_drm_dumb_allocator_alloc", LIBS);
  gidLink(cast(void**)&gst_drm_dumb_allocator_has_prime_export, "gst_drm_dumb_allocator_has_prime_export", LIBS);

  // DmaBufAllocator
  gidLink(cast(void**)&gst_dmabuf_allocator_get_type, "gst_dmabuf_allocator_get_type", LIBS);
  gidLink(cast(void**)&gst_dmabuf_allocator_new, "gst_dmabuf_allocator_new", LIBS);
  gidLink(cast(void**)&gst_dmabuf_allocator_alloc, "gst_dmabuf_allocator_alloc", LIBS);
  gidLink(cast(void**)&gst_dmabuf_allocator_alloc_with_flags, "gst_dmabuf_allocator_alloc_with_flags", LIBS);

  // FdAllocator
  gidLink(cast(void**)&gst_fd_allocator_get_type, "gst_fd_allocator_get_type", LIBS);
  gidLink(cast(void**)&gst_fd_allocator_new, "gst_fd_allocator_new", LIBS);
  gidLink(cast(void**)&gst_fd_allocator_alloc, "gst_fd_allocator_alloc", LIBS);

  // PhysMemoryAllocator
  gidLink(cast(void**)&gst_phys_memory_allocator_get_type, "gst_phys_memory_allocator_get_type", LIBS);

  // ShmAllocator
  gidLink(cast(void**)&gst_shm_allocator_get_type, "gst_shm_allocator_get_type", LIBS);
  gidLink(cast(void**)&gst_shm_allocator_get, "gst_shm_allocator_get", LIBS);
  gidLink(cast(void**)&gst_shm_allocator_init_once, "gst_shm_allocator_init_once", LIBS);

  // global
  gidLink(cast(void**)&gst_dmabuf_memory_get_fd, "gst_dmabuf_memory_get_fd", LIBS);
  gidLink(cast(void**)&gst_drm_dumb_memory_export_dmabuf, "gst_drm_dumb_memory_export_dmabuf", LIBS);
  gidLink(cast(void**)&gst_drm_dumb_memory_get_handle, "gst_drm_dumb_memory_get_handle", LIBS);
  gidLink(cast(void**)&gst_fd_memory_get_fd, "gst_fd_memory_get_fd", LIBS);
  gidLink(cast(void**)&gst_is_dmabuf_memory, "gst_is_dmabuf_memory", LIBS);
  gidLink(cast(void**)&gst_is_drm_dumb_memory, "gst_is_drm_dumb_memory", LIBS);
  gidLink(cast(void**)&gst_is_fd_memory, "gst_is_fd_memory", LIBS);
  gidLink(cast(void**)&gst_is_phys_memory, "gst_is_phys_memory", LIBS);
  gidLink(cast(void**)&gst_phys_memory_get_phys_addr, "gst_phys_memory_get_phys_addr", LIBS);
}
