/// Module for [GLBaseSrc] class
module gid.gstgl1.glbase_src;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gstbase1.push_src;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.glmemory;
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

  /**
      called in the GL thread to fill the current video texture.
  
      Params:
        mem =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFillGlMemory` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncFillGlMemory(gid.gstgl1.glmemory.GLMemory mem)
  {
    auto _klass = cast(GstGLBaseSrcClass*)_vfuncClass;
    if (!_klass.fillGlMemory)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.fillGlMemory(cast(GstGLBaseSrc*)this._cPtr, mem ? cast(GstGLMemory*)mem._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      called in the GL thread to setup the element GL state.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGlStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncGlStart()
  {
    auto _klass = cast(GstGLBaseSrcClass*)_vfuncClass;
    if (!_klass.glStart)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.glStart(cast(GstGLBaseSrc*)this._cPtr);
    return _retval;
  }

  /**
      called in the GL thread to setup the element GL state.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGlStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncGlStop()
  {
    auto _klass = cast(GstGLBaseSrcClass*)_vfuncClass;
    if (!_klass.glStop)
      return;

    _klass.glStop(cast(GstGLBaseSrc*)this._cPtr);
  }

  /** */
  gid.gstgl1.glcontext.GLContext getGlContext() nothrow
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_base_src_get_gl_context(cast(GstGLBaseSrc*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from GLBaseSrc
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstgl1.glbase_src.GLBaseSrc), T.stringof ~ " is not derived from gid.gstgl1.glbase_src.GLBaseSrc");

    gid.gstbase1.push_src.PushSrc._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFillGlMemory", true)[0]) == gid.gstgl1.glbase_src.GLBaseSrc))
      _installVfunc(klass, "fill_gl_memory");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGlStart", true)[0]) == gid.gstgl1.glbase_src.GLBaseSrc))
      _installVfunc(klass, "gl_start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGlStop", true)[0]) == gid.gstgl1.glbase_src.GLBaseSrc))
      _installVfunc(klass, "gl_stop");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstGLBaseSrcClass*)klass;

    switch (vfunc)
    {
      case "fill_gl_memory":
      {
        static extern(C) gboolean _vfuncFillGlMemoryTramp(GstGLBaseSrc* src, GstGLMemory* mem) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glbase_src.GLBaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstGLBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.fillGlMemory)
              return (cast(typeof(&_vfuncFillGlMemoryTramp))_klass.fillGlMemory)(src, mem);
            return typeof(return).init;
          }

          bool _dretval;
          auto _mem = mem ? new gid.gstgl1.glmemory.GLMemory(cast(void*)mem, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncFillGlMemory(_mem);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glbase_src.GLBaseSrc.vfuncFillGlMemory");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_mem)
            _mem._cUnborrow;

          return _retval;
        }

        _klass.fillGlMemory = cast(typeof(_klass.fillGlMemory))&_vfuncFillGlMemoryTramp;
        break;
      }
      case "gl_start":
      {
        static extern(C) gboolean _vfuncGlStartTramp(GstGLBaseSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glbase_src.GLBaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstGLBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.glStart)
              return (cast(typeof(&_vfuncGlStartTramp))_klass.glStart)(src);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGlStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glbase_src.GLBaseSrc.vfuncGlStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.glStart = cast(typeof(_klass.glStart))&_vfuncGlStartTramp;
        break;
      }
      case "gl_stop":
      {
        static extern(C) void _vfuncGlStopTramp(GstGLBaseSrc* src) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glbase_src.GLBaseSrc)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)src);
          if (!_obj)
          {
            auto _klass = cast(GstGLBaseSrcClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)src);
            if (_klass.glStop)
              return (cast(typeof(&_vfuncGlStopTramp))_klass.glStop)(src);
            return;
          }

          try
          {
            _obj.vfuncGlStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glbase_src.GLBaseSrc.vfuncGlStop");
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
