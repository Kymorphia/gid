/// Module for [GLBaseMemory] class
module gstgl.glbase_memory;

public import gid.basictypes;
import gid.gid;
import glib.types;
import gobject.boxed;
import gst.allocation_params;
import gst.allocator;
import gst.memory;
import gst.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glallocation_params;
import gstgl.glbase_memory_allocator;
import gstgl.glcontext;
import gstgl.glquery;
import gstgl.types;

/**
    GstGLBaseMemory is a #GstMemory subclass providing the basis of support
    for the mapping of GL buffers.
    
    Data is uploaded or downloaded from the GPU as is necessary.
*/
class GLBaseMemory : gobject.boxed.Boxed
{

  /**
      Create a `glbase_memory.GLBaseMemory` boxed type.
      Params:
        context = the #GstGLContext to use for GL operations
        mapFlags = 
        mapCount = 
        glMapCount = 
  */
  this(gstgl.glcontext.GLContext context = gstgl.glcontext.GLContext.init, gst.types.MapFlags mapFlags = gst.types.MapFlags.init, int mapCount = int.init, int glMapCount = int.init) nothrow
  {
    super(gMalloc(GstGLBaseMemory.sizeof), Yes.Take);
    this.context = context;
    this.mapFlags = mapFlags;
    this.mapCount = mapCount;
    this.glMapCount = glMapCount;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_base_memory_get_type != &gidSymbolNotFound ? gst_gl_base_memory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
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
  @property gst.memory.Memory mem() nothrow
  {
    return cToD!(gst.memory.Memory)(cast(void*)&(cast(GstGLBaseMemory*)this._cPtr).mem);
  }

  /**
      Get `context` field.
      Returns: the #GstGLContext to use for GL operations
  */
  @property gstgl.glcontext.GLContext context() nothrow
  {
    return cToD!(gstgl.glcontext.GLContext)(cast(void*)(cast(GstGLBaseMemory*)this._cPtr).context);
  }

  /**
      Set `context` field.
      Params:
        propval = the #GstGLContext to use for GL operations
  */
  @property void context(gstgl.glcontext.GLContext propval) nothrow
  {
    cValueFree!(gstgl.glcontext.GLContext)(cast(void*)(cast(GstGLBaseMemory*)this._cPtr).context);
    dToC(propval, cast(void*)&(cast(GstGLBaseMemory*)this._cPtr).context);
  }

  /** */
  @property gst.types.MapFlags mapFlags() nothrow
  {
    return cast(gst.types.MapFlags)(cast(GstGLBaseMemory*)this._cPtr).mapFlags;
  }

  /** */
  @property void mapFlags(gst.types.MapFlags propval) nothrow
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
  @property gstgl.glquery.GLQuery query() nothrow
  {
    return new gstgl.glquery.GLQuery(cast(GstGLQuery*)(cast(GstGLBaseMemory*)this._cPtr).query, No.Take);
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

  /**
      Initializes mem with the required parameters
  
      Params:
        allocator = the #GstAllocator to initialize with
        parent = the parent #GstMemory to initialize with
        context = the #GstGLContext to initialize with
        params = the GstAllocationParams to initialize with
        size = the number of bytes to be allocated
        userData = user data to call notify with
        notify = a #GDestroyNotify
  */
  void init_(gst.allocator.Allocator allocator, gst.memory.Memory parent, gstgl.glcontext.GLContext context, gst.allocation_params.AllocationParams params, size_t size, void* userData = null, glib.types.DestroyNotify notify = null) nothrow
  {
    extern(C) void _notifyCallback(void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.DestroyNotify");
      }
    }
    auto _notifyCB = notify ? &_notifyCallback : null;
    gst_gl_base_memory_init(cast(GstGLBaseMemory*)this._cPtr, allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, parent ? cast(GstMemory*)parent._cPtr(No.Dup) : null, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)&params, size, userData, _notifyCB);
  }

  /** */
  bool memcpy(gstgl.glbase_memory.GLBaseMemory dest, ptrdiff_t offset, ptrdiff_t size) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_base_memory_memcpy(cast(GstGLBaseMemory*)this._cPtr, dest ? cast(GstGLBaseMemory*)dest._cPtr(No.Dup) : null, offset, size);
    return _retval;
  }

  /** */
  static gstgl.glbase_memory.GLBaseMemory alloc(gstgl.glbase_memory_allocator.GLBaseMemoryAllocator allocator, gstgl.glallocation_params.GLAllocationParams params) nothrow
  {
    GstGLBaseMemory* _cretval;
    _cretval = gst_gl_base_memory_alloc(allocator ? cast(GstGLBaseMemoryAllocator*)allocator._cPtr(No.Dup) : null, params ? cast(GstGLAllocationParams*)params._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gstgl.glbase_memory.GLBaseMemory(cast(void*)_cretval, Yes.Take) : null;
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
