/// Module for [GLBufferPool] class
module gstgl.glbuffer_pool;

import gid.gid;
import gst.buffer_pool;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glallocation_params;
import gstgl.glcontext;
import gstgl.types;

/**
    a #GstGLBufferPool is an object that allocates buffers with #GstGLBaseMemory
    
    A #GstGLBufferPool is created with [gstgl.glbuffer_pool.GLBufferPool.new_]
    
    #GstGLBufferPool implements the VideoMeta buffer pool option
    [gstvideo.types.BUFFER_POOL_OPTION_VIDEO_META], the VideoAligment buffer pool option
    [gstvideo.types.BUFFER_POOL_OPTION_VIDEO_ALIGNMENT] as well as the OpenGL specific
    [gstgl.types.BUFFER_POOL_OPTION_GL_SYNC_META] buffer pool option.
*/
class GLBufferPool : gst.buffer_pool.BufferPool
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
    return cast(void function())gst_gl_buffer_pool_get_type != &gidSymbolNotFound ? gst_gl_buffer_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBufferPool self()
  {
    return this;
  }

  /** */
  this(gstgl.glcontext.GLContext context)
  {
    GstBufferPool* _cretval;
    _cretval = gst_gl_buffer_pool_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      The returned #GstGLAllocationParams will by null before the first successful
      call to [gst.buffer_pool.BufferPool.setConfig].  Subsequent successful calls to
      [gst.buffer_pool.BufferPool.setConfig] will cause this function to return a new
      #GstGLAllocationParams which may or may not contain the same information.
      Returns: a copy of the #GstGLAllocationParams being used by the pool
  */
  gstgl.glallocation_params.GLAllocationParams getGlAllocationParams()
  {
    GstGLAllocationParams* _cretval;
    _cretval = gst_gl_buffer_pool_get_gl_allocation_params(cast(GstGLBufferPool*)this._cPtr);
    auto _retval = _cretval ? new gstgl.glallocation_params.GLAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
