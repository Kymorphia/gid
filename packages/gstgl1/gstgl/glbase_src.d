/// Module for [GLBaseSrc] class
module gstgl.glbase_src;

import gid.gid;
import gobject.object;
import gstbase.push_src;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/**
    #GstGLBaseSrc handles the nitty gritty details of retrieving an OpenGL
    context. It also provided some wrappers around #GstBaseSrc's `start()` and
    `stop()` virtual methods that ensure an OpenGL context is available and
    current in the calling thread.
*/
class GLBaseSrc : gstbase.push_src.PushSrc
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_base_src_get_type != &gidSymbolNotFound ? gst_gl_base_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseSrc self()
  {
    return this;
  }

  /** */
  @property long timestampOffset()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("timestamp-offset");
  }

  /** */
  @property void timestampOffset(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("timestamp-offset", propval);
  }
}
