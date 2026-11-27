/// Module for [VideoDmabufPool] class
module gid.gstvideo1.video_dmabuf_pool;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_buffer_pool;

/**
    Using #GstUdmabufAllocator, setting defaults and implementing implicit sync.
*/
@gidGir("VideoDmabufPool", "VideoDmabufPoolClass")
class VideoDmabufPool : gid.gstvideo1.video_buffer_pool.VideoBufferPool
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
      Get builder for [gid.gstvideo1.video_dmabuf_pool.VideoDmabufPool]
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
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GstBufferPool* _cretval;
      _cretval = gst_video_dmabuf_pool_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_dmabuf_pool.VideoDmabufPool]
class VideoDmabufPoolGidBuilderImpl(T) : gid.gstvideo1.video_buffer_pool.VideoBufferPoolGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstvideo1.video_dmabuf_pool.VideoDmabufPool]
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
