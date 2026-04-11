/// Module for [GLMixerPad] class
module gstgl.glmixer_pad;

import gid.gid;
import gobject.gid_builder;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_mixer_pad;
import gstgl.types;

/** */
class GLMixerPad : gstgl.glbase_mixer_pad.GLBaseMixerPad
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
    return cast(void function())gst_gl_mixer_pad_get_type != &gidSymbolNotFound ? gst_gl_mixer_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMixerPad self()
  {
    return this;
  }

  /**
      Get builder for [gstgl.glmixer_pad.GLMixerPad]
      Returns: New builder object
  */
  static GLMixerPadGidBuilder builder()
  {
    return new GLMixerPadGidBuilder;
  }
}

/// Fluent builder implementation template for [gstgl.glmixer_pad.GLMixerPad]
class GLMixerPadGidBuilderImpl(T) : gstgl.glbase_mixer_pad.GLBaseMixerPadGidBuilderImpl!T
{
}

/// Fluent builder for [gstgl.glmixer_pad.GLMixerPad]
final class GLMixerPadGidBuilder : GLMixerPadGidBuilderImpl!GLMixerPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLMixerPad build()
  {
    return new GLMixerPad(cast(void*)createGObject(GLMixerPad._getGType), No.Take);
  }
}
