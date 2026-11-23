/// Module for [GLFilter] class
module gid.gstgl1.glfilter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.types;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glbase_filter;
import gid.gstgl1.glmemory;
import gid.gstgl1.glshader;
import gid.gstgl1.types;

/**
    #GstGLFilter helps to implement simple OpenGL filter elements taking a
    single input and producing a single output with a #GstGLFramebuffer
*/
class GLFilter : gid.gstgl1.glbase_filter.GLBaseFilter
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
    return cast(void function())gst_gl_filter_get_type != &gidSymbolNotFound ? gst_gl_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glfilter.GLFilter]
      Returns: New builder object
  */
  static GLFilterGidBuilder builder() nothrow
  {
    return new GLFilterGidBuilder;
  }

  /**
      perform operations on the input and output buffers.  In general,
               you should avoid using this method if at all possible. One valid
               use-case for using this is keeping previous buffers for future calculations.
               Note: If filter exists, then filter_texture is not run
  
      Params:
        inbuf =  (modified in place, changes are seen by the caller)
        outbuf =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFilter` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFilter(gid.gst1.buffer.Buffer inbuf, gid.gst1.buffer.Buffer outbuf)
  {
    auto _klass = cast(GstGLFilterClass*)_vfuncClass;
    if (!_klass.filter)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.filter(cast(GstGLFilter*)this._cPtr, inbuf ? cast(GstBuffer*)inbuf._cPtr(No.Dup) : null, outbuf ? cast(GstBuffer*)outbuf._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calls filter_texture vfunc with correctly mapped #GstGLMemorys
  
      Params:
        input = an input buffer (modified in place, changes are seen by the caller)
        output = an output buffer (modified in place, changes are seen by the caller)
      Returns: whether the transformation succeeded
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFilterTexture` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFilterTexture(gid.gstgl1.glmemory.GLMemory input, gid.gstgl1.glmemory.GLMemory output)
  {
    auto _klass = cast(GstGLFilterClass*)_vfuncClass;
    if (!_klass.filterTexture)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.filterTexture(cast(GstGLFilter*)this._cPtr, input ? cast(GstGLMemory*)input._cPtr(No.Dup) : null, output ? cast(GstGLMemory*)output._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      perform initialization when the Framebuffer object is created
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInitFbo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncInitFbo()
  {
    auto _klass = cast(GstGLFilterClass*)_vfuncClass;
    if (!_klass.initFbo)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.initFbo(cast(GstGLFilter*)this._cPtr);
    return _retval;
  }

  /**
      mirror from #GstBaseTransform
  
      Params:
        incaps =  (modified in place, changes are seen by the caller)
        outcaps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  override protected bool vfuncSetCaps(gid.gst1.caps.Caps incaps, gid.gst1.caps.Caps outcaps)
  {
    auto _klass = cast(GstGLFilterClass*)_vfuncClass;
    if (!_klass.setCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCaps(cast(GstGLFilter*)this._cPtr, incaps ? cast(GstCaps*)incaps._cPtr(No.Dup) : null, outcaps ? cast(GstCaps*)outcaps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Perform sub-class specific modifications of the
        caps to be processed between upload on input and before download for output.
  
      Params:
        direction = 
        caps =  (modified in place, changes are seen by the caller)
        filterCaps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTransformInternalCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncTransformInternalCaps(gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps, gid.gst1.caps.Caps filterCaps)
  {
    auto _klass = cast(GstGLFilterClass*)_vfuncClass;
    if (!_klass.transformInternalCaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.transformInternalCaps(cast(GstGLFilter*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filterCaps ? cast(GstCaps*)filterCaps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Render a fullscreen quad using the current GL state.  The only GL state this
      modifies is the necessary vertex/index buffers and, if necessary, a
      Vertex Array Object for drawing a fullscreen quad.  Framebuffer state,
      any shaders, viewport state, etc must be setup by the caller.
  */
  void drawFullscreenQuad() nothrow
  {
    gst_gl_filter_draw_fullscreen_quad(cast(GstGLFilter*)this._cPtr);
  }

  /**
      Calls filter_texture vfunc with correctly mapped #GstGLMemorys
  
      Params:
        input = an input buffer
        output = an output buffer
      Returns: whether the transformation succeeded
  */
  bool filterTexture(gid.gst1.buffer.Buffer input, gid.gst1.buffer.Buffer output) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_filter_filter_texture(cast(GstGLFilter*)this._cPtr, input ? cast(GstBuffer*)input._cPtr(No.Dup) : null, output ? cast(GstBuffer*)output._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Transforms input into output using func on through FBO.
  
      Params:
        input = the input texture
        output = the output texture
        func = the function to transform input into output. called with data
      Returns: the return value of func
  */
  bool renderToTarget(gid.gstgl1.glmemory.GLMemory input, gid.gstgl1.glmemory.GLMemory output, gid.gstgl1.types.GLFilterRenderFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(GstGLFilter* filter, GstGLMemory* inTex, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gstgl1.types.GLFilterRenderFunc*)userData;
      auto _inTex = inTex ? new gid.gstgl1.glmemory.GLMemory(cast(void*)inTex, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstgl1.glfilter.GLFilter)(cast(void*)filter, No.Take), _inTex);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.types.GLFilterRenderFunc");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_inTex)
        _inTex._cUnborrow;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_gl_filter_render_to_target(cast(GstGLFilter*)this._cPtr, input ? cast(GstGLMemory*)input._cPtr(No.Dup) : null, output ? cast(GstGLMemory*)output._cPtr(No.Dup) : null, _funcCB, _func);
    return _retval;
  }

  /**
      Transforms input into output using shader with a FBO.
      
      See also: [gid.gstgl1.glfilter.GLFilter.renderToTarget]
  
      Params:
        input = the input texture
        output = the output texture
        shader = the shader to use.
  */
  void renderToTargetWithShader(gid.gstgl1.glmemory.GLMemory input, gid.gstgl1.glmemory.GLMemory output, gid.gstgl1.glshader.GLShader shader) nothrow
  {
    gst_gl_filter_render_to_target_with_shader(cast(GstGLFilter*)this._cPtr, input ? cast(GstGLMemory*)input._cPtr(No.Dup) : null, output ? cast(GstGLMemory*)output._cPtr(No.Dup) : null, shader ? cast(GstGLShader*)shader._cPtr(No.Dup) : null);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from GLFilter
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstgl1.glfilter.GLFilter), T.stringof ~ " is not derived from gid.gstgl1.glfilter.GLFilter");

    gid.gstgl1.glbase_filter.GLBaseFilter._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFilter", true)[0]) == gid.gstgl1.glfilter.GLFilter))
      _installVfunc(klass, "filter");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFilterTexture", true)[0]) == gid.gstgl1.glfilter.GLFilter))
      _installVfunc(klass, "filter_texture");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInitFbo", true)[0]) == gid.gstgl1.glfilter.GLFilter))
      _installVfunc(klass, "init_fbo");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetCaps", true)[0]) == gid.gstgl1.glfilter.GLFilter))
      _installVfunc(klass, "set_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformInternalCaps", true)[0]) == gid.gstgl1.glfilter.GLFilter))
      _installVfunc(klass, "transform_internal_caps");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstGLFilterClass*)klass;

    switch (vfunc)
    {
      case "filter":
      {
        static extern(C) gboolean _vfuncFilterTramp(GstGLFilter* filter, GstBuffer* inbuf, GstBuffer* outbuf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glfilter.GLFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstGLFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.filter)
              return (cast(typeof(&_vfuncFilterTramp))_klass.filter)(filter, inbuf, outbuf);
            return typeof(return).init;
          }

          bool _dretval;
          auto _inbuf = inbuf ? new gid.gst1.buffer.Buffer(cast(void*)inbuf, Yes.Take)._cBorrow : null;
          auto _outbuf = outbuf ? new gid.gst1.buffer.Buffer(cast(void*)outbuf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncFilter(_inbuf, _outbuf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glfilter.GLFilter.vfuncFilter");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_inbuf)
            _inbuf._cUnborrow;
          if (_outbuf)
            _outbuf._cUnborrow;

          return _retval;
        }

        _klass.filter = cast(typeof(_klass.filter))&_vfuncFilterTramp;
        break;
      }
      case "filter_texture":
      {
        static extern(C) gboolean _vfuncFilterTextureTramp(GstGLFilter* filter, GstGLMemory* input, GstGLMemory* output) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glfilter.GLFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstGLFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.filterTexture)
              return (cast(typeof(&_vfuncFilterTextureTramp))_klass.filterTexture)(filter, input, output);
            return typeof(return).init;
          }

          bool _dretval;
          auto _input = input ? new gid.gstgl1.glmemory.GLMemory(cast(void*)input, Yes.Take)._cBorrow : null;
          auto _output = output ? new gid.gstgl1.glmemory.GLMemory(cast(void*)output, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncFilterTexture(_input, _output);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glfilter.GLFilter.vfuncFilterTexture");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_input)
            _input._cUnborrow;
          if (_output)
            _output._cUnborrow;

          return _retval;
        }

        _klass.filterTexture = cast(typeof(_klass.filterTexture))&_vfuncFilterTextureTramp;
        break;
      }
      case "init_fbo":
      {
        static extern(C) gboolean _vfuncInitFboTramp(GstGLFilter* filter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glfilter.GLFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstGLFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.initFbo)
              return (cast(typeof(&_vfuncInitFboTramp))_klass.initFbo)(filter);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncInitFbo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glfilter.GLFilter.vfuncInitFbo");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.initFbo = cast(typeof(_klass.initFbo))&_vfuncInitFboTramp;
        break;
      }
      case "set_caps":
      {
        static extern(C) gboolean _vfuncSetCapsTramp(GstGLFilter* filter, GstCaps* incaps, GstCaps* outcaps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glfilter.GLFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstGLFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.setCaps)
              return (cast(typeof(&_vfuncSetCapsTramp))_klass.setCaps)(filter, incaps, outcaps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _incaps = incaps ? new gid.gst1.caps.Caps(cast(void*)incaps, Yes.Take)._cBorrow : null;
          auto _outcaps = outcaps ? new gid.gst1.caps.Caps(cast(void*)outcaps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetCaps(_incaps, _outcaps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glfilter.GLFilter.vfuncSetCaps");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_incaps)
            _incaps._cUnborrow;
          if (_outcaps)
            _outcaps._cUnborrow;

          return _retval;
        }

        _klass.setCaps = cast(typeof(_klass.setCaps))&_vfuncSetCapsTramp;
        break;
      }
      case "transform_internal_caps":
      {
        static extern(C) GstCaps* _vfuncTransformInternalCapsTramp(GstGLFilter* filter, GstPadDirection direction, GstCaps* caps, GstCaps* filterCaps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstgl1.glfilter.GLFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstGLFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.transformInternalCaps)
              return (cast(typeof(&_vfuncTransformInternalCapsTramp))_klass.transformInternalCaps)(filter, direction, caps, filterCaps);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;
          auto _filterCaps = filterCaps ? new gid.gst1.caps.Caps(cast(void*)filterCaps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncTransformInternalCaps(direction, _caps, _filterCaps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstgl1.glfilter.GLFilter.vfuncTransformInternalCaps");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;
          if (_caps)
            _caps._cUnborrow;
          if (_filterCaps)
            _filterCaps._cUnborrow;

          return _retval;
        }

        _klass.transformInternalCaps = cast(typeof(_klass.transformInternalCaps))&_vfuncTransformInternalCapsTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glfilter.GLFilter]
class GLFilterGidBuilderImpl(T) : gid.gstgl1.glbase_filter.GLBaseFilterGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glfilter.GLFilter]
final class GLFilterGidBuilder : GLFilterGidBuilderImpl!GLFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLFilter build() nothrow
  {
    return new GLFilter(cast(void*)createGObject(GLFilter._getGType), Yes.Take);
  }
}
