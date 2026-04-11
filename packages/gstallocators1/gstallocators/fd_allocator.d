/// Module for [FdAllocator] class
module gstallocators.fd_allocator;

import gid.gid;
import gobject.gid_builder;
import gst.allocator;
import gst.memory;
import gstallocators.c.functions;
import gstallocators.c.types;
import gstallocators.types;

/**
    Base class for allocators with fd-backed memory
*/
class FdAllocator : gst.allocator.Allocator
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_fd_allocator_get_type != &gidSymbolNotFound ? gst_fd_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FdAllocator self()
  {
    return this;
  }

  /**
      Get builder for [gstallocators.fd_allocator.FdAllocator]
      Returns: New builder object
  */
  static FdAllocatorGidBuilder builder()
  {
    return new FdAllocatorGidBuilder;
  }

  /**
      Return a new fd allocator.
      Returns: a new fd allocator. Use [gst.object.ObjectWrap.unref] to
        release the allocator after usage
  */
  this()
  {
    GstAllocator* _cretval;
    _cretval = gst_fd_allocator_new();
    this(_cretval, Yes.Take);
  }

  /**
      Return a [gst.memory.Memory] that wraps a generic file descriptor.
  
      Params:
        allocator = allocator to be used for this memory
        fd = file descriptor
        size = memory size
        flags = extra #GstFdMemoryFlags
      Returns: a GstMemory based on allocator.
        When the buffer will be released the allocator will close the fd unless
        the `GST_FD_MEMORY_FLAG_DONT_CLOSE` flag is specified.
        The memory is only mmapped on [gst.buffer.Buffer.map] request.
  */
  static gst.memory.Memory alloc(gst.allocator.Allocator allocator, int fd, size_t size, gstallocators.types.FdMemoryFlags flags)
  {
    GstMemory* _cretval;
    _cretval = gst_fd_allocator_alloc(allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, fd, size, flags);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gstallocators.fd_allocator.FdAllocator]
class FdAllocatorGidBuilderImpl(T) : gst.allocator.AllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gstallocators.fd_allocator.FdAllocator]
final class FdAllocatorGidBuilder : FdAllocatorGidBuilderImpl!FdAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FdAllocator build()
  {
    return new FdAllocator(cast(void*)createGObject(FdAllocator._getGType), Yes.Take);
  }
}
