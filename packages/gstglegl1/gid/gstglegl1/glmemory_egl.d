/// Module for [GLMemoryEGL] class
module gid.gstglegl1.glmemory_egl;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.gstglegl1.c.functions;
import gid.gstglegl1.c.types;
import gid.gstglegl1.types;

/**
    #GstGLMemoryEGL is created or wrapped through [gid.gstgl1.glbase_memory.GLBaseMemory.alloc]
    with #GstGLVideoAllocationParams.
*/
class GLMemoryEGL : gid.gobject2.boxed.BoxedWrap!(gst_gl_memory_egl_get_type)
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
