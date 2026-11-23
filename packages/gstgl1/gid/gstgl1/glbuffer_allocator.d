/// Module for [GLBufferAllocator] class
module gid.gstgl1.glbuffer_allocator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glbase_memory_allocator;
import gid.gstgl1.types;

/**
    Opaque #GstGLBufferAllocator struct
*/
class GLBufferAllocator : gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator
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
    return cast(void function())gst_gl_buffer_allocator_get_type != &gidSymbolNotFound ? gst_gl_buffer_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLBufferAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBufferAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glbuffer_allocator.GLBufferAllocator]
      Returns: New builder object
  */
  static GLBufferAllocatorGidBuilder builder() nothrow
  {
    return new GLBufferAllocatorGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glbuffer_allocator.GLBufferAllocator]
class GLBufferAllocatorGidBuilderImpl(T) : gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glbuffer_allocator.GLBufferAllocator]
final class GLBufferAllocatorGidBuilder : GLBufferAllocatorGidBuilderImpl!GLBufferAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBufferAllocator build() nothrow
  {
    return new GLBufferAllocator(cast(void*)createGObject(GLBufferAllocator._getGType), Yes.Take);
  }
}
