/// Module for [GLMemoryAllocator] class
module gstgl.glmemory_allocator;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_memory_allocator;
import gstgl.glcontext;
import gstgl.types;

/**
    Opaque #GstGLMemoryAllocator struct
*/
class GLMemoryAllocator : gstgl.glbase_memory_allocator.GLBaseMemoryAllocator
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
    return cast(void function())gst_gl_memory_allocator_get_type != &gidSymbolNotFound ? gst_gl_memory_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemoryAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gstgl.glmemory_allocator.GLMemoryAllocator]
      Returns: New builder object
  */
  static GLMemoryAllocatorGidBuilder builder() nothrow
  {
    return new GLMemoryAllocatorGidBuilder;
  }

  /** */
  static gstgl.glmemory_allocator.GLMemoryAllocator getDefault(gstgl.glcontext.GLContext context) nothrow
  {
    GstGLMemoryAllocator* _cretval;
    _cretval = gst_gl_memory_allocator_get_default(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glmemory_allocator.GLMemoryAllocator)(cast(GstGLMemoryAllocator*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gstgl.glmemory_allocator.GLMemoryAllocator]
class GLMemoryAllocatorGidBuilderImpl(T) : gstgl.glbase_memory_allocator.GLBaseMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gstgl.glmemory_allocator.GLMemoryAllocator]
final class GLMemoryAllocatorGidBuilder : GLMemoryAllocatorGidBuilderImpl!GLMemoryAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLMemoryAllocator build() nothrow
  {
    return new GLMemoryAllocator(cast(void*)createGObject(GLMemoryAllocator._getGType), No.Take);
  }
}
