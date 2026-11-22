/// Module for [FdAllocator] class
module gid.gstallocators1.fd_allocator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.allocator;
import gid.gst1.memory;
import gid.gstallocators1.c.functions;
import gid.gstallocators1.c.types;
import gid.gstallocators1.types;

/**
    Base class for allocators with fd-backed memory
*/
class FdAllocator : gid.gst1.allocator.Allocator
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
    return cast(void function())gst_fd_allocator_get_type != &gidSymbolNotFound ? gst_fd_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstFdAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override FdAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstallocators1.fd_allocator.FdAllocator]
      Returns: New builder object
  */
  static FdAllocatorGidBuilder builder() nothrow
  {
    return new FdAllocatorGidBuilder;
  }

  /**
      Return a new fd allocator.
      Returns: a new fd allocator. Use [gid.gst1.object.ObjectWrap.unref] to
        release the allocator after usage
  */
  this() nothrow
  {
    GstAllocator* _cretval;
    _cretval = gst_fd_allocator_new();
    this(_cretval, Yes.Take);
  }

  /**
      Return a [gid.gst1.memory.Memory] that wraps a generic file descriptor.
  
      Params:
        allocator = allocator to be used for this memory
        fd = file descriptor
        size = memory size
        flags = extra #GstFdMemoryFlags
      Returns: a GstMemory based on allocator.
        When the buffer will be released the allocator will close the fd unless
        the [gid.gstallocators1.types.FdMemoryFlags.DontClose] flag is specified.
        The memory is only mmapped on [gid.gst1.buffer.Buffer.map] request.
  */
  static gid.gst1.memory.Memory alloc(gid.gst1.allocator.Allocator allocator, int fd, size_t size, gid.gstallocators1.types.FdMemoryFlags flags) nothrow
  {
    GstMemory* _cretval;
    _cretval = gst_fd_allocator_alloc(allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, fd, size, flags);
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Return a [gid.gst1.memory.Memory] that wraps a generic file descriptor.
  
      Params:
        allocator = allocator to be used for this memory
        fd = file descriptor
        maxsize = the total size of the memory represented by fd
        offset = the offset of valid data in the memory
        size = the size of valid data in the memory
        flags = extra #GstFdMemoryFlags
      Returns: a GstMemory based on allocator.
        When the buffer will be released the allocator will close the fd unless
        the [gid.gstallocators1.types.FdMemoryFlags.DontClose] flag is specified.
        The memory is only mmapped on [gid.gst1.buffer.Buffer.map] request.
  */
  static gid.gst1.memory.Memory allocFull(gid.gst1.allocator.Allocator allocator, int fd, size_t maxsize, size_t offset, size_t size, gid.gstallocators1.types.FdMemoryFlags flags) nothrow
  {
    GstMemory* _cretval;
    _cretval = gst_fd_allocator_alloc_full(allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, fd, maxsize, offset, size, flags);
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstallocators1.fd_allocator.FdAllocator]
class FdAllocatorGidBuilderImpl(T) : gid.gst1.allocator.AllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstallocators1.fd_allocator.FdAllocator]
final class FdAllocatorGidBuilder : FdAllocatorGidBuilderImpl!FdAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FdAllocator build() nothrow
  {
    return new FdAllocator(cast(void*)createGObject(FdAllocator._getGType), Yes.Take);
  }
}
