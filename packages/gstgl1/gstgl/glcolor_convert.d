/// Module for [GLColorConvert] class
module gstgl.glcolor_convert;

import gid.gid;
import gst.buffer;
import gst.caps;
import gst.object;
import gst.query;
import gst.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    #GstGLColorConvert is an object that converts between color spaces and/or
    formats using OpenGL Shaders.
    
    A #GstGLColorConvert can be created with [gstgl.glcolor_convert.GLColorConvert.new_], the
    configuration negotiated with [gstgl.glcolor_convert.GLColorConvert.transformCaps] and the
    conversion performed with [gstgl.glcolor_convert.GLColorConvert.perform].
    
    The glcolorconvertelement provides a GStreamer element that uses
    #GstGLColorConvert to convert between video formats and color spaces.
*/
class GLColorConvert : gst.object.ObjectWrap
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
    return cast(void function())gst_gl_color_convert_get_type != &gidSymbolNotFound ? gst_gl_color_convert_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLColorConvert self()
  {
    return this;
  }

  /** */
  this(gstgl.glcontext.GLContext context)
  {
    GstGLColorConvert* _cretval;
    _cretval = gst_gl_color_convert_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Provides an implementation of #GstBaseTransformClass.fixate_caps()
  
      Params:
        context = a #GstGLContext to use for transforming caps
        direction = a #GstPadDirection
        caps = the #GstCaps of direction
        other = the #GstCaps to fixate
      Returns: the fixated #GstCaps
  */
  static gst.caps.Caps fixateCaps(gstgl.glcontext.GLContext context, gst.types.PadDirection direction, gst.caps.Caps caps, gst.caps.Caps other)
  {
    GstCaps* _cretval;
    _cretval = gst_gl_color_convert_fixate_caps(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, other ? cast(GstCaps*)other._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  static string swizzleShaderString(gstgl.glcontext.GLContext context)
  {
    char* _cretval;
    _cretval = gst_gl_color_convert_swizzle_shader_string(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Provides an implementation of #GstBaseTransformClass.transform_caps()
  
      Params:
        context = a #GstGLContext to use for transforming caps
        direction = a #GstPadDirection
        caps = the #GstCaps to transform
        filter = a set of filter #GstCaps
      Returns: the converted #GstCaps
  */
  static gst.caps.Caps transformCaps(gstgl.glcontext.GLContext context, gst.types.PadDirection direction, gst.caps.Caps caps, gst.caps.Caps filter)
  {
    GstCaps* _cretval;
    _cretval = gst_gl_color_convert_transform_caps(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      The returned glsl function has declaration:
      
      `vec3 yuv_to_rgb (vec3 rgb, vec3 offset, vec3 ycoeff, vec3 ucoeff, vec3 vcoeff);`
      
      The Y component is placed in the 0th index of the returned value, The U component in the
      1st, and the V component in the 2nd.  offset, ycoeff, ucoeff, and vcoeff are the
      specific coefficients and offset used for the conversion.
  
      Params:
        context = a #GstGLContext
      Returns: a glsl function that can be used to convert from
        yuv to rgb
  */
  static string yuvToRgbShaderString(gstgl.glcontext.GLContext context)
  {
    char* _cretval;
    _cretval = gst_gl_color_convert_yuv_to_rgb_shader_string(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Provides an implementation of #GstBaseTransformClass.decide_allocation()
  
      Params:
        query = a completed ALLOCATION #GstQuery
      Returns: whether the allocation parameters were successfully chosen
  */
  bool decideAllocation(gst.query.Query query)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_color_convert_decide_allocation(cast(GstGLColorConvert*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts the data contained by inbuf using the formats specified by the
      #GstCaps passed to [gstgl.glcolor_convert.GLColorConvert.setCaps]
  
      Params:
        inbuf = the #GstGLMemory filled #GstBuffer to convert
      Returns: a converted #GstBuffer or null
  */
  gst.buffer.Buffer perform(gst.buffer.Buffer inbuf)
  {
    GstBuffer* _cretval;
    _cretval = gst_gl_color_convert_perform(cast(GstGLColorConvert*)this._cPtr, inbuf ? cast(GstBuffer*)inbuf._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Initializes convert with the information required for conversion.
  
      Params:
        inCaps = input #GstCaps
        outCaps = output #GstCaps
      Returns: 
  */
  bool setCaps(gst.caps.Caps inCaps, gst.caps.Caps outCaps)
  {
    bool _retval;
    _retval = cast(bool)gst_gl_color_convert_set_caps(cast(GstGLColorConvert*)this._cPtr, inCaps ? cast(GstCaps*)inCaps._cPtr(No.Dup) : null, outCaps ? cast(GstCaps*)outCaps._cPtr(No.Dup) : null);
    return _retval;
  }
}
