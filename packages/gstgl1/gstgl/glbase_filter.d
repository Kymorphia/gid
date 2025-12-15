/// Module for [GLBaseFilter] class
module gstgl.glbase_filter;

import gid.gid;
import gobject.object;
import gstbase.base_transform;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    #GstGLBaseFilter handles the nitty gritty details of retrieving an OpenGL
    context.  It also provided some wrappers around #GstBaseTransform's
    `start()`, `stop()` and `set_caps()` virtual methods that ensure an OpenGL
    context is available and current in the calling thread.
*/
class GLBaseFilter : gstbase.base_transform.BaseTransform
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
    return cast(void function())gst_gl_base_filter_get_type != &gidSymbolNotFound ? gst_gl_base_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseFilter self()
  {
    return this;
  }

  /** */
  @property gstgl.glcontext.GLContext context()
  {
    return gobject.object.ObjectWrap.getProperty!(gstgl.glcontext.GLContext)("context");
  }

  /** */
  bool findGlContext()
  {
    bool _retval;
    _retval = cast(bool)gst_gl_base_filter_find_gl_context(cast(GstGLBaseFilter*)this._cPtr);
    return _retval;
  }

  /** */
  gstgl.glcontext.GLContext getGlContext()
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_base_filter_get_gl_context(cast(GstGLBaseFilter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }
}
