/// Module for [GLMemoryPBOAllocator] class
module gstgl.glmemory_pboallocator;

import gid.gid;
import gobject.gid_builder;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glmemory_allocator;
import gstgl.types;

/**
    Opaque #GstGLMemoryPBOAllocator struct
*/
class GLMemoryPBOAllocator : gstgl.glmemory_allocator.GLMemoryAllocator
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
    return cast(void function())gst_gl_memory_pbo_allocator_get_type != &gidSymbolNotFound ? gst_gl_memory_pbo_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemoryPBOAllocator self()
  {
    return this;
  }

  /**
  Get builder for [gstgl.glmemory_pboallocator.GLMemoryPBOAllocator]
  Returns: New builder object
  */
  static GLMemoryPBOAllocatorGidBuilder builder()
  {
    return new GLMemoryPBOAllocatorGidBuilder;
  }
}

class GLMemoryPBOAllocatorGidBuilderImpl(T) : gstgl.glmemory_allocator.GLMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gstgl.glmemory_pboallocator.GLMemoryPBOAllocator]
final class GLMemoryPBOAllocatorGidBuilder : GLMemoryPBOAllocatorGidBuilderImpl!GLMemoryPBOAllocatorGidBuilder
{
  GLMemoryPBOAllocator build()
  {
    return new GLMemoryPBOAllocator(cast(void*)createGObject(GLMemoryPBOAllocator._getGType), No.Take);
  }
}
