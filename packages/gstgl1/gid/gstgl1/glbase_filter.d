/// Module for [GLBaseFilter] class
module gid.gstgl1.glbase_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.caps;
import gid.gstbase1.base_transform;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    #GstGLBaseFilter handles the nitty gritty details of retrieving an OpenGL
    context.  It also provided some wrappers around #GstBaseTransform's
    `start()`, `stop()` and `set_caps()` virtual methods that ensure an OpenGL
    context is available and current in the calling thread.
*/
class GLBaseFilter : gid.gstbase1.base_transform.BaseTransform
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
    return cast(void function())gst_gl_base_filter_get_type != &gidSymbolNotFound ? gst_gl_base_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLBaseFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glbase_filter.GLBaseFilter]
      Returns: New builder object
  */
  static GLBaseFilterGidBuilder builder() nothrow
  {
    return new GLBaseFilterGidBuilder;
  }

  /** */
  @property gid.gstgl1.glcontext.GLContext context() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstgl1.glcontext.GLContext)("context");
  }

  /**
      called in the GL thread when caps are set on filter.
                    Note: this will also be called when changing OpenGL contexts
                    where #GstBaseTransform::set_caps may not.
  
      Params:
        incaps =  (modified in place, changes are seen by the caller)
        outcaps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGlSetCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGlSetCaps(gid.gst1.caps.Caps incaps, gid.gst1.caps.Caps outcaps)
  {
    auto _klass = cast(GstGLBaseFilterClass*)_vfuncClass;
    if (!_klass.glSetCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.glSetCaps(cast(GstGLBaseFilter*)this._cPtr, incaps ? cast(GstCaps*)incaps._cPtr(No.Dup) : null, outcaps ? cast(GstCaps*)outcaps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      called in the GL thread to setup the element GL state.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGlStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGlStart()
  {
    auto _klass = cast(GstGLBaseFilterClass*)_vfuncClass;
    if (!_klass.glStart)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.glStart(cast(GstGLBaseFilter*)this._cPtr);
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
    auto _klass = cast(GstGLBaseFilterClass*)_vfuncClass;
    if (!_klass.glStop)
      return;

    _klass.glStop(cast(GstGLBaseFilter*)this._cPtr);
  }

  /** */
  bool findGlContext() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_base_filter_find_gl_context(cast(GstGLBaseFilter*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gstgl1.glcontext.GLContext getGlContext() nothrow
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_base_filter_get_gl_context(cast(GstGLBaseFilter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from GLBaseFilter
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstgl1.glbase_filter.GLBaseFilter), T.stringof ~ " is not derived from gid.gstgl1.glbase_filter.GLBaseFilter");

    gid.gstbase1.base_transform.BaseTransform._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGlSetCaps", true)[0]) == gid.gstgl1.glbase_filter.GLBaseFilter))
      _installVfunc(klass, "gl_set_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGlStart", true)[0]) == gid.gstgl1.glbase_filter.GLBaseFilter))
      _installVfunc(klass, "gl_start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGlStop", true)[0]) == gid.gstgl1.glbase_filter.GLBaseFilter))
      _installVfunc(klass, "gl_stop");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstGLBaseFilterClass*)klass;

    switch (vfunc)
    {
      case "gl_set_caps":
      {
        static extern(C) gboolean _vfuncGlSetCapsTramp(GstGLBaseFilter* filter, GstCaps* incaps, GstCaps* outcaps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glbase_filter.GLBaseFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstGLBaseFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.glSetCaps)
              return (cast(typeof(&_vfuncGlSetCapsTramp))_klass.glSetCaps)(filter, incaps, outcaps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _incaps = incaps ? new gid.gst1.caps.Caps(cast(void*)incaps, Yes.Take)._cBorrow : null;
          auto _outcaps = outcaps ? new gid.gst1.caps.Caps(cast(void*)outcaps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGlSetCaps(_incaps, _outcaps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glbase_filter.GLBaseFilter.vfuncGlSetCaps");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_incaps)
            _incaps._cUnborrow;
          if (_outcaps)
            _outcaps._cUnborrow;

          return _retval;
        }

        _klass.glSetCaps = cast(typeof(_klass.glSetCaps))&_vfuncGlSetCapsTramp;
        break;
      }
      case "gl_start":
      {
        static extern(C) gboolean _vfuncGlStartTramp(GstGLBaseFilter* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glbase_filter.GLBaseFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstGLBaseFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.glStart)
              return (cast(typeof(&_vfuncGlStartTramp))_klass.glStart)(filter);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGlStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glbase_filter.GLBaseFilter.vfuncGlStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.glStart = cast(typeof(_klass.glStart))&_vfuncGlStartTramp;
        break;
      }
      case "gl_stop":
      {
        static extern(C) void _vfuncGlStopTramp(GstGLBaseFilter* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glbase_filter.GLBaseFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstGLBaseFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.glStop)
              return (cast(typeof(&_vfuncGlStopTramp))_klass.glStop)(filter);
            return;
          }

          try
          {
            _obj.vfuncGlStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glbase_filter.GLBaseFilter.vfuncGlStop");
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

/// Fluent builder implementation template for [gid.gstgl1.glbase_filter.GLBaseFilter]
class GLBaseFilterGidBuilderImpl(T) : gid.gstbase1.base_transform.BaseTransformGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glbase_filter.GLBaseFilter]
final class GLBaseFilterGidBuilder : GLBaseFilterGidBuilderImpl!GLBaseFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLBaseFilter build() nothrow
  {
    return new GLBaseFilter(cast(void*)createGObject(GLBaseFilter._getGType), Yes.Take);
  }
}
