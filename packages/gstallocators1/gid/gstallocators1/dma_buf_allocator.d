/// Module for [DmaBufAllocator] class
module gid.gstallocators1.dma_buf_allocator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.allocator;
import gid.gst1.memory;
import gid.gstallocators1.c.functions;
import gid.gstallocators1.c.types;
import gid.gstallocators1.fd_allocator;
import gid.gstallocators1.types;

/**
    Base class for allocators with dmabuf-backed memory
*/
class DmaBufAllocator : gid.gstallocators1.fd_allocator.FdAllocator
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_dmabuf_allocator_get_type != &gidSymbolNotFound ? gst_dmabuf_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDmaBufAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override DmaBufAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstallocators1.dma_buf_allocator.DmaBufAllocator]
      Returns: New builder object
  */
  static DmaBufAllocatorGidBuilder builder() nothrow
  {
    return new DmaBufAllocatorGidBuilder;
  }

  /**
      Return a new dmabuf allocator.
      Returns: a new dmabuf allocator. Use [gid.gst1.object.ObjectWrap.unref] to
        release the allocator after usage
  */
  this() nothrow
  {
    GstAllocator* _cretval;
    _cretval = gst_dmabuf_allocator_new();
    this(_cretval, Yes.Take);
  }

  /**
      Return a [gid.gst1.memory.Memory] that wraps a dmabuf file descriptor.
  
      Params:
        allocator = allocator to be used for this memory
        fd = dmabuf file descriptor
        size = memory size
      Returns: a GstMemory based on allocator.
        When the buffer will be released dmabuf allocator will close the fd.
        The memory is only mmapped on [gid.gst1.buffer.Buffer.map] request.
  */
  static gid.gst1.memory.Memory alloc(gid.gst1.allocator.Allocator allocator, int fd, size_t size) nothrow
  {
    GstMemory* _cretval;
    _cretval = gst_dmabuf_allocator_alloc(allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, fd, size);
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Return a [gid.gst1.memory.Memory] that wraps a dmabuf file descriptor.
  
      Params:
        allocator = allocator to be used for this memory
        fd = dmabuf file descriptor
        size = memory size
        flags = extra #GstFdMemoryFlags
      Returns: a GstMemory based on allocator.
        
        When the buffer will be released the allocator will close the fd unless
        the [gid.gstallocators1.types.FdMemoryFlags.DontClose] flag is specified.
        The memory is only mmapped on gst_buffer_mmap() request.
  */
  static gid.gst1.memory.Memory allocWithFlags(gid.gst1.allocator.Allocator allocator, int fd, size_t size, gid.gstallocators1.types.FdMemoryFlags flags) nothrow
  {
    GstMemory* _cretval;
    _cretval = gst_dmabuf_allocator_alloc_with_flags(allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, fd, size, flags);
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstallocators1.dma_buf_allocator.DmaBufAllocator]
class DmaBufAllocatorGidBuilderImpl(T) : gid.gstallocators1.fd_allocator.FdAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstallocators1.dma_buf_allocator.DmaBufAllocator]
final class DmaBufAllocatorGidBuilder : DmaBufAllocatorGidBuilderImpl!DmaBufAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DmaBufAllocator build() nothrow
  {
    return new DmaBufAllocator(cast(void*)createGObject(DmaBufAllocator._getGType), Yes.Take);
  }
}
