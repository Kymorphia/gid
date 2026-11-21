/// Module for [GLRenderbufferAllocator] class
module gid.gstgl1.glrenderbuffer_allocator;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glbase_memory_allocator;
import gid.gstgl1.types;

/**
    Opaque #GstGLRenderbufferAllocator struct
*/
class GLRenderbufferAllocator : gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator
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
    return cast(void function())gst_gl_renderbuffer_allocator_get_type != &gidSymbolNotFound ? gst_gl_renderbuffer_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLRenderbufferAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLRenderbufferAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glrenderbuffer_allocator.GLRenderbufferAllocator]
      Returns: New builder object
  */
  static GLRenderbufferAllocatorGidBuilder builder() nothrow
  {
    return new GLRenderbufferAllocatorGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glrenderbuffer_allocator.GLRenderbufferAllocator]
class GLRenderbufferAllocatorGidBuilderImpl(T) : gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glrenderbuffer_allocator.GLRenderbufferAllocator]
final class GLRenderbufferAllocatorGidBuilder : GLRenderbufferAllocatorGidBuilderImpl!GLRenderbufferAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLRenderbufferAllocator build() nothrow
  {
    return new GLRenderbufferAllocator(cast(void*)createGObject(GLRenderbufferAllocator._getGType), Yes.Take);
  }
}
