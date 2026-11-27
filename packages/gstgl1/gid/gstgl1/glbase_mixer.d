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
@gidGir("GLBaseMixer", "GLBaseMixerClass")
class GLBaseMixer : gid.gstvideo1.video_aggregator.VideoAggregator
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

  /**
      called in the GL thread to setup the element GL state.
      Returns: whether the start was successful
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGlStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGlStart()
  {
    auto _klass = cast(GstGLBaseMixerClass*)_vfuncClass;
    if (!_klass.glStart)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.glStart(cast(GstGLBaseMixer*)this._cPtr);
    return _retval;
  }

  /**
      called in the GL thread to setup the element GL state.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGlStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGlStop()
  {
    auto _klass = cast(GstGLBaseMixerClass*)_vfuncClass;
    if (!_klass.glStop)
      return;

    _klass.glStop(cast(GstGLBaseMixer*)this._cPtr);
  }

  /** */
  gid.gstgl1.glcontext.GLContext getGlContext() nothrow
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_base_mixer_get_gl_context(cast(GstGLBaseMixer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from GLBaseMixer
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstgl1.glbase_mixer.GLBaseMixer), T.stringof ~ " is not derived from gid.gstgl1.glbase_mixer.GLBaseMixer");

    gid.gstvideo1.video_aggregator.VideoAggregator._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGlStart", true)[0]) == gid.gstgl1.glbase_mixer.GLBaseMixer))
      _installVfunc(klass, "gl_start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGlStop", true)[0]) == gid.gstgl1.glbase_mixer.GLBaseMixer))
      _installVfunc(klass, "gl_stop");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstGLBaseMixerClass*)klass;

    switch (vfunc)
    {
      case "gl_start":
      {
        static extern(C) gboolean _vfuncGlStartTramp(GstGLBaseMixer* mix) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstgl1.glbase_mixer.GLBaseMixer)(cast(void*)mix);
          if (!_obj)
          {
            auto _klass = cast(GstGLBaseMixerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mix);
            if (_klass.glStart)
              return (cast(typeof(&_vfuncGlStartTramp))_klass.glStart)(mix);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGlStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glbase_mixer.GLBaseMixer.vfuncGlStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.glStart = cast(typeof(_klass.glStart))&_vfuncGlStartTramp;
        break;
      }
      case "gl_stop":
      {
        static extern(C) void _vfuncGlStopTramp(GstGLBaseMixer* mix) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gstgl1.glbase_mixer.GLBaseMixer)(cast(void*)mix);
          if (!_obj)
          {
            auto _klass = cast(GstGLBaseMixerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mix);
            if (_klass.glStop)
              return (cast(typeof(&_vfuncGlStopTramp))_klass.glStop)(mix);
            return;
          }

          try
          {
            _obj.vfuncGlStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glbase_mixer.GLBaseMixer.vfuncGlStop");
          }
        }

        _klass.glStop = cast(typeof(_klass.glStop))&_vfuncGlStopTramp;
        break;
      }
      default:
      break;
    }
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
