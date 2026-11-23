/// Module for [GLMixerPad] class
module gid.gstgl1.glmixer_pad;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glbase_mixer_pad;
import gid.gstgl1.types;

/** */
class GLMixerPad : gid.gstgl1.glbase_mixer_pad.GLBaseMixerPad
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_mixer_pad_get_type != &gidSymbolNotFound ? gst_gl_mixer_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLMixerPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMixerPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glmixer_pad.GLMixerPad]
      Returns: New builder object
  */
  static GLMixerPadGidBuilder builder() nothrow
  {
    return new GLMixerPadGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glmixer_pad.GLMixerPad]
class GLMixerPadGidBuilderImpl(T) : gid.gstgl1.glbase_mixer_pad.GLBaseMixerPadGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glmixer_pad.GLMixerPad]
final class GLMixerPadGidBuilder : GLMixerPadGidBuilderImpl!GLMixerPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLMixerPad build() nothrow
  {
    return new GLMixerPad(cast(void*)createGObject(GLMixerPad._getGType), Yes.Take);
  }
}
