/// Module for [GLMemoryEGLAllocator] class
module gstglegl.glmemory_eglallocator;

import gid.gid;
import gobject.gid_builder;
import gstgl.glmemory_allocator;
import gstglegl.c.functions;
import gstglegl.c.types;
import gstglegl.types;

/**
    Opaque #GstGLMemoryEGLAllocator struct
*/
class GLMemoryEGLAllocator : gstgl.glmemory_allocator.GLMemoryAllocator
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
    return cast(void function())gst_gl_memory_egl_allocator_get_type != &gidSymbolNotFound ? gst_gl_memory_egl_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemoryEGLAllocator self()
  {
    return this;
  }

  /**
  Get builder for [gstglegl.glmemory_eglallocator.GLMemoryEGLAllocator]
  Returns: New builder object
  */
  static GLMemoryEGLAllocatorGidBuilder builder()
  {
    return new GLMemoryEGLAllocatorGidBuilder;
  }
}

class GLMemoryEGLAllocatorGidBuilderImpl(T) : gstgl.glmemory_allocator.GLMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gstglegl.glmemory_eglallocator.GLMemoryEGLAllocator]
final class GLMemoryEGLAllocatorGidBuilder : GLMemoryEGLAllocatorGidBuilderImpl!GLMemoryEGLAllocatorGidBuilder
{
  GLMemoryEGLAllocator build()
  {
    return new GLMemoryEGLAllocator(cast(void*)createGObject(GLMemoryEGLAllocator._getGType), No.Take);
  }
}
