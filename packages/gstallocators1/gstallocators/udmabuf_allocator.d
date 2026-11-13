/// Module for [UdmabufAllocator] class
module gstallocators.udmabuf_allocator;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.allocator;
import gstallocators.c.functions;
import gstallocators.c.types;
import gstallocators.dma_buf_allocator;
import gstallocators.types;

/**
    This is a subclass of #GstDmaBufAllocator that implements the
    [gst.allocator.Allocator.alloc] method using `memfd_create()` and `UDMABUF_CREATE`.
    Platforms not supporting that (most non-Linux) will always return null.
*/
class UdmabufAllocator : gstallocators.dma_buf_allocator.DmaBufAllocator
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_udmabuf_allocator_get_type != &gidSymbolNotFound ? gst_udmabuf_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstUdmabufAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override UdmabufAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gstallocators.udmabuf_allocator.UdmabufAllocator]
      Returns: New builder object
  */
  static UdmabufAllocatorGidBuilder builder() nothrow
  {
    return new UdmabufAllocatorGidBuilder;
  }

  /**
      Get the #GstUdmabufAllocator singleton if available.
      Returns: a #GstAllocator or null if
        [gstallocators.udmabuf_allocator.UdmabufAllocator.initOnce] did not register the allocator.
  */
  static gst.allocator.Allocator get() nothrow
  {
    GstAllocator* _cretval;
    _cretval = gst_udmabuf_allocator_get();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.allocator.Allocator)(cast(GstAllocator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Register a #GstUdmabufAllocator using [gst.allocator.Allocator.register] with the name
      [gstallocators.types.ALLOCATOR_UDMABUF]. This is no-op after the first call.
  */
  static void initOnce() nothrow
  {
    gst_udmabuf_allocator_init_once();
  }
}

/// Fluent builder implementation template for [gstallocators.udmabuf_allocator.UdmabufAllocator]
class UdmabufAllocatorGidBuilderImpl(T) : gstallocators.dma_buf_allocator.DmaBufAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gstallocators.udmabuf_allocator.UdmabufAllocator]
final class UdmabufAllocatorGidBuilder : UdmabufAllocatorGidBuilderImpl!UdmabufAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UdmabufAllocator build() nothrow
  {
    return new UdmabufAllocator(cast(void*)createGObject(UdmabufAllocator._getGType), Yes.Take);
  }
}
