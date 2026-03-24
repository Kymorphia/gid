/// Module for [GLRenderbufferAllocator] class
module gstgl.glrenderbuffer_allocator;

import gid.gid;
import gobject.gid_builder;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_memory_allocator;
import gstgl.types;

/**
    Opaque #GstGLRenderbufferAllocator struct
*/
class GLRenderbufferAllocator : gstgl.glbase_memory_allocator.GLBaseMemoryAllocator
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
    return cast(void function())gst_gl_renderbuffer_allocator_get_type != &gidSymbolNotFound ? gst_gl_renderbuffer_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLRenderbufferAllocator self()
  {
    return this;
  }

  /**
  Get builder for [gstgl.glrenderbuffer_allocator.GLRenderbufferAllocator]
  Returns: New builder object
  */
  static GLRenderbufferAllocatorGidBuilder builder()
  {
    return new GLRenderbufferAllocatorGidBuilder;
  }
}

class GLRenderbufferAllocatorGidBuilderImpl(T) : gstgl.glbase_memory_allocator.GLBaseMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gstgl.glrenderbuffer_allocator.GLRenderbufferAllocator]
final class GLRenderbufferAllocatorGidBuilder : GLRenderbufferAllocatorGidBuilderImpl!GLRenderbufferAllocatorGidBuilder
{
  GLRenderbufferAllocator build()
  {
    return new GLRenderbufferAllocator(cast(void*)createGObject(GLRenderbufferAllocator._getGType), No.Take);
  }
}
