/// Module for [GLColorConvert] class
module gid.gstgl1.glcolor_convert;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.object;
import gid.gst1.query;
import gid.gst1.types;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;

/**
    #GstGLColorConvert is an object that converts between color spaces and/or
    formats using OpenGL Shaders.
    
    A #GstGLColorConvert can be created with [gid.gstgl1.glcolor_convert.GLColorConvert.new_], the
    configuration negotiated with [gid.gstgl1.glcolor_convert.GLColorConvert.transformCaps] and the
    conversion performed with [gid.gstgl1.glcolor_convert.GLColorConvert.perform].
    
    The glcolorconvertelement provides a GStreamer element that uses
    #GstGLColorConvert to convert between video formats and color spaces.
*/
class GLColorConvert : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_gl_color_convert_get_type != &gidSymbolNotFound ? gst_gl_color_convert_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLColorConvert";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLColorConvert self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glcolor_convert.GLColorConvert]
      Returns: New builder object
  */
  static GLColorConvertGidBuilder builder() nothrow
  {
    return new GLColorConvertGidBuilder;
  }

  /** */
  this(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GstGLColorConvert* _cretval;
      _cretval = gst_gl_color_convert_new(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
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
  static gid.gst1.caps.Caps fixateCaps(gid.gstgl1.glcontext.GLContext context, gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps, gid.gst1.caps.Caps other) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_gl_color_convert_fixate_caps(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, other ? cast(GstCaps*)other._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  static string swizzleShaderString(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    char* _cretval;
    _cretval = gst_gl_color_convert_swizzle_shader_string(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
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
  static gid.gst1.caps.Caps transformCaps(gid.gstgl1.glcontext.GLContext context, gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps, gid.gst1.caps.Caps filter) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_gl_color_convert_transform_caps(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
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
  static string yuvToRgbShaderString(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    char* _cretval;
    _cretval = gst_gl_color_convert_yuv_to_rgb_shader_string(context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Provides an implementation of #GstBaseTransformClass.decide_allocation()
  
      Params:
        query = a completed ALLOCATION #GstQuery
      Returns: whether the allocation parameters were successfully chosen
  */
  bool decideAllocation(gid.gst1.query.Query query) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_color_convert_decide_allocation(cast(GstGLColorConvert*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Converts the data contained by inbuf using the formats specified by the
      #GstCaps passed to [gid.gstgl1.glcolor_convert.GLColorConvert.setCaps]
  
      Params:
        inbuf = the #GstGLMemory filled #GstBuffer to convert
      Returns: a converted #GstBuffer or null
  */
  gid.gst1.buffer.Buffer perform(gid.gst1.buffer.Buffer inbuf) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_gl_color_convert_perform(cast(GstGLColorConvert*)this._cPtr, inbuf ? cast(GstBuffer*)inbuf._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Initializes convert with the information required for conversion.
  
      Params:
        inCaps = input #GstCaps
        outCaps = output #GstCaps
      Returns: 
  */
  bool setCaps(gid.gst1.caps.Caps inCaps, gid.gst1.caps.Caps outCaps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_color_convert_set_caps(cast(GstGLColorConvert*)this._cPtr, inCaps ? cast(GstCaps*)inCaps._cPtr(No.Dup) : null, outCaps ? cast(GstCaps*)outCaps._cPtr(No.Dup) : null);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glcolor_convert.GLColorConvert]
class GLColorConvertGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstgl1.glcolor_convert.GLColorConvert]
final class GLColorConvertGidBuilder : GLColorConvertGidBuilderImpl!GLColorConvertGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLColorConvert build() nothrow
  {
    return new GLColorConvert(cast(void*)createGObject(GLColorConvert._getGType), Yes.Take);
  }
}
