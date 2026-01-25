/// Module for [ShmAllocator] class
module gstallocators.shm_allocator;

import gid.gid;
import gobject.object;
import gst.allocator;
import gstallocators.c.functions;
import gstallocators.c.types;
import gstallocators.fd_allocator;
import gstallocators.types;

/**
    This is a subclass of #GstFdAllocator that implements the
    [gst.allocator.Allocator.alloc] method using `memfd_create()` when available, POSIX
    `shm_open()` otherwise. Platforms not supporting any of those (Windows) will
    always return null.
    
    Note that allocating new shared memories has a significant performance cost,
    it is thus recommended to keep a pool of pre-allocated #GstMemory, using
    #GstBufferPool. For that reason, this allocator has the
    [gst.types.AllocatorFlags.NoCopy] flag set.
*/
class ShmAllocator : gstallocators.fd_allocator.FdAllocator
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
    return cast(void function())gst_shm_allocator_get_type != &gidSymbolNotFound ? gst_shm_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ShmAllocator self()
  {
    return this;
  }

  /**
      Get the #GstShmAllocator singleton previously registered with
      [gstallocators.shm_allocator.ShmAllocator.initOnce].
      Returns: a #GstAllocator or null if
        [gstallocators.shm_allocator.ShmAllocator.initOnce] has not been previously called.
  */
  static gst.allocator.Allocator get()
  {
    GstAllocator* _cretval;
    _cretval = gst_shm_allocator_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.allocator.Allocator)(cast(GstAllocator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Register a #GstShmAllocator using [gst.allocator.Allocator.register] with the name
      [gstallocators.types.ALLOCATOR_SHM]. This is no-op after the first call.
  */
  static void initOnce()
  {
    gst_shm_allocator_init_once();
  }
}
