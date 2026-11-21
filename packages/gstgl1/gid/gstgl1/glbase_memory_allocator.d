/// Module for [GLBaseMemoryAllocator] class
module gid.gstgl1.glbase_memory_allocator;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gst1.allocator;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/**
    Opaque #GstGLBaseMemoryAllocator struct
*/
class GLBaseMemoryAllocator : gid.gst1.allocator.Allocator
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
    return cast(void function())gst_gl_base_memory_allocator_get_type != &gidSymbolNotFound ? gst_gl_base_memory_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLBaseMemoryAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseMemoryAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator]
      Returns: New builder object
  */
  static GLBaseMemoryAllocatorGidBuilder builder() nothrow
  {
    return new GLBaseMemoryAllocatorGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator]
class GLBaseMemoryAllocatorGidBuilderImpl(T) : gid.gst1.allocator.AllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator]
final class GLBaseMemoryAllocatorGidBuilder : GLBaseMemoryAllocatorGidBuilderImpl!GLBaseMemoryAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBaseMemoryAllocator build() nothrow
  {
    return new GLBaseMemoryAllocator(cast(void*)createGObject(GLBaseMemoryAllocator._getGType), Yes.Take);
  }
}
