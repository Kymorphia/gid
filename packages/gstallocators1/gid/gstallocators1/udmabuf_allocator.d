/// Module for [UdmabufAllocator] class
module gid.gstallocators1.udmabuf_allocator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.allocator;
import gid.gstallocators1.c.functions;
import gid.gstallocators1.c.types;
import gid.gstallocators1.dma_buf_allocator;
import gid.gstallocators1.types;

/**
    This is a subclass of #GstDmaBufAllocator that implements the
    [gid.gst1.allocator.Allocator.alloc] method using `memfd_create()` and `UDMABUF_CREATE`.
    Platforms not supporting that (most non-Linux) will always return null.
*/
class UdmabufAllocator : gid.gstallocators1.dma_buf_allocator.DmaBufAllocator
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
      Get builder for [gid.gstallocators1.udmabuf_allocator.UdmabufAllocator]
      Returns: New builder object
  */
  static UdmabufAllocatorGidBuilder builder() nothrow
  {
    return new UdmabufAllocatorGidBuilder;
  }

  /**
      Get the #GstUdmabufAllocator singleton if available.
      Returns: a #GstAllocator or null if
        [gid.gstallocators1.udmabuf_allocator.UdmabufAllocator.initOnce] did not register the allocator.
  */
  static gid.gst1.allocator.Allocator get() nothrow
  {
    GstAllocator* _cretval;
    _cretval = gst_udmabuf_allocator_get();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(cast(GstAllocator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Register a #GstUdmabufAllocator using [gid.gst1.allocator.Allocator.register] with the name
      [gid.gstallocators1.types.ALLOCATOR_UDMABUF]. This is no-op after the first call.
  */
  static void initOnce() nothrow
  {
    gst_udmabuf_allocator_init_once();
  }
}

/// Fluent builder implementation template for [gid.gstallocators1.udmabuf_allocator.UdmabufAllocator]
class UdmabufAllocatorGidBuilderImpl(T) : gid.gstallocators1.dma_buf_allocator.DmaBufAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstallocators1.udmabuf_allocator.UdmabufAllocator]
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
