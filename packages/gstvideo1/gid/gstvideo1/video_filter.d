/// Module for [VideoFilter] class
module gid.gstvideo1.video_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.caps;
import gid.gst1.types;
import gid.gstbase1.base_transform;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_frame;
import gid.gstvideo1.video_info;

/**
    Provides useful functions and a base class for video filters.
    
    The videofilter will by default enable QoS on the parent GstBaseTransform
    to implement frame dropping.
*/
@gidGir("VideoFilter", "VideoFilterClass")
class VideoFilter : gid.gstbase1.base_transform.BaseTransform
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
    return cast(void function())gst_video_filter_get_type != &gidSymbolNotFound ? gst_video_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_filter.VideoFilter]
      Returns: New builder object
  */
  static VideoFilterGidBuilder builder() nothrow
  {
    return new VideoFilterGidBuilder;
  }

  /**
      function to be called with the negotiated caps and video infos
  
      Params:
        incaps =  (modified in place, changes are seen by the caller)
        inInfo =  (modified in place, changes are seen by the caller)
        outcaps =  (modified in place, changes are seen by the caller)
        outInfo =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetInfo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetInfo(gid.gst1.caps.Caps incaps, gid.gstvideo1.video_info.VideoInfo inInfo, gid.gst1.caps.Caps outcaps, gid.gstvideo1.video_info.VideoInfo outInfo)
  {
    auto _klass = cast(GstVideoFilterClass*)_vfuncClass;
    if (!_klass.setInfo)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setInfo(cast(GstVideoFilter*)this._cPtr, incaps ? cast(GstCaps*)incaps._cPtr(No.Dup) : null, inInfo ? cast(GstVideoInfo*)inInfo._cPtr(No.Dup) : null, outcaps ? cast(GstCaps*)outcaps._cPtr(No.Dup) : null, outInfo ? cast(GstVideoInfo*)outInfo._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      transform a video frame
  
      Params:
        inframe =  (borrowed, only valid during the callback)
        outframe =  (borrowed, only valid during the callback)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTransformFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncTransformFrame(gid.gstvideo1.video_frame.VideoFrame inframe, gid.gstvideo1.video_frame.VideoFrame outframe)
  {
    auto _klass = cast(GstVideoFilterClass*)_vfuncClass;
    if (!_klass.transformFrame)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.transformFrame(cast(GstVideoFilter*)this._cPtr, inframe ? cast(GstVideoFrame*)inframe._cPtr : null, outframe ? cast(GstVideoFrame*)outframe._cPtr : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      transform a video frame in place
  
      Params:
        frame =  (borrowed, only valid during the callback)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncTransformFrameIp` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncTransformFrameIp(gid.gstvideo1.video_frame.VideoFrame frame)
  {
    auto _klass = cast(GstVideoFilterClass*)_vfuncClass;
    if (!_klass.transformFrameIp)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.transformFrameIp(cast(GstVideoFilter*)this._cPtr, frame ? cast(GstVideoFrame*)frame._cPtr : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from VideoFilter
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstvideo1.video_filter.VideoFilter), T.stringof ~ " is not derived from gid.gstvideo1.video_filter.VideoFilter");

    gid.gstbase1.base_transform.BaseTransform._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetInfo", true)[0]) == gid.gstvideo1.video_filter.VideoFilter))
      _installVfunc(klass, "set_info");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformFrame", true)[0]) == gid.gstvideo1.video_filter.VideoFilter))
      _installVfunc(klass, "transform_frame");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTransformFrameIp", true)[0]) == gid.gstvideo1.video_filter.VideoFilter))
      _installVfunc(klass, "transform_frame_ip");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstVideoFilterClass*)klass;

    switch (vfunc)
    {
      case "set_info":
      {
        static extern(C) gboolean _vfuncSetInfoTramp(GstVideoFilter* filter, GstCaps* incaps, GstVideoInfo* inInfo, GstCaps* outcaps, GstVideoInfo* outInfo) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_filter.VideoFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstVideoFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.setInfo)
              return (cast(typeof(&_vfuncSetInfoTramp))_klass.setInfo)(filter, incaps, inInfo, outcaps, outInfo);
            return typeof(return).init;
          }

          bool _dretval;
          auto _incaps = incaps ? new gid.gst1.caps.Caps(cast(void*)incaps, Yes.Take)._cBorrow : null;
          auto _inInfo = inInfo ? new gid.gstvideo1.video_info.VideoInfo(cast(void*)inInfo, Yes.Take)._cBorrow : null;
          auto _outcaps = outcaps ? new gid.gst1.caps.Caps(cast(void*)outcaps, Yes.Take)._cBorrow : null;
          auto _outInfo = outInfo ? new gid.gstvideo1.video_info.VideoInfo(cast(void*)outInfo, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetInfo(_incaps, _inInfo, _outcaps, _outInfo);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_filter.VideoFilter.vfuncSetInfo");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_incaps)
            _incaps._cUnborrow;
          if (_inInfo)
            _inInfo._cUnborrow;
          if (_outcaps)
            _outcaps._cUnborrow;
          if (_outInfo)
            _outInfo._cUnborrow;

          return _retval;
        }

        _klass.setInfo = cast(typeof(_klass.setInfo))&_vfuncSetInfoTramp;
        break;
      }
      case "transform_frame":
      {
        static extern(C) GstFlowReturn _vfuncTransformFrameTramp(GstVideoFilter* filter, GstVideoFrame* inframe, GstVideoFrame* outframe) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_filter.VideoFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)filter);
          if (!_obj)
          {
            auto _klass = cast(GstVideoFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)filter);
            if (_klass.transformFrame)
              return (cast(typeof(&_vfuncTransformFrameTramp))_klass.transformFrame)(filter, inframe, outframe);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _inframe = inframe ? new gid.gstvideo1.video_frame.VideoFrame(cast(void*)inframe, null) : null;
          auto _outframe = outframe ? new gid.gstvideo1.video_frame.VideoFrame(cast(void*)outframe, null) : null;

          try
          {
            _dretval = _obj.vfuncTransformFrame(_inframe, _outframe);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_filter.VideoFilter.vfuncTransformFrame");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.transformFrame = cast(typeof(_klass.transformFrame))&_vfuncTransformFrameTramp;
        break;
      }
      case "transform_frame_ip":
      {
        static extern(C) GstFlowReturn _vfuncTransformFrameIpTramp(GstVideoFilter* trans, GstVideoFrame* frame) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_filter.VideoFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)trans);
          if (!_obj)
          {
            auto _klass = cast(GstVideoFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)trans);
            if (_klass.transformFrameIp)
              return (cast(typeof(&_vfuncTransformFrameIpTramp))_klass.transformFrameIp)(trans, frame);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _frame = frame ? new gid.gstvideo1.video_frame.VideoFrame(cast(void*)frame, null) : null;

          try
          {
            _dretval = _obj.vfuncTransformFrameIp(_frame);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_filter.VideoFilter.vfuncTransformFrameIp");
          }
          auto _retval = cast(GstFlowReturn)_dretval;

          return _retval;
        }

        _klass.transformFrameIp = cast(typeof(_klass.transformFrameIp))&_vfuncTransformFrameIpTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_filter.VideoFilter]
class VideoFilterGidBuilderImpl(T) : gid.gstbase1.base_transform.BaseTransformGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstvideo1.video_filter.VideoFilter]
final class VideoFilterGidBuilder : VideoFilterGidBuilderImpl!VideoFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoFilter build() nothrow
  {
    return new VideoFilter(cast(void*)createGObject(VideoFilter._getGType), Yes.Take);
  }
}
