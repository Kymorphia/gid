/// Module for [GLBaseMixerPad] class
module gid.gstgl1.glbase_mixer_pad;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;
import gid.gstvideo1.video_aggregator_pad;

/** */
class GLBaseMixerPad : gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_base_mixer_pad_get_type != &gidSymbolNotFound ? gst_gl_base_mixer_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLBaseMixerPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseMixerPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glbase_mixer_pad.GLBaseMixerPad]
      Returns: New builder object
  */
  static GLBaseMixerPadGidBuilder builder() nothrow
  {
    return new GLBaseMixerPadGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glbase_mixer_pad.GLBaseMixerPad]
class GLBaseMixerPadGidBuilderImpl(T) : gid.gstvideo1.video_aggregator_pad.VideoAggregatorPadGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glbase_mixer_pad.GLBaseMixerPad]
final class GLBaseMixerPadGidBuilder : GLBaseMixerPadGidBuilderImpl!GLBaseMixerPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBaseMixerPad build() nothrow
  {
    return new GLBaseMixerPad(cast(void*)createGObject(GLBaseMixerPad._getGType), Yes.Take);
  }
}
