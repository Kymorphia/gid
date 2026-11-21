/// Module for [GLMemoryEGLAllocator] class
module gid.gstglegl1.glmemory_eglallocator;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gstgl1.glmemory_allocator;
import gid.gstglegl1.c.functions;
import gid.gstglegl1.c.types;
import gid.gstglegl1.types;

/**
    Opaque #GstGLMemoryEGLAllocator struct
*/
class GLMemoryEGLAllocator : gid.gstgl1.glmemory_allocator.GLMemoryAllocator
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
    return cast(void function())gst_gl_memory_egl_allocator_get_type != &gidSymbolNotFound ? gst_gl_memory_egl_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLMemoryEGLAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemoryEGLAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstglegl1.glmemory_eglallocator.GLMemoryEGLAllocator]
      Returns: New builder object
  */
  static GLMemoryEGLAllocatorGidBuilder builder() nothrow
  {
    return new GLMemoryEGLAllocatorGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstglegl1.glmemory_eglallocator.GLMemoryEGLAllocator]
class GLMemoryEGLAllocatorGidBuilderImpl(T) : gid.gstgl1.glmemory_allocator.GLMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstglegl1.glmemory_eglallocator.GLMemoryEGLAllocator]
final class GLMemoryEGLAllocatorGidBuilder : GLMemoryEGLAllocatorGidBuilderImpl!GLMemoryEGLAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLMemoryEGLAllocator build() nothrow
  {
    return new GLMemoryEGLAllocator(cast(void*)createGObject(GLMemoryEGLAllocator._getGType), Yes.Take);
  }
}
