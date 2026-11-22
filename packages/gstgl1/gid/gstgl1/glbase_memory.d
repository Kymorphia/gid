/// Module for [GLBaseMemory] class
module gid.gstgl1.glbase_memory;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gst1.memory;
import gid.gst1.types;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glallocation_params;
import gid.gstgl1.glbase_memory_allocator;
import gid.gstgl1.glcontext;
import gid.gstgl1.glquery;
import gid.gstgl1.types;

/**
    GstGLBaseMemory is a #GstMemory subclass providing the basis of support
    for the mapping of GL buffers.
    
    Data is uploaded or downloaded from the GPU as is necessary.
*/
class GLBaseMemory : gid.gobject2.boxed.BoxedWrap!(gst_gl_base_memory_get_type)
{
  /**
      Create a `glbase_memory.GLBaseMemory` boxed type.
      Params:
        mapFlags = 
        mapCount = 
        glMapCount = 
  */
  this(gid.gst1.types.MapFlags mapFlags = gid.gst1.types.MapFlags.init, int mapCount = int.init, int glMapCount = int.init) nothrow
  {
    super(boxedNew!GstGLBaseMemory(_getGType), Yes.Take);
    this.mapFlags = mapFlags;
    this.mapCount = mapCount;
    this.glMapCount = glMapCount;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseMemory self() nothrow
  {
    return this;
  }

  /**
      Get `mem` field.
      Returns: the parent object
  */
  @property gid.gst1.memory.Memory mem() nothrow
  {
    return cToD!(gid.gst1.memory.Memory)(cast(void*)&(cast(GstGLBaseMemory*)this._cPtr).mem);
  }

  /**
      Get `context` field.
      Returns: the #GstGLContext to use for GL operations
  */
  @property gid.gstgl1.glcontext.GLContext context() nothrow
  {
    return cToD!(gid.gstgl1.glcontext.GLContext)(cast(void*)(cast(GstGLBaseMemory*)this._cPtr).context);
  }

  /** */
  @property gid.gst1.types.MapFlags mapFlags() nothrow
  {
    return cast(gid.gst1.types.MapFlags)(cast(GstGLBaseMemory*)this._cPtr).mapFlags;
  }

  /** */
  @property void mapFlags(gid.gst1.types.MapFlags propval) nothrow
  {
    (cast(GstGLBaseMemory*)this._cPtr).mapFlags = cast(GstMapFlags)propval;
  }

  /** */
  @property int mapCount() nothrow
  {
    return (cast(GstGLBaseMemory*)this._cPtr).mapCount;
  }

  /** */
  @property void mapCount(int propval) nothrow
  {
    (cast(GstGLBaseMemory*)this._cPtr).mapCount = propval;
  }

  /** */
  @property int glMapCount() nothrow
  {
    return (cast(GstGLBaseMemory*)this._cPtr).glMapCount;
  }

  /** */
  @property void glMapCount(int propval) nothrow
  {
    (cast(GstGLBaseMemory*)this._cPtr).glMapCount = propval;
  }

  /** */
  @property gid.gstgl1.glquery.GLQuery query() nothrow
  {
    return (cast(GstGLBaseMemory*)this._cPtr).query ? new gid.gstgl1.glquery.GLQuery(cast(GstGLQuery*)(cast(GstGLBaseMemory*)this._cPtr).query, this) : null;
  }

  /**
      Note: only intended for subclass usage to allocate the system memory buffer
      on demand.  If there is already a non-NULL data pointer in gl_mem->data,
      then this function imply returns TRUE.
      Returns: whether the system memory could be allocated
  */
  bool allocData() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_base_memory_alloc_data(cast(GstGLBaseMemory*)this._cPtr);
    return _retval;
  }

  /** */
  bool memcpy(gid.gstgl1.glbase_memory.GLBaseMemory dest, ptrdiff_t offset, ptrdiff_t size) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_base_memory_memcpy(cast(GstGLBaseMemory*)this._cPtr, dest ? cast(GstGLBaseMemory*)dest._cPtr(No.Dup) : null, offset, size);
    return _retval;
  }

  /** */
  static gid.gstgl1.glbase_memory.GLBaseMemory alloc(gid.gstgl1.glbase_memory_allocator.GLBaseMemoryAllocator allocator, gid.gstgl1.glallocation_params.GLAllocationParams params) nothrow
  {
    GstGLBaseMemory* _cretval;
    _cretval = gst_gl_base_memory_alloc(allocator ? cast(GstGLBaseMemoryAllocator*)allocator._cPtr(No.Dup) : null, params ? cast(GstGLAllocationParams*)params._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gstgl1.glbase_memory.GLBaseMemory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Initializes the GL Base Memory allocator. It is safe to call this function
      multiple times.  This must be called before any other GstGLBaseMemory operation.
  */
  static void initOnce() nothrow
  {
    gst_gl_base_memory_init_once();
  }
}
