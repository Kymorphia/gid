/// Module for [GLBaseFilter] class
module gid.gstgl1.glbase_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstbase1.base_transform;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    #GstGLBaseFilter handles the nitty gritty details of retrieving an OpenGL
    context.  It also provided some wrappers around #GstBaseTransform's
    `start()`, `stop()` and `set_caps()` virtual methods that ensure an OpenGL
    context is available and current in the calling thread.
*/
class GLBaseFilter : gid.gstbase1.base_transform.BaseTransform
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
    return cast(void function())gst_gl_base_filter_get_type != &gidSymbolNotFound ? gst_gl_base_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLBaseFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glbase_filter.GLBaseFilter]
      Returns: New builder object
  */
  static GLBaseFilterGidBuilder builder() nothrow
  {
    return new GLBaseFilterGidBuilder;
  }

  /** */
  @property gid.gstgl1.glcontext.GLContext context() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstgl1.glcontext.GLContext)("context");
  }

  /** */
  bool findGlContext() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_base_filter_find_gl_context(cast(GstGLBaseFilter*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gstgl1.glcontext.GLContext getGlContext() nothrow
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_base_filter_get_gl_context(cast(GstGLBaseFilter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glbase_filter.GLBaseFilter]
class GLBaseFilterGidBuilderImpl(T) : gid.gstbase1.base_transform.BaseTransformGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glbase_filter.GLBaseFilter]
final class GLBaseFilterGidBuilder : GLBaseFilterGidBuilderImpl!GLBaseFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBaseFilter build() nothrow
  {
    return new GLBaseFilter(cast(void*)createGObject(GLBaseFilter._getGType), Yes.Take);
  }
}
