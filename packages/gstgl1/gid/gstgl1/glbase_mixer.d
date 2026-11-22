/// Module for [GLBaseMixer] class
module gid.gstgl1.glbase_mixer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;
import gid.gstvideo1.video_aggregator;

/**
    #GstGLBaseMixer handles the nitty gritty details of retrieving an OpenGL
    context.  It provides some virtual methods to know when the OpenGL context
    is available and is not available within this element.
*/
class GLBaseMixer : gid.gstvideo1.video_aggregator.VideoAggregator
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
    return cast(void function())gst_gl_base_mixer_get_type != &gidSymbolNotFound ? gst_gl_base_mixer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLBaseMixer";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseMixer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glbase_mixer.GLBaseMixer]
      Returns: New builder object
  */
  static GLBaseMixerGidBuilder builder() nothrow
  {
    return new GLBaseMixerGidBuilder;
  }

  /**
      Get `context` property.
      Returns: The #GstGLContext in use by this #GstGLBaseMixer
  */
  @property gid.gstgl1.glcontext.GLContext context() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstgl1.glcontext.GLContext)("context");
  }

  /** */
  gid.gstgl1.glcontext.GLContext getGlContext() nothrow
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_base_mixer_get_gl_context(cast(GstGLBaseMixer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glbase_mixer.GLBaseMixer]
class GLBaseMixerGidBuilderImpl(T) : gid.gstvideo1.video_aggregator.VideoAggregatorGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glbase_mixer.GLBaseMixer]
final class GLBaseMixerGidBuilder : GLBaseMixerGidBuilderImpl!GLBaseMixerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBaseMixer build() nothrow
  {
    return new GLBaseMixer(cast(void*)createGObject(GLBaseMixer._getGType), Yes.Take);
  }
}
