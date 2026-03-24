/// Module for [GLBaseMixer] class
module gstgl.glbase_mixer;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;
import gstvideo.video_aggregator;

/**
    #GstGLBaseMixer handles the nitty gritty details of retrieving an OpenGL
    context.  It provides some virtual methods to know when the OpenGL context
    is available and is not available within this element.
*/
class GLBaseMixer : gstvideo.video_aggregator.VideoAggregator
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
    return cast(void function())gst_gl_base_mixer_get_type != &gidSymbolNotFound ? gst_gl_base_mixer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseMixer self()
  {
    return this;
  }

  /**
  Get builder for [gstgl.glbase_mixer.GLBaseMixer]
  Returns: New builder object
  */
  static GLBaseMixerGidBuilder builder()
  {
    return new GLBaseMixerGidBuilder;
  }

  /**
      Get `context` property.
      Returns: The #GstGLContext in use by this #GstGLBaseMixer
  */
  @property gstgl.glcontext.GLContext context()
  {
    return gobject.object.ObjectWrap.getProperty!(gstgl.glcontext.GLContext)("context");
  }

  /** */
  gstgl.glcontext.GLContext getGlContext()
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_base_mixer_get_gl_context(cast(GstGLBaseMixer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstgl.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }
}

class GLBaseMixerGidBuilderImpl(T) : gstvideo.video_aggregator.VideoAggregatorGidBuilderImpl!T
{
}

/// Fluent builder for [gstgl.glbase_mixer.GLBaseMixer]
final class GLBaseMixerGidBuilder : GLBaseMixerGidBuilderImpl!GLBaseMixerGidBuilder
{
  GLBaseMixer build()
  {
    return new GLBaseMixer(cast(void*)createGObject(GLBaseMixer._getGType), No.Take);
  }
}
