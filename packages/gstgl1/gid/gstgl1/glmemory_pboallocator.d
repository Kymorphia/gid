/// Module for [GLMemoryPBOAllocator] class
module gid.gstgl1.glmemory_pboallocator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glmemory_allocator;
import gid.gstgl1.types;

/**
    Opaque #GstGLMemoryPBOAllocator struct
*/
@gidGir("GLMemoryPBOAllocator", "GLMemoryPBOAllocatorClass")
class GLMemoryPBOAllocator : gid.gstgl1.glmemory_allocator.GLMemoryAllocator
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_memory_pbo_allocator_get_type != &gidSymbolNotFound ? gst_gl_memory_pbo_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLMemoryPBOAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemoryPBOAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glmemory_pboallocator.GLMemoryPBOAllocator]
      Returns: New builder object
  */
  static GLMemoryPBOAllocatorGidBuilder builder() nothrow
  {
    return new GLMemoryPBOAllocatorGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glmemory_pboallocator.GLMemoryPBOAllocator]
class GLMemoryPBOAllocatorGidBuilderImpl(T) : gid.gstgl1.glmemory_allocator.GLMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glmemory_pboallocator.GLMemoryPBOAllocator]
final class GLMemoryPBOAllocatorGidBuilder : GLMemoryPBOAllocatorGidBuilderImpl!GLMemoryPBOAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLMemoryPBOAllocator build() nothrow
  {
    return new GLMemoryPBOAllocator(cast(void*)createGObject(GLMemoryPBOAllocator._getGType), Yes.Take);
  }
}
