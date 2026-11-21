/// Module for [GLBaseSrc] class
module gid.gstgl1.glbase_src;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstbase1.push_src;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    #GstGLBaseSrc handles the nitty gritty details of retrieving an OpenGL
    context. It also provided some wrappers around #GstBaseSrc's `start()` and
    `stop()` virtual methods that ensure an OpenGL context is available and
    current in the calling thread.
*/
class GLBaseSrc : gid.gstbase1.push_src.PushSrc
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
    return cast(void function())gst_gl_base_src_get_type != &gidSymbolNotFound ? gst_gl_base_src_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLBaseSrc";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseSrc self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glbase_src.GLBaseSrc]
      Returns: New builder object
  */
  static GLBaseSrcGidBuilder builder() nothrow
  {
    return new GLBaseSrcGidBuilder;
  }

  /** */
  @property long timestampOffset() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(long)("timestamp-offset");
  }

  /** */
  @property void timestampOffset(long propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(long)("timestamp-offset", propval);
  }

  /** */
  gid.gstgl1.glcontext.GLContext getGlContext() nothrow
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_base_src_get_gl_context(cast(GstGLBaseSrc*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glbase_src.GLBaseSrc]
class GLBaseSrcGidBuilderImpl(T) : gid.gstbase1.push_src.PushSrcGidBuilderImpl!T
{

  /** */
  T timestampOffset(long propval) nothrow
  {
    return setProperty("timestamp-offset", propval);
  }
}

/// Fluent builder for [gid.gstgl1.glbase_src.GLBaseSrc]
final class GLBaseSrcGidBuilder : GLBaseSrcGidBuilderImpl!GLBaseSrcGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBaseSrc build() nothrow
  {
    return new GLBaseSrc(cast(void*)createGObject(GLBaseSrc._getGType), Yes.Take);
  }
}
