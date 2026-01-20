/// Module for [GLMemoryEGL] class
module gstglegl.glmemory_egl;

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
  this()
  {
    super(gMalloc(GstGLMemoryEGL.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_memory_egl_get_type != &gidSymbolNotFound ? gst_gl_memory_egl_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMemoryEGL self()
  {
    return this;
  }

  /** */
  void* getDisplay()
  {
    auto _retval = gst_gl_memory_egl_get_display(cast(GstGLMemoryEGL*)this._cPtr);
    return _retval;
  }

  /** */
  void* getImage()
  {
    auto _retval = gst_gl_memory_egl_get_image(cast(GstGLMemoryEGL*)this._cPtr);
    return _retval;
  }

  /**
      Initializes the GL Memory allocator. It is safe to call this function
      multiple times.  This must be called before any other GstGLMemoryEGL operation.
  */
  static void initOnce()
  {
    gst_gl_memory_egl_init_once();
  }
}
