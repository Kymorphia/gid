/// Module for [GLMemoryEGL] class
module gstglegl.glmemory_egl;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gstglegl.c.functions;
import gstglegl.c.types;
import gstglegl.types;

/**
    #GstGLMemoryEGL is created or wrapped through [gstgl.glbase_memory.GLBaseMemory.alloc]
    with #GstGLVideoAllocationParams.
*/
class GLMemoryEGL : gobject.boxed.Boxed
{

  /**
      Create a `glmemory_egl.GLMemoryEGL` boxed type.
  */
  this() nothrow
  {
    super(gMalloc(GstGLMemoryEGL.sizeof), Yes.Take);
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
    return cast(void function())gst_gl_memory_egl_get_type != &gidSymbolNotFound ? gst_gl_memory_egl_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemoryEGL self() nothrow
  {
    return this;
  }

  /** */
  void* getDisplay() nothrow
  {
    auto _retval = gst_gl_memory_egl_get_display(cast(GstGLMemoryEGL*)this._cPtr);
    return _retval;
  }

  /** */
  void* getImage() nothrow
  {
    auto _retval = gst_gl_memory_egl_get_image(cast(GstGLMemoryEGL*)this._cPtr);
    return _retval;
  }

  /**
      Initializes the GL Memory allocator. It is safe to call this function
      multiple times.  This must be called before any other GstGLMemoryEGL operation.
  */
  static void initOnce() nothrow
  {
    gst_gl_memory_egl_init_once();
  }
}
