/// Module for [VideoSink] class
module gid.gstvideo1.video_sink;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.types;
import gid.gstbase1.base_sink;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_info;

/**
    Provides useful functions and a base class for video sinks.
    
    GstVideoSink will configure the default base sink to drop frames that
    arrive later than 20ms as this is considered the default threshold for
    observing out-of-sync frames.
*/
class VideoSink : gid.gstbase1.base_sink.BaseSink
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
    return cast(void function())gst_video_sink_get_type != &gidSymbolNotFound ? gst_video_sink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoSink";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoSink self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_sink.VideoSink]
      Returns: New builder object
  */
  static VideoSinkGidBuilder builder() nothrow
  {
    return new VideoSinkGidBuilder;
  }

  /**
      Get `showPrerollFrame` property.
      Returns: Whether to show video frames during preroll. If set to false, video
        frames will only be rendered in PLAYING state.
  */
  @property bool showPrerollFrame() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("show-preroll-frame");
  }

  /**
      Set `showPrerollFrame` property.
      Params:
        propval = Whether to show video frames during preroll. If set to false, video
          frames will only be rendered in PLAYING state.
  */
  @property void showPrerollFrame(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("show-preroll-frame", propval);
  }

  /**
      Notifies the subclass of changed #GstVideoInfo.
  
      Params:
        caps = A #GstCaps. (modified in place, changes are seen by the caller)
        info = A #GstVideoInfo corresponding to caps.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetInfo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSetInfo(gid.gst1.caps.Caps caps, gid.gstvideo1.video_info.VideoInfo info)
  {
    auto _klass = cast(GstVideoSinkClass*)_vfuncClass;
    if (!_klass.setInfo)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setInfo(cast(GstVideoSink*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, info ? cast(const(GstVideoInfo)*)info._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      render a video frame. Maps to #GstBaseSinkClass.render() and
          #GstBaseSinkClass.preroll() vfuncs. Rendering during preroll will be
          suppressed if the #GstVideoSink:show-preroll-frame property is set to
          false.
  
      Params:
        buf =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncShowFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncShowFrame(gid.gst1.buffer.Buffer buf)
  {
    auto _klass = cast(GstVideoSinkClass*)_vfuncClass;
    if (!_klass.showFrame)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.showFrame(cast(GstVideoSink*)this._cPtr, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from VideoSink
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstvideo1.video_sink.VideoSink), T.stringof ~ " is not derived from gid.gstvideo1.video_sink.VideoSink");

    gid.gstbase1.base_sink.BaseSink._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetInfo", true)[0]) == gid.gstvideo1.video_sink.VideoSink))
      _installVfunc(klass, "set_info");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShowFrame", true)[0]) == gid.gstvideo1.video_sink.VideoSink))
      _installVfunc(klass, "show_frame");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstVideoSinkClass*)klass;

    switch (vfunc)
    {
      case "set_info":
      {
        static extern(C) gboolean _vfuncSetInfoTramp(GstVideoSink* videoSink, GstCaps* caps, const(GstVideoInfo)* info) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_sink.VideoSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoSink);
          if (!_obj)
          {
            auto _klass = cast(GstVideoSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoSink);
            if (_klass.setInfo)
              return (cast(typeof(&_vfuncSetInfoTramp))_klass.setInfo)(videoSink, caps, info);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetInfo(_caps, info ? new gid.gstvideo1.video_info.VideoInfo(cast(void*)info, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_sink.VideoSink.vfuncSetInfo");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.setInfo = cast(typeof(_klass.setInfo))&_vfuncSetInfoTramp;
        break;
      }
      case "show_frame":
      {
        static extern(C) GstFlowReturn _vfuncShowFrameTramp(GstVideoSink* videoSink, GstBuffer* buf) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_sink.VideoSink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoSink);
          if (!_obj)
          {
            auto _klass = cast(GstVideoSinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoSink);
            if (_klass.showFrame)
              return (cast(typeof(&_vfuncShowFrameTramp))_klass.showFrame)(videoSink, buf);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _buf = buf ? new gid.gst1.buffer.Buffer(cast(void*)buf, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncShowFrame(_buf);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_sink.VideoSink.vfuncShowFrame");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_buf)
            _buf._cUnborrow;

          return _retval;
        }

        _klass.showFrame = cast(typeof(_klass.showFrame))&_vfuncShowFrameTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_sink.VideoSink]
class VideoSinkGidBuilderImpl(T) : gid.gstbase1.base_sink.BaseSinkGidBuilderImpl!T
{

  /**
      Set `showPrerollFrame` property.
      Params:
        propval = Whether to show video frames during preroll. If set to false, video
          frames will only be rendered in PLAYING state.
      Returns: Builder instance for fluent chaining
  */
  T showPrerollFrame(bool propval) nothrow
  {
    return setProperty("show-preroll-frame", propval);
  }
}

/// Fluent builder for [gid.gstvideo1.video_sink.VideoSink]
final class VideoSinkGidBuilder : VideoSinkGidBuilderImpl!VideoSinkGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoSink build() nothrow
  {
    return new VideoSink(cast(void*)createGObject(VideoSink._getGType), Yes.Take);
  }
}
