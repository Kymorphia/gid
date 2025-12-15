/// Module for [GLFilter] class
module gstgl.glfilter;

import gid.gid;
import gobject.object;
import gst.buffer;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_filter;
import gstgl.glmemory;
import gstgl.glshader;
import gstgl.types;

/**
    #GstGLFilter helps to implement simple OpenGL filter elements taking a
    single input and producing a single output with a #GstGLFramebuffer
*/
class GLFilter : gstgl.glbase_filter.GLBaseFilter
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
    return cast(void function())gst_gl_filter_get_type != &gidSymbolNotFound ? gst_gl_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLFilter self()
  {
    return this;
  }

  /**
      Render a fullscreen quad using the current GL state.  The only GL state this
      modifies is the necessary vertex/index buffers and, if necessary, a
      Vertex Array Object for drawing a fullscreen quad.  Framebuffer state,
      any shaders, viewport state, etc must be setup by the caller.
  */
  void drawFullscreenQuad()
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
  bool filterTexture(gst.buffer.Buffer input, gst.buffer.Buffer output)
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
  bool renderToTarget(gstgl.glmemory.GLMemory input, gstgl.glmemory.GLMemory output, gstgl.types.GLFilterRenderFunc func)
  {
    extern(C) gboolean _funcCallback(GstGLFilter* filter, GstGLMemory* inTex, void* userData)
    {
      auto _dlg = cast(gstgl.types.GLFilterRenderFunc*)userData;

      gboolean _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gstgl.glfilter.GLFilter)(cast(void*)filter, No.Take), inTex ? new gstgl.glmemory.GLMemory(cast(void*)inTex, No.Take) : null);
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
      
      See also: [gstgl.glfilter.GLFilter.renderToTarget]
  
      Params:
        input = the input texture
        output = the output texture
        shader = the shader to use.
  */
  void renderToTargetWithShader(gstgl.glmemory.GLMemory input, gstgl.glmemory.GLMemory output, gstgl.glshader.GLShader shader)
  {
    gst_gl_filter_render_to_target_with_shader(cast(GstGLFilter*)this._cPtr, input ? cast(GstGLMemory*)input._cPtr(No.Dup) : null, output ? cast(GstGLMemory*)output._cPtr(No.Dup) : null, shader ? cast(GstGLShader*)shader._cPtr(No.Dup) : null);
  }
}
