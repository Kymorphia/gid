/// Module for [GLAllocationParams] class
module gstgl.glallocation_params;

public import gid.basictypes;
import gid.gid;
import glib.types;
import gobject.boxed;
import gst.allocation_params;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/** */
class GLAllocationParams : gobject.boxed.Boxed
{

  /**
      Create a `glallocation_params.GLAllocationParams` boxed type.
      Params:
        structSize = the size of the struct (including and subclass data)
        free = a #GstGLAllocationParamsFreeFunc
        allocFlags = allocation flags
        allocSize = the allocation size
        context = a #GstGLContext
        notify = a #GDestroyNotify
  */
  this(size_t structSize = size_t.init, GstGLAllocationParamsFreeFunc free = GstGLAllocationParamsFreeFunc.init, uint allocFlags = uint.init, size_t allocSize = size_t.init, gstgl.glcontext.GLContext context = gstgl.glcontext.GLContext.init, GDestroyNotify notify = GDestroyNotify.init) nothrow
  {
    super(gMalloc(GstGLAllocationParams.sizeof), Yes.Take);
    this.structSize = structSize;
    this.free = free;
    this.allocFlags = allocFlags;
    this.allocSize = allocSize;
    this.context = context;
    this.notify = notify;
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
    return cast(void function())gst_gl_allocation_params_get_type != &gidSymbolNotFound ? gst_gl_allocation_params_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLAllocationParams self() nothrow
  {
    return this;
  }

  /**
      Get `structSize` field.
      Returns: the size of the struct (including and subclass data)
  */
  @property size_t structSize() nothrow
  {
    return (cast(GstGLAllocationParams*)this._cPtr).structSize;
  }

  /**
      Set `structSize` field.
      Params:
        propval = the size of the struct (including and subclass data)
  */
  @property void structSize(size_t propval) nothrow
  {
    (cast(GstGLAllocationParams*)this._cPtr).structSize = propval;
  }

  /**
      Get `free` field.
      Returns: a #GstGLAllocationParamsFreeFunc
  */
  @property GstGLAllocationParamsFreeFunc free() nothrow
  {
    return (cast(GstGLAllocationParams*)this._cPtr).free;
  }

  /**
      Set `free` field.
      Params:
        propval = a #GstGLAllocationParamsFreeFunc
  */

  @property void free(GstGLAllocationParamsFreeFunc propval) nothrow
  {
    (cast(GstGLAllocationParams*)this._cPtr).free = propval;
  }

  /**
      Get `allocFlags` field.
      Returns: allocation flags
  */
  @property uint allocFlags() nothrow
  {
    return (cast(GstGLAllocationParams*)this._cPtr).allocFlags;
  }

  /**
      Set `allocFlags` field.
      Params:
        propval = allocation flags
  */
  @property void allocFlags(uint propval) nothrow
  {
    (cast(GstGLAllocationParams*)this._cPtr).allocFlags = propval;
  }

  /**
      Get `allocSize` field.
      Returns: the allocation size
  */
  @property size_t allocSize() nothrow
  {
    return (cast(GstGLAllocationParams*)this._cPtr).allocSize;
  }

  /**
      Set `allocSize` field.
      Params:
        propval = the allocation size
  */
  @property void allocSize(size_t propval) nothrow
  {
    (cast(GstGLAllocationParams*)this._cPtr).allocSize = propval;
  }

  /**
      Get `allocParams` field.
      Returns: the #GstAllocationParams
  */
  @property gst.allocation_params.AllocationParams allocParams() nothrow
  {
    return cToD!(gst.allocation_params.AllocationParams)(cast(void*)(cast(GstGLAllocationParams*)this._cPtr).allocParams);
  }

  /**
      Get `context` field.
      Returns: a #GstGLContext
  */
  @property gstgl.glcontext.GLContext context() nothrow
  {
    return cToD!(gstgl.glcontext.GLContext)(cast(void*)(cast(GstGLAllocationParams*)this._cPtr).context);
  }

  /**
      Set `context` field.
      Params:
        propval = a #GstGLContext
  */
  @property void context(gstgl.glcontext.GLContext propval) nothrow
  {
    cValueFree!(gstgl.glcontext.GLContext)(cast(void*)(cast(GstGLAllocationParams*)this._cPtr).context);
    dToC(propval, cast(void*)&(cast(GstGLAllocationParams*)this._cPtr).context);
  }

  /**
      Get `notify` field.
      Returns: a #GDestroyNotify
  */
  @property GDestroyNotify notify() nothrow
  {
    return (cast(GstGLAllocationParams*)this._cPtr).notify;
  }

  /**
      Set `notify` field.
      Params:
        propval = a #GDestroyNotify
  */

  @property void notify(GDestroyNotify propval) nothrow
  {
    (cast(GstGLAllocationParams*)this._cPtr).notify = propval;
  }

  /** */
  gstgl.glallocation_params.GLAllocationParams copy() nothrow
  {
    GstGLAllocationParams* _cretval;
    _cretval = gst_gl_allocation_params_copy(cast(GstGLAllocationParams*)this._cPtr);
    auto _retval = _cretval ? new gstgl.glallocation_params.GLAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies the dynamically allocated data from src to dest.  Direct subclasses
      should call this function in their own overridden copy function.
  
      Params:
        dest = the destination #GstGLAllocationParams
  */
  void copyData(gstgl.glallocation_params.GLAllocationParams dest) nothrow
  {
    gst_gl_allocation_params_copy_data(cast(GstGLAllocationParams*)this._cPtr, dest ? cast(GstGLAllocationParams*)dest._cPtr(No.Dup) : null);
  }

  /**
      Frees the dynamically allocated data in params.  Direct subclasses
      should call this function in their own overridden free function.
  */
  void freeData() nothrow
  {
    gst_gl_allocation_params_free_data(cast(GstGLAllocationParams*)this._cPtr);
  }
}
