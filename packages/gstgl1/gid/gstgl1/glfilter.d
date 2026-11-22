/// Module for [GLFilter] class
module gid.gstgl1.glfilter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
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
