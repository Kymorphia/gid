/// Module for [GLViewConvert] class
module gid.gstgl1.glview_convert;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.object;
import gid.gst1.types;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.glcontext;
import gid.gstgl1.types;
import gid.gstvideo1.types;

/**
    Convert stereoscopic/multiview video using fragment shaders.
*/
class GLViewConvert : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_gl_view_convert_get_type != &gidSymbolNotFound ? gst_gl_view_convert_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstGLViewConvert";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLViewConvert self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstgl1.glview_convert.GLViewConvert]
      Returns: New builder object
  */
  static GLViewConvertGidBuilder builder() nothrow
  {
    return new GLViewConvertGidBuilder;
  }

  /** */
  @property gid.gstgl1.types.GLStereoDownmix downmixMode() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstgl1.types.GLStereoDownmix)("downmix-mode");
  }

  /** */
  @property void downmixMode(gid.gstgl1.types.GLStereoDownmix propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstgl1.types.GLStereoDownmix)("downmix-mode", propval);
  }

  /** */
  @property gid.gstvideo1.types.VideoMultiviewFlags inputFlagsOverride() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstvideo1.types.VideoMultiviewFlags)("input-flags-override");
  }

  /** */
  @property void inputFlagsOverride(gid.gstvideo1.types.VideoMultiviewFlags propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstvideo1.types.VideoMultiviewFlags)("input-flags-override", propval);
  }

  /** */
  @property gid.gstvideo1.types.VideoMultiviewMode inputModeOverride() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstvideo1.types.VideoMultiviewMode)("input-mode-override");
  }

  /** */
  @property void inputModeOverride(gid.gstvideo1.types.VideoMultiviewMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstvideo1.types.VideoMultiviewMode)("input-mode-override", propval);
  }

  /** */
  @property gid.gstvideo1.types.VideoMultiviewFlags outputFlagsOverride() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstvideo1.types.VideoMultiviewFlags)("output-flags-override");
  }

  /** */
  @property void outputFlagsOverride(gid.gstvideo1.types.VideoMultiviewFlags propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstvideo1.types.VideoMultiviewFlags)("output-flags-override", propval);
  }

  /** */
  @property gid.gstvideo1.types.VideoMultiviewMode outputModeOverride() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gstvideo1.types.VideoMultiviewMode)("output-mode-override");
  }

  /** */
  @property void outputModeOverride(gid.gstvideo1.types.VideoMultiviewMode propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gstvideo1.types.VideoMultiviewMode)("output-mode-override", propval);
  }

  /** */
  this() nothrow
  {
    GstGLViewConvert* _cretval;
    _cretval = gst_gl_view_convert_new();
    this(_cretval, Yes.Take);
  }

  /**
      Provides an implementation of #GstBaseTransformClass.fixate_caps()
  
      Params:
        direction = a #GstPadDirection
        caps = the #GstCaps of direction
        othercaps = the #GstCaps to fixate
      Returns: the fixated #GstCaps
  */
  gid.gst1.caps.Caps fixateCaps(gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps, gid.gst1.caps.Caps othercaps) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_gl_view_convert_fixate_caps(cast(GstGLViewConvert*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, othercaps ? cast(GstCaps*)othercaps._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieve the processed output buffer placing the output in outbuf_ptr.
  
      Params:
        outbufPtr = a #GstBuffer
      Returns: a #GstFlowReturn
  */
  gid.gst1.types.FlowReturn getOutput(out gid.gst1.buffer.Buffer outbufPtr) nothrow
  {
    GstFlowReturn _cretval;
    GstBuffer* _outbufPtr;
    _cretval = gst_gl_view_convert_get_output(cast(GstGLViewConvert*)this._cPtr, &_outbufPtr);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_outbufPtr)
      outbufPtr = new gid.gst1.buffer.Buffer(cast(void*)_outbufPtr, Yes.Take);
    return _retval;
  }

  /**
      Converts the data contained by inbuf using the formats specified by the
      #GstCaps passed to [gid.gstgl1.glview_convert.GLViewConvert.setCaps]
  
      Params:
        inbuf = the #GstGLMemory filled #GstBuffer to convert
      Returns: a converted #GstBuffer or null
  */
  gid.gst1.buffer.Buffer perform(gid.gst1.buffer.Buffer inbuf) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_gl_view_convert_perform(cast(GstGLViewConvert*)this._cPtr, inbuf ? cast(GstBuffer*)inbuf._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Reset viewconvert to the default state.  Further operation will require
      setting the caps with [gid.gstgl1.glview_convert.GLViewConvert.setCaps].
  */
  void reset() nothrow
  {
    gst_gl_view_convert_reset(cast(GstGLViewConvert*)this._cPtr);
  }

  /**
      Initializes viewconvert with the information required for conversion.
  
      Params:
        inCaps = input #GstCaps
        outCaps = output #GstCaps
      Returns: 
  */
  bool setCaps(gid.gst1.caps.Caps inCaps, gid.gst1.caps.Caps outCaps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_gl_view_convert_set_caps(cast(GstGLViewConvert*)this._cPtr, inCaps ? cast(GstCaps*)inCaps._cPtr(No.Dup) : null, outCaps ? cast(GstCaps*)outCaps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Set context on viewconvert
  
      Params:
        context = the #GstGLContext to set
  */
  void setContext(gid.gstgl1.glcontext.GLContext context) nothrow
  {
    gst_gl_view_convert_set_context(cast(GstGLViewConvert*)this._cPtr, context ? cast(GstGLContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Submit input to be processed by viewconvert
  
      Params:
        isDiscont = true if we have a discontinuity
        input = a #GstBuffer
      Returns: a #GstFlowReturn
  */
  gid.gst1.types.FlowReturn submitInputBuffer(bool isDiscont, gid.gst1.buffer.Buffer input) nothrow
  {
    GstFlowReturn _cretval;
    _cretval = gst_gl_view_convert_submit_input_buffer(cast(GstGLViewConvert*)this._cPtr, isDiscont, input ? cast(GstBuffer*)input._cPtr(Yes.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Provides an implementation of #GstBaseTransformClass.transform_caps()
  
      Params:
        direction = a #GstPadDirection
        caps = the #GstCaps to transform
        filter = a set of filter #GstCaps
      Returns: the converted #GstCaps
  */
  gid.gst1.caps.Caps transformCaps(gid.gst1.types.PadDirection direction, gid.gst1.caps.Caps caps, gid.gst1.caps.Caps filter) nothrow
  {
    GstCaps* _cretval;
    _cretval = gst_gl_view_convert_transform_caps(cast(GstGLViewConvert*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstgl1.glview_convert.GLViewConvert]
class GLViewConvertGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T downmixMode(gid.gstgl1.types.GLStereoDownmix propval) nothrow
  {
    return setProperty("downmix-mode", propval);
  }

  /** */
  T inputFlagsOverride(gid.gstvideo1.types.VideoMultiviewFlags propval) nothrow
  {
    return setProperty("input-flags-override", propval);
  }

  /** */
  T inputModeOverride(gid.gstvideo1.types.VideoMultiviewMode propval) nothrow
  {
    return setProperty("input-mode-override", propval);
  }

  /** */
  T outputFlagsOverride(gid.gstvideo1.types.VideoMultiviewFlags propval) nothrow
  {
    return setProperty("output-flags-override", propval);
  }

  /** */
  T outputModeOverride(gid.gstvideo1.types.VideoMultiviewMode propval) nothrow
  {
    return setProperty("output-mode-override", propval);
  }
}

/// Fluent builder for [gid.gstgl1.glview_convert.GLViewConvert]
final class GLViewConvertGidBuilder : GLViewConvertGidBuilderImpl!GLViewConvertGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLViewConvert build() nothrow
  {
    return new GLViewConvert(cast(void*)createGObject(GLViewConvert._getGType), Yes.Take);
  }
}
