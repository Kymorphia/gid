/// Module for [GLViewConvert] class
module gstgl.glview_convert;

import gid.gid;
import gobject.object;
import gst.buffer;
import gst.caps;
import gst.object;
import gst.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;
import gstvideo.types;

/**
    Convert stereoscopic/multiview video using fragment shaders.
*/
class GLViewConvert : gst.object.ObjectWrap
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
    return cast(void function())gst_gl_view_convert_get_type != &gidSymbolNotFound ? gst_gl_view_convert_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLViewConvert self()
  {
    return this;
  }

  /** */
  @property gstgl.types.GLStereoDownmix downmixMode()
  {
    return gobject.object.ObjectWrap.getProperty!(gstgl.types.GLStereoDownmix)("downmix-mode");
  }

  /** */
  @property void downmixMode(gstgl.types.GLStereoDownmix propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstgl.types.GLStereoDownmix)("downmix-mode", propval);
  }

  /** */
  @property gstvideo.types.VideoMultiviewFlags inputFlagsOverride()
  {
    return gobject.object.ObjectWrap.getProperty!(gstvideo.types.VideoMultiviewFlags)("input-flags-override");
  }

  /** */
  @property void inputFlagsOverride(gstvideo.types.VideoMultiviewFlags propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstvideo.types.VideoMultiviewFlags)("input-flags-override", propval);
  }

  /** */
  @property gstvideo.types.VideoMultiviewMode inputModeOverride()
  {
    return gobject.object.ObjectWrap.getProperty!(gstvideo.types.VideoMultiviewMode)("input-mode-override");
  }

  /** */
  @property void inputModeOverride(gstvideo.types.VideoMultiviewMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstvideo.types.VideoMultiviewMode)("input-mode-override", propval);
  }

  /** */
  @property gstvideo.types.VideoMultiviewFlags outputFlagsOverride()
  {
    return gobject.object.ObjectWrap.getProperty!(gstvideo.types.VideoMultiviewFlags)("output-flags-override");
  }

  /** */
  @property void outputFlagsOverride(gstvideo.types.VideoMultiviewFlags propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstvideo.types.VideoMultiviewFlags)("output-flags-override", propval);
  }

  /** */
  @property gstvideo.types.VideoMultiviewMode outputModeOverride()
  {
    return gobject.object.ObjectWrap.getProperty!(gstvideo.types.VideoMultiviewMode)("output-mode-override");
  }

  /** */
  @property void outputModeOverride(gstvideo.types.VideoMultiviewMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(gstvideo.types.VideoMultiviewMode)("output-mode-override", propval);
  }

  /** */
  this()
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
  gst.caps.Caps fixateCaps(gst.types.PadDirection direction, gst.caps.Caps caps, gst.caps.Caps othercaps)
  {
    GstCaps* _cretval;
    _cretval = gst_gl_view_convert_fixate_caps(cast(GstGLViewConvert*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, othercaps ? cast(GstCaps*)othercaps._cPtr(Yes.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieve the processed output buffer placing the output in outbuf_ptr.
  
      Params:
        outbufPtr = a #GstBuffer
      Returns: a #GstFlowReturn
  */
  gst.types.FlowReturn getOutput(out gst.buffer.Buffer outbufPtr)
  {
    GstFlowReturn _cretval;
    GstBuffer* _outbufPtr;
    _cretval = gst_gl_view_convert_get_output(cast(GstGLViewConvert*)this._cPtr, &_outbufPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    outbufPtr = new gst.buffer.Buffer(cast(void*)_outbufPtr, Yes.Take);
    return _retval;
  }

  /**
      Converts the data contained by inbuf using the formats specified by the
      #GstCaps passed to [gstgl.glview_convert.GLViewConvert.setCaps]
  
      Params:
        inbuf = the #GstGLMemory filled #GstBuffer to convert
      Returns: a converted #GstBuffer or null
  */
  gst.buffer.Buffer perform(gst.buffer.Buffer inbuf)
  {
    GstBuffer* _cretval;
    _cretval = gst_gl_view_convert_perform(cast(GstGLViewConvert*)this._cPtr, inbuf ? cast(GstBuffer*)inbuf._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Reset viewconvert to the default state.  Further operation will require
      setting the caps with [gstgl.glview_convert.GLViewConvert.setCaps].
  */
  void reset()
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
  bool setCaps(gst.caps.Caps inCaps, gst.caps.Caps outCaps)
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
  void setContext(gstgl.glcontext.GLContext context)
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
  gst.types.FlowReturn submitInputBuffer(bool isDiscont, gst.buffer.Buffer input)
  {
    GstFlowReturn _cretval;
    _cretval = gst_gl_view_convert_submit_input_buffer(cast(GstGLViewConvert*)this._cPtr, isDiscont, input ? cast(GstBuffer*)input._cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
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
  gst.caps.Caps transformCaps(gst.types.PadDirection direction, gst.caps.Caps caps, gst.caps.Caps filter)
  {
    GstCaps* _cretval;
    _cretval = gst_gl_view_convert_transform_caps(cast(GstGLViewConvert*)this._cPtr, direction, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
