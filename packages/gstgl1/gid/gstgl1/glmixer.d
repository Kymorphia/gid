/// Module for [GLMixer] class
module gid.gstgl1.glmixer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glbase_mixer;
import gid.gstgl1.glframebuffer;
import gid.gstgl1.glmemory;
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

  /**
      Perform operations on the input buffers to produce an
      output buffer.
  
      Params:
        outbuf =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncProcessBuffers` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncProcessBuffers(gid.gst1.buffer.Buffer outbuf)
  {
    auto _klass = cast(GstGLMixerClass*)_vfuncClass;
    if (!_klass.processBuffers)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.processBuffers(cast(GstGLMixer*)this._cPtr, outbuf ? cast(GstBuffer*)outbuf._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Perform processing required and call #GstGLMixerClass::process_textures().
      Intended for use within implementations of
      #GstGLMixerClass::process_buffers().
  
      Params:
        outTex =  (modified in place, changes are seen by the caller)
      Returns: whether processing of textures succeeded
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncProcessTextures` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncProcessTextures(gid.gstgl1.glmemory.GLMemory outTex)
  {
    auto _klass = cast(GstGLMixerClass*)_vfuncClass;
    if (!_klass.processTextures)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.processTextures(cast(GstGLMixer*)this._cPtr, outTex ? cast(GstGLMemory*)outTex._cPtr(No.Dup) : null);
    return _retval;
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from GLMixer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstgl1.glmixer.GLMixer), T.stringof ~ " is not derived from gid.gstgl1.glmixer.GLMixer");

    gid.gstgl1.glbase_mixer.GLBaseMixer._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProcessBuffers", true)[0]) == gid.gstgl1.glmixer.GLMixer))
      _installVfunc(klass, "process_buffers");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncProcessTextures", true)[0]) == gid.gstgl1.glmixer.GLMixer))
      _installVfunc(klass, "process_textures");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstGLMixerClass*)klass;

    switch (vfunc)
    {
      case "process_buffers":
      {
        static extern(C) gboolean _vfuncProcessBuffersTramp(GstGLMixer* mix, GstBuffer* outbuf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glmixer.GLMixer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)mix);
          if (!_obj)
          {
            auto _klass = cast(GstGLMixerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mix);
            if (_klass.processBuffers)
              return (cast(typeof(&_vfuncProcessBuffersTramp))_klass.processBuffers)(mix, outbuf);
            return typeof(return).init;
          }

          bool _dretval;
          auto _outbuf = outbuf ? new gid.gst1.buffer.Buffer(cast(void*)outbuf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncProcessBuffers(_outbuf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glmixer.GLMixer.vfuncProcessBuffers");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_outbuf)
            _outbuf._cUnborrow;

          return _retval;
        }

        _klass.processBuffers = cast(typeof(_klass.processBuffers))&_vfuncProcessBuffersTramp;
        break;
      }
      case "process_textures":
      {
        static extern(C) gboolean _vfuncProcessTexturesTramp(GstGLMixer* mix, GstGLMemory* outTex) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glmixer.GLMixer)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)mix);
          if (!_obj)
          {
            auto _klass = cast(GstGLMixerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mix);
            if (_klass.processTextures)
              return (cast(typeof(&_vfuncProcessTexturesTramp))_klass.processTextures)(mix, outTex);
            return typeof(return).init;
          }

          bool _dretval;
          auto _outTex = outTex ? new gid.gstgl1.glmemory.GLMemory(cast(void*)outTex, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncProcessTextures(_outTex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glmixer.GLMixer.vfuncProcessTextures");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_outTex)
            _outTex._cUnborrow;

          return _retval;
        }

        _klass.processTextures = cast(typeof(_klass.processTextures))&_vfuncProcessTexturesTramp;
        break;
      }
      default:
      break;
    }
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
