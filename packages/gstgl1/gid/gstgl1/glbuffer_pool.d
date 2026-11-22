/// Module for [GLBufferPool] class
module gid.gstgl1.glbuffer_pool;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.buffer_pool;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glallocation_params;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    a #GstGLBufferPool is an object that allocates buffers with #GstGLBaseMemory
    
    A #GstGLBufferPool is created with [gid.gstgl1.glbuffer_pool.GLBufferPool.new_]
    
    #GstGLBufferPool implements the VideoMeta buffer pool option
    [gid.gstvideo1.types.BUFFER_POOL_OPTION_VIDEO_META], the VideoAligment buffer pool option
    [gid.gstvideo1.types.BUFFER_POOL_OPTION_VIDEO_ALIGNMENT] as well as the OpenGL specific
    [gid.gstgl1.types.BUFFER_POOL_OPTION_GL_SYNC_META] buffer pool option.
*/
class GLBufferPool : gid.gst1.buffer_pool.BufferPool
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
    return cast(void function())gst_gl_buffer_pool_get_type != &gidSymbolNotFound ? gst_gl_buffer_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLBufferPool";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBufferPool self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glbuffer_pool.GLBufferPool]
      Returns: New builder object
  */
  static GLBufferPoolGidBuilder builder() nothrow
  {
    return new GLBufferPoolGidBuilder;
  }

  /** */
  this(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    GstBufferPool* _cretval;
    _cretval = gst_gl_buffer_pool_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      The returned #GstGLAllocationParams will by null before the first successful
      call to [gid.gst1.buffer_pool.BufferPool.setConfig].  Subsequent successful calls to
      [gid.gst1.buffer_pool.BufferPool.setConfig] will cause this function to return a new
      #GstGLAllocationParams which may or may not contain the same information.
      Returns: a copy of the #GstGLAllocationParams being used by the pool
  */
  gid.gstgl1.glallocation_params.GLAllocationParams getGlAllocationParams() nothrow
  {
    GstGLAllocationParams* _cretval;
    _cretval = gst_gl_buffer_pool_get_gl_allocation_params(cast(GstGLBufferPool*)this._cPtr);
    auto _retval = _cretval ? new gid.gstgl1.glallocation_params.GLAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glbuffer_pool.GLBufferPool]
class GLBufferPoolGidBuilderImpl(T) : gid.gst1.buffer_pool.BufferPoolGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glbuffer_pool.GLBufferPool]
final class GLBufferPoolGidBuilder : GLBufferPoolGidBuilderImpl!GLBufferPoolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBufferPool build() nothrow
  {
    return new GLBufferPool(cast(void*)createGObject(GLBufferPool._getGType), Yes.Take);
  }
}
