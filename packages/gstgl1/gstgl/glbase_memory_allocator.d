/// Module for [GLBaseMemoryAllocator] class
module gstgl.glbase_memory_allocator;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gst.allocator;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/**
    Opaque #GstGLBaseMemoryAllocator struct
*/
class GLBaseMemoryAllocator : gst.allocator.Allocator
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_base_memory_allocator_get_type != &gidSymbolNotFound ? gst_gl_base_memory_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseMemoryAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gstgl.glbase_memory_allocator.GLBaseMemoryAllocator]
      Returns: New builder object
  */
  static GLBaseMemoryAllocatorGidBuilder builder() nothrow
  {
    return new GLBaseMemoryAllocatorGidBuilder;
  }
}

/// Fluent builder implementation template for [gstgl.glbase_memory_allocator.GLBaseMemoryAllocator]
class GLBaseMemoryAllocatorGidBuilderImpl(T) : gst.allocator.AllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gstgl.glbase_memory_allocator.GLBaseMemoryAllocator]
final class GLBaseMemoryAllocatorGidBuilder : GLBaseMemoryAllocatorGidBuilderImpl!GLBaseMemoryAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBaseMemoryAllocator build() nothrow
  {
    return new GLBaseMemoryAllocator(cast(void*)createGObject(GLBaseMemoryAllocator._getGType), No.Take);
  }
}
