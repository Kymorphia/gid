/// Module for [VideoBufferPool] class
module gid.gstvideo1.video_buffer_pool;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.buffer_pool;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/** */
class VideoBufferPool : gid.gst1.buffer_pool.BufferPool
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
    return cast(void function())gst_video_buffer_pool_get_type != &gidSymbolNotFound ? gst_video_buffer_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoBufferPool";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoBufferPool self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_buffer_pool.VideoBufferPool]
      Returns: New builder object
  */
  static VideoBufferPoolGidBuilder builder() nothrow
  {
    return new VideoBufferPoolGidBuilder;
  }

  /**
      Create a new bufferpool that can allocate video frames. This bufferpool
      supports all the video bufferpool options.
      Returns: a new #GstBufferPool to allocate video frames
  */
  this() nothrow
  {
    GstBufferPool* _cretval;
    _cretval = gst_video_buffer_pool_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_buffer_pool.VideoBufferPool]
class VideoBufferPoolGidBuilderImpl(T) : gid.gst1.buffer_pool.BufferPoolGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstvideo1.video_buffer_pool.VideoBufferPool]
final class VideoBufferPoolGidBuilder : VideoBufferPoolGidBuilderImpl!VideoBufferPoolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoBufferPool build() nothrow
  {
    return new VideoBufferPool(cast(void*)createGObject(VideoBufferPool._getGType), Yes.Take);
  }
}
