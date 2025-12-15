/// Global functions for gstallocators1 library
module gstallocators.global;

import gid.gid;
import gst.memory;
import gstallocators.c.functions;
import gstallocators.c.types;
import gstallocators.types;


/**
    Return the file descriptor associated with mem.

    Params:
      mem = the memory to get the file descriptor
    Returns: the file descriptor associated with the memory, or -1.  The file
          descriptor is still owned by the GstMemory.  Use dup to take a copy
          if you intend to use it beyond the lifetime of this GstMemory.
*/
int dmabufMemoryGetFd(gst.memory.Memory mem)
{
  int _retval;
  _retval = gst_dmabuf_memory_get_fd(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Exports a DMABuf from the DRM Bumb buffer object. One can check if this
    feature is supported using [gstallocators.drmdumb_allocator.DRMDumbAllocator.hasPrimeExport];

    Params:
      mem = the memory to export from
    Returns: a #GstMemory from #GstDmaBufAllocator wrapping the exported dma-buf
         file descriptor.
*/
gst.memory.Memory drmDumbMemoryExportDmabuf(gst.memory.Memory mem)
{
  GstMemory* _cretval;
  _cretval = gst_drm_dumb_memory_export_dmabuf(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Return the DRM buffer object handle associated with mem.

    Params:
      mem = the memory to get the handle from
    Returns: the DRM buffer object handle associated with the memory, or 0.
          The handle is still owned by the GstMemory and cannot be used
          beyond the lifetime of this GstMemory unless it is being passed
          to DRM driver, which does handle a refcount internally.
*/
uint drmDumbMemoryGetHandle(gst.memory.Memory mem)
{
  uint _retval;
  _retval = gst_drm_dumb_memory_get_handle(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Get the fd from mem. Call [gstallocators.global.isFdMemory] to check if mem has
    an fd.

    Params:
      mem = #GstMemory
    Returns: the fd of mem or -1 when there is no fd on mem
*/
int fdMemoryGetFd(gst.memory.Memory mem)
{
  int _retval;
  _retval = gst_fd_memory_get_fd(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Check if mem is dmabuf memory.

    Params:
      mem = the memory to be check
    Returns: true if mem is dmabuf memory, otherwise false
*/
bool isDmabufMemory(gst.memory.Memory mem)
{
  bool _retval;
  _retval = cast(bool)gst_is_dmabuf_memory(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/** */
bool isDrmDumbMemory(gst.memory.Memory mem)
{
  bool _retval;
  _retval = cast(bool)gst_is_drm_dumb_memory(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Check if mem is memory backed by an fd

    Params:
      mem = #GstMemory
    Returns: true when mem has an fd that can be retrieved with
      [gstallocators.global.fdMemoryGetFd].
*/
bool isFdMemory(gst.memory.Memory mem)
{
  bool _retval;
  _retval = cast(bool)gst_is_fd_memory(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/** */
bool isPhysMemory(gst.memory.Memory mem)
{
  bool _retval;
  _retval = cast(bool)gst_is_phys_memory(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}

/** */
size_t physMemoryGetPhysAddr(gst.memory.Memory mem)
{
  size_t _retval;
  _retval = gst_phys_memory_get_phys_addr(mem ? cast(GstMemory*)mem._cPtr(No.Dup) : null);
  return _retval;
}
