/// Module for [GLMixer] class
module gid.gstgl1.glmixer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glbase_mixer;
import gid.gstgl1.glframebuffer;
import gid.gstgl1.types;

/**
    #GstGLMixer helps implement an element that operates on RGBA textures.
*/
class GLMixer : gid.gstgl1.glbase_mixer.GLBaseMixer
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
    return cast(void function())gst_gl_mixer_get_type != &gidSymbolNotFound ? gst_gl_mixer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLMixer";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLMixer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glmixer.GLMixer]
      Returns: New builder object
  */
  static GLMixerGidBuilder builder() nothrow
  {
    return new GLMixerGidBuilder;
  }

  /** */
  gid.gstgl1.glframebuffer.GLFramebuffer getFramebuffer() nothrow
  {
    GstGLFramebuffer* _cretval;
    _cretval = gst_gl_mixer_get_framebuffer(cast(GstGLMixer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glframebuffer.GLFramebuffer)(cast(GstGLFramebuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Perform processing required and call #GstGLMixerClass::process_textures().
      Intended for use within implementations of
      #GstGLMixerClass::process_buffers().
  
      Params:
        outbuf = output GstBuffer
      Returns: whether processing of textures succeeded
  */
  bool processTextures(gid.gst1.buffer.Buffer outbuf) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_mixer_process_textures(cast(GstGLMixer*)this._cPtr, outbuf ? cast(GstBuffer*)outbuf._cPtr(No.Dup) : null);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glmixer.GLMixer]
class GLMixerGidBuilderImpl(T) : gid.gstgl1.glbase_mixer.GLBaseMixerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glmixer.GLMixer]
final class GLMixerGidBuilder : GLMixerGidBuilderImpl!GLMixerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLMixer build() nothrow
  {
    return new GLMixer(cast(void*)createGObject(GLMixer._getGType), Yes.Take);
  }
}
