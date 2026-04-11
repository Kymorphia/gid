/// Module for [VideoBufferPool] class
module gstvideo.video_buffer_pool;

import gid.gid;
import gobject.gid_builder;
import gst.buffer_pool;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/** */
class VideoBufferPool : gst.buffer_pool.BufferPool
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
    return cast(void function())gst_video_buffer_pool_get_type != &gidSymbolNotFound ? gst_video_buffer_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoBufferPool self()
  {
    return this;
  }

  /**
      Get builder for [gstvideo.video_buffer_pool.VideoBufferPool]
      Returns: New builder object
  */
  static VideoBufferPoolGidBuilder builder()
  {
    return new VideoBufferPoolGidBuilder;
  }

  /**
      Create a new bufferpool that can allocate video frames. This bufferpool
      supports all the video bufferpool options.
      Returns: a new #GstBufferPool to allocate video frames
  */
  this()
  {
    GstBufferPool* _cretval;
    _cretval = gst_video_buffer_pool_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gstvideo.video_buffer_pool.VideoBufferPool]
class VideoBufferPoolGidBuilderImpl(T) : gst.buffer_pool.BufferPoolGidBuilderImpl!T
{
}

/// Fluent builder for [gstvideo.video_buffer_pool.VideoBufferPool]
final class VideoBufferPoolGidBuilder : VideoBufferPoolGidBuilderImpl!VideoBufferPoolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoBufferPool build()
  {
    return new VideoBufferPool(cast(void*)createGObject(VideoBufferPool._getGType), Yes.Take);
  }
}
