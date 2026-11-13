/// Module for [VideoDmabufPool] class
module gstvideo.video_dmabuf_pool;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_buffer_pool;

/**
    Using #GstUdmabufAllocator, setting defaults and implementing implicit sync.
*/
class VideoDmabufPool : gstvideo.video_buffer_pool.VideoBufferPool
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
    return cast(void function())gst_video_dmabuf_pool_get_type != &gidSymbolNotFound ? gst_video_dmabuf_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoDmabufPool";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoDmabufPool self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gstvideo.video_dmabuf_pool.VideoDmabufPool]
      Returns: New builder object
  */
  static VideoDmabufPoolGidBuilder builder() nothrow
  {
    return new VideoDmabufPoolGidBuilder;
  }

  /**
      Create a new #GstVideoDmabufPool instance.
      Returns: a #GstVideoDmabufPool or null
            if dmabufs are not supported.
  */
  this() nothrow
  {
    GstBufferPool* _cretval;
    _cretval = gst_video_dmabuf_pool_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gstvideo.video_dmabuf_pool.VideoDmabufPool]
class VideoDmabufPoolGidBuilderImpl(T) : gstvideo.video_buffer_pool.VideoBufferPoolGidBuilderImpl!T
{
}

/// Fluent builder for [gstvideo.video_dmabuf_pool.VideoDmabufPool]
final class VideoDmabufPoolGidBuilder : VideoDmabufPoolGidBuilderImpl!VideoDmabufPoolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoDmabufPool build() nothrow
  {
    return new VideoDmabufPool(cast(void*)createGObject(VideoDmabufPool._getGType), Yes.Take);
  }
}
