/// Module for [ShmAllocator] class
module gid.gstallocators1.shm_allocator;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.allocator;
import gid.gstallocators1.c.functions;
import gid.gstallocators1.c.types;
import gid.gstallocators1.fd_allocator;
import gid.gstallocators1.types;

/**
    This is a subclass of #GstFdAllocator that implements the
    [gid.gst1.allocator.Allocator.alloc] method using `memfd_create()` when available, POSIX
    `shm_open()` otherwise. Platforms not supporting any of those (Windows) will
    always return null.
    
    Note that allocating new shared memories has a significant performance cost,
    it is thus recommended to keep a pool of pre-allocated #GstMemory, using
    #GstBufferPool. For that reason, this allocator has the
    [gid.gst1.types.AllocatorFlags.NoCopy] flag set.
*/
class ShmAllocator : gid.gstallocators1.fd_allocator.FdAllocator
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
    return cast(void function())gst_shm_allocator_get_type != &gidSymbolNotFound ? gst_shm_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstShmAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override ShmAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstallocators1.shm_allocator.ShmAllocator]
      Returns: New builder object
  */
  static ShmAllocatorGidBuilder builder() nothrow
  {
    return new ShmAllocatorGidBuilder;
  }

  /**
      Get the #GstShmAllocator singleton previously registered with
      [gid.gstallocators1.shm_allocator.ShmAllocator.initOnce].
      Returns: a #GstAllocator or null if
        [gid.gstallocators1.shm_allocator.ShmAllocator.initOnce] has not been previously called.
  */
  static gid.gst1.allocator.Allocator get() nothrow
  {
    GstAllocator* _cretval;
    _cretval = gst_shm_allocator_get();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(cast(GstAllocator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Register a #GstShmAllocator using [gid.gst1.allocator.Allocator.register] with the name
      [gid.gstallocators1.types.ALLOCATOR_SHM]. This is no-op after the first call.
  */
  static void initOnce() nothrow
  {
    gst_shm_allocator_init_once();
  }
}

/// Fluent builder implementation template for [gid.gstallocators1.shm_allocator.ShmAllocator]
class ShmAllocatorGidBuilderImpl(T) : gid.gstallocators1.fd_allocator.FdAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstallocators1.shm_allocator.ShmAllocator]
final class ShmAllocatorGidBuilder : ShmAllocatorGidBuilderImpl!ShmAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ShmAllocator build() nothrow
  {
    return new ShmAllocator(cast(void*)createGObject(ShmAllocator._getGType), Yes.Take);
  }
}
