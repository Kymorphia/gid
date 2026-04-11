/// Module for [GLBufferAllocator] class
module gstgl.glbuffer_allocator;

import gid.gid;
import gobject.gid_builder;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_memory_allocator;
import gstgl.types;

/**
    Opaque #GstGLBufferAllocator struct
*/
class GLBufferAllocator : gstgl.glbase_memory_allocator.GLBaseMemoryAllocator
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
    return cast(void function())gst_gl_buffer_allocator_get_type != &gidSymbolNotFound ? gst_gl_buffer_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBufferAllocator self()
  {
    return this;
  }

  /**
      Get builder for [gstgl.glbuffer_allocator.GLBufferAllocator]
      Returns: New builder object
  */
  static GLBufferAllocatorGidBuilder builder()
  {
    return new GLBufferAllocatorGidBuilder;
  }
}

/// Fluent builder implementation template for [gstgl.glbuffer_allocator.GLBufferAllocator]
class GLBufferAllocatorGidBuilderImpl(T) : gstgl.glbase_memory_allocator.GLBaseMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gstgl.glbuffer_allocator.GLBufferAllocator]
final class GLBufferAllocatorGidBuilder : GLBufferAllocatorGidBuilderImpl!GLBufferAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBufferAllocator build()
  {
    return new GLBufferAllocator(cast(void*)createGObject(GLBufferAllocator._getGType), No.Take);
  }
}
