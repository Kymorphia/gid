/// Module for [GLMemoryAllocator] class
module gid.gstgl1.glmemory_allocator;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glbase_memory_allocator;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    Opaque #GstGLMemoryAllocator struct
*/
class GLMemoryAllocator : gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator
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
    return cast(void function())gst_gl_memory_allocator_get_type != &gidSymbolNotFound ? gst_gl_memory_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLMemoryAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemoryAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glmemory_allocator.GLMemoryAllocator]
      Returns: New builder object
  */
  static GLMemoryAllocatorGidBuilder builder() nothrow
  {
    return new GLMemoryAllocatorGidBuilder;
  }

  /** */
  static gid.gstgl1.glmemory_allocator.GLMemoryAllocator getDefault(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    GstGLMemoryAllocator* _cretval;
    _cretval = gst_gl_memory_allocator_get_default(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glmemory_allocator.GLMemoryAllocator)(cast(GstGLMemoryAllocator*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glmemory_allocator.GLMemoryAllocator]
class GLMemoryAllocatorGidBuilderImpl(T) : gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glmemory_allocator.GLMemoryAllocator]
final class GLMemoryAllocatorGidBuilder : GLMemoryAllocatorGidBuilderImpl!GLMemoryAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLMemoryAllocator build() nothrow
  {
    return new GLMemoryAllocator(cast(void*)createGObject(GLMemoryAllocator._getGType), Yes.Take);
  }
}
