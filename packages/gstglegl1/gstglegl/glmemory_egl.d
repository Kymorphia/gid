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
class GLMemoryEGL : gobject.boxed.BoxedWrap!(gst_gl_memory_egl_get_type)
{
  /**
      Create a `glmemory_egl.GLMemoryEGL` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!GstGLMemoryEGL(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
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
