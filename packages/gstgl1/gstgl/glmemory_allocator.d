/// Module for [GLMemoryAllocator] class
module gstgl.glmemory_allocator;

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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_memory_allocator_get_type != &gidSymbolNotFound ? gst_gl_memory_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemoryAllocator self()
  {
    return this;
  }

  /**
  Get builder for [gstgl.glmemory_allocator.GLMemoryAllocator]
  Returns: New builder object
  */
  static GLMemoryAllocatorGidBuilder builder()
  {
    return new GLMemoryAllocatorGidBuilder;
  }

  /** */
  static gstgl.glmemory_allocator.GLMemoryAllocator getDefault(gstgl.glcontext.GLContext context)
  {
    GstGLMemoryAllocator* _cretval;
    _cretval = gst_gl_memory_allocator_get_default(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glmemory_allocator.GLMemoryAllocator)(cast(GstGLMemoryAllocator*)_cretval, Yes.Take);
    return _retval;
  }
}

class GLMemoryAllocatorGidBuilderImpl(T) : gstgl.glbase_memory_allocator.GLBaseMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gstgl.glmemory_allocator.GLMemoryAllocator]
final class GLMemoryAllocatorGidBuilder : GLMemoryAllocatorGidBuilderImpl!GLMemoryAllocatorGidBuilder
{
  GLMemoryAllocator build()
  {
    return new GLMemoryAllocator(cast(void*)createGObject(GLMemoryAllocator._getGType), No.Take);
  }
}
