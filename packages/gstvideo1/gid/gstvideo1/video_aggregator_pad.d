/// Module for [VideoAggregatorPad] class
module gid.gstvideo1.video_aggregator_pad;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gstbase1.aggregator_pad;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_aggregator;
import gid.gstvideo1.video_frame;

/** */
class VideoAggregatorPad : gid.gstbase1.aggregator_pad.AggregatorPad
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
    return cast(void function())gst_video_aggregator_pad_get_type != &gidSymbolNotFound ? gst_video_aggregator_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoAggregatorPad";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoAggregatorPad self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad]
      Returns: New builder object
  */
  static VideoAggregatorPadGidBuilder builder() nothrow
  {
    return new VideoAggregatorPadGidBuilder;
  }

  /** */
  @property ulong maxLastBufferRepeat() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(ulong)("max-last-buffer-repeat");
  }

  /** */
  @property void maxLastBufferRepeat(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("max-last-buffer-repeat", propval);
  }

  /** */
  @property bool repeatAfterEos() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("repeat-after-eos");
  }

  /** */
  @property void repeatAfterEos(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("repeat-after-eos", propval);
  }

  /** */
  @property uint zorder() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("zorder");
  }

  /** */
  @property void zorder(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("zorder", propval);
  }

  /**
      clean the frame previously prepared in prepare_frame
  
      Params:
        videoaggregator = 
        preparedFrame =  (borrowed, only valid during the callback)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCleanFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncCleanFrame(gid.gstvideo1.video_aggregator.VideoAggregator videoaggregator, gid.gstvideo1.video_frame.VideoFrame preparedFrame)
  {
    auto _klass = cast(GstVideoAggregatorPadClass*)_vfuncClass;
    if (!_klass.cleanFrame)
      return;

    _klass.cleanFrame(cast(GstVideoAggregatorPad*)this._cPtr, videoaggregator ? cast(GstVideoAggregator*)videoaggregator._cPtr(No.Dup) : null, preparedFrame ? cast(GstVideoFrame*)preparedFrame._cPtr : null);
  }

  /**
      Prepare the frame from the pad buffer and sets it to prepared_frame.
           Implementations should always return TRUE.  Returning FALSE will cease
           iteration over subsequent pads.
  
      Params:
        videoaggregator = 
        buffer =  (modified in place, changes are seen by the caller)
        preparedFrame =  (borrowed, only valid during the callback)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrepareFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncPrepareFrame(gid.gstvideo1.video_aggregator.VideoAggregator videoaggregator, gid.gst1.buffer.Buffer buffer, gid.gstvideo1.video_frame.VideoFrame preparedFrame)
  {
    auto _klass = cast(GstVideoAggregatorPadClass*)_vfuncClass;
    if (!_klass.prepareFrame)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.prepareFrame(cast(GstVideoAggregatorPad*)this._cPtr, videoaggregator ? cast(GstVideoAggregator*)videoaggregator._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, preparedFrame ? cast(GstVideoFrame*)preparedFrame._cPtr : null);
    return _retval;
  }

  /**
      Finish preparing prepared_frame.
      
      If overriden, `prepare_frame_start` must also be overriden.
  
      Params:
        videoaggregator = the parent #GstVideoAggregator
        preparedFrame = the #GstVideoFrame to prepare into (borrowed, only valid during the callback)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrepareFrameFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncPrepareFrameFinish(gid.gstvideo1.video_aggregator.VideoAggregator videoaggregator, gid.gstvideo1.video_frame.VideoFrame preparedFrame)
  {
    auto _klass = cast(GstVideoAggregatorPadClass*)_vfuncClass;
    if (!_klass.prepareFrameFinish)
      return;

    _klass.prepareFrameFinish(cast(GstVideoAggregatorPad*)this._cPtr, videoaggregator ? cast(GstVideoAggregator*)videoaggregator._cPtr(No.Dup) : null, preparedFrame ? cast(GstVideoFrame*)preparedFrame._cPtr : null);
  }

  /**
      Begin preparing the frame from the pad buffer and sets it to prepared_frame.
      
      If overriden, `prepare_frame_finish` must also be overriden.
  
      Params:
        videoaggregator = the parent #GstVideoAggregator
        buffer = the input #GstBuffer to prepare (modified in place, changes are seen by the caller)
        preparedFrame = the #GstVideoFrame to prepare into (borrowed, only valid during the callback)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPrepareFrameStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncPrepareFrameStart(gid.gstvideo1.video_aggregator.VideoAggregator videoaggregator, gid.gst1.buffer.Buffer buffer, gid.gstvideo1.video_frame.VideoFrame preparedFrame)
  {
    auto _klass = cast(GstVideoAggregatorPadClass*)_vfuncClass;
    if (!_klass.prepareFrameStart)
      return;

    _klass.prepareFrameStart(cast(GstVideoAggregatorPad*)this._cPtr, videoaggregator ? cast(GstVideoAggregator*)videoaggregator._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, preparedFrame ? cast(GstVideoFrame*)preparedFrame._cPtr : null);
  }

  /**
      Called when either the input or output formats
                               have changed.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUpdateConversionInfo` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncUpdateConversionInfo()
  {
    auto _klass = cast(GstVideoAggregatorPadClass*)_vfuncClass;
    if (!_klass.updateConversionInfo)
      return;

    _klass.updateConversionInfo(cast(GstVideoAggregatorPad*)this._cPtr);
  }

  /**
      Returns the currently queued buffer that is going to be used
      for the current output frame.
      
      This must only be called from the #GstVideoAggregatorClass::aggregate_frames virtual method,
      or from the #GstVideoAggregatorPadClass::prepare_frame virtual method of the aggregator pads.
      
      The return value is only valid until #GstVideoAggregatorClass::aggregate_frames or #GstVideoAggregatorPadClass::prepare_frame
      returns.
      Returns: The currently queued buffer
  */
  gid.gst1.buffer.Buffer getCurrentBuffer() nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_video_aggregator_pad_get_current_buffer(cast(GstVideoAggregatorPad*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the currently prepared video frame that has to be aggregated into
      the current output frame.
      
      This must only be called from the #GstVideoAggregatorClass::aggregate_frames virtual method,
      or from the #GstVideoAggregatorPadClass::prepare_frame virtual method of the aggregator pads.
      
      The return value is only valid until #GstVideoAggregatorClass::aggregate_frames or #GstVideoAggregatorPadClass::prepare_frame
      returns.
      Returns: The currently prepared video frame
  */
  gid.gstvideo1.video_frame.VideoFrame getPreparedFrame() nothrow
  {
    GstVideoFrame* _cretval;
    _cretval = gst_video_aggregator_pad_get_prepared_frame(cast(GstVideoAggregatorPad*)this._cPtr);
    auto _retval = _cretval ? new gid.gstvideo1.video_frame.VideoFrame(cast(GstVideoFrame*)_cretval, this) : null;
    return _retval;
  }

  /**
      Checks if the pad currently has a buffer queued that is going to be used
      for the current output frame.
      
      This must only be called from the #GstVideoAggregatorClass::aggregate_frames virtual method,
      or from the #GstVideoAggregatorPadClass::prepare_frame virtual method of the aggregator pads.
      Returns: true if the pad has currently a buffer queued
  */
  bool hasCurrentBuffer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_aggregator_pad_has_current_buffer(cast(GstVideoAggregatorPad*)this._cPtr);
    return _retval;
  }

  /**
      Allows selecting that this pad requires an output format with alpha
  
      Params:
        needsAlpha = true if this pad requires alpha output
  */
  void setNeedsAlpha(bool needsAlpha) nothrow
  {
    gst_video_aggregator_pad_set_needs_alpha(cast(GstVideoAggregatorPad*)this._cPtr, needsAlpha);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from VideoAggregatorPad
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad), T.stringof ~ " is not derived from gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad");

    gid.gstbase1.aggregator_pad.AggregatorPad._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCleanFrame", true)[0]) == gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad))
      _installVfunc(klass, "clean_frame");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrepareFrame", true)[0]) == gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad))
      _installVfunc(klass, "prepare_frame");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrepareFrameFinish", true)[0]) == gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad))
      _installVfunc(klass, "prepare_frame_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPrepareFrameStart", true)[0]) == gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad))
      _installVfunc(klass, "prepare_frame_start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUpdateConversionInfo", true)[0]) == gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad))
      _installVfunc(klass, "update_conversion_info");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstVideoAggregatorPadClass*)klass;

    switch (vfunc)
    {
      case "clean_frame":
      {
        static extern(C) void _vfuncCleanFrameTramp(GstVideoAggregatorPad* pad, GstVideoAggregator* videoaggregator, GstVideoFrame* preparedFrame) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pad);
          if (!_obj)
          {
            auto _klass = cast(GstVideoAggregatorPadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pad);
            if (_klass.cleanFrame)
              return (cast(typeof(&_vfuncCleanFrameTramp))_klass.cleanFrame)(pad, videoaggregator, preparedFrame);
            return;
          }

          auto _preparedFrame = preparedFrame ? new gid.gstvideo1.video_frame.VideoFrame(cast(void*)preparedFrame, null) : null;

          try
          {
            _obj.vfuncCleanFrame(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstvideo1.video_aggregator.VideoAggregator)(cast(void*)videoaggregator, No.Take), _preparedFrame);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad.vfuncCleanFrame");
          }
        }

        _klass.cleanFrame = cast(typeof(_klass.cleanFrame))&_vfuncCleanFrameTramp;
        break;
      }
      case "prepare_frame":
      {
        static extern(C) gboolean _vfuncPrepareFrameTramp(GstVideoAggregatorPad* pad, GstVideoAggregator* videoaggregator, GstBuffer* buffer, GstVideoFrame* preparedFrame) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pad);
          if (!_obj)
          {
            auto _klass = cast(GstVideoAggregatorPadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pad);
            if (_klass.prepareFrame)
              return (cast(typeof(&_vfuncPrepareFrameTramp))_klass.prepareFrame)(pad, videoaggregator, buffer, preparedFrame);
            return typeof(return).init;
          }

          bool _dretval;
          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;
          auto _preparedFrame = preparedFrame ? new gid.gstvideo1.video_frame.VideoFrame(cast(void*)preparedFrame, null) : null;

          try
          {
            _dretval = _obj.vfuncPrepareFrame(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstvideo1.video_aggregator.VideoAggregator)(cast(void*)videoaggregator, No.Take), _buffer, _preparedFrame);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad.vfuncPrepareFrame");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_buffer)
            _buffer._cUnborrow;

          return _retval;
        }

        _klass.prepareFrame = cast(typeof(_klass.prepareFrame))&_vfuncPrepareFrameTramp;
        break;
      }
      case "prepare_frame_finish":
      {
        static extern(C) void _vfuncPrepareFrameFinishTramp(GstVideoAggregatorPad* pad, GstVideoAggregator* videoaggregator, GstVideoFrame* preparedFrame) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pad);
          if (!_obj)
          {
            auto _klass = cast(GstVideoAggregatorPadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pad);
            if (_klass.prepareFrameFinish)
              return (cast(typeof(&_vfuncPrepareFrameFinishTramp))_klass.prepareFrameFinish)(pad, videoaggregator, preparedFrame);
            return;
          }

          auto _preparedFrame = preparedFrame ? new gid.gstvideo1.video_frame.VideoFrame(cast(void*)preparedFrame, null) : null;

          try
          {
            _obj.vfuncPrepareFrameFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstvideo1.video_aggregator.VideoAggregator)(cast(void*)videoaggregator, No.Take), _preparedFrame);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad.vfuncPrepareFrameFinish");
          }
        }

        _klass.prepareFrameFinish = cast(typeof(_klass.prepareFrameFinish))&_vfuncPrepareFrameFinishTramp;
        break;
      }
      case "prepare_frame_start":
      {
        static extern(C) void _vfuncPrepareFrameStartTramp(GstVideoAggregatorPad* pad, GstVideoAggregator* videoaggregator, GstBuffer* buffer, GstVideoFrame* preparedFrame) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pad);
          if (!_obj)
          {
            auto _klass = cast(GstVideoAggregatorPadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pad);
            if (_klass.prepareFrameStart)
              return (cast(typeof(&_vfuncPrepareFrameStartTramp))_klass.prepareFrameStart)(pad, videoaggregator, buffer, preparedFrame);
            return;
          }

          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;
          auto _preparedFrame = preparedFrame ? new gid.gstvideo1.video_frame.VideoFrame(cast(void*)preparedFrame, null) : null;

          try
          {
            _obj.vfuncPrepareFrameStart(gid.gobject2.object.ObjectWrap._getDObject!(gid.gstvideo1.video_aggregator.VideoAggregator)(cast(void*)videoaggregator, No.Take), _buffer, _preparedFrame);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad.vfuncPrepareFrameStart");
          }
          if (_buffer)
            _buffer._cUnborrow;

        }

        _klass.prepareFrameStart = cast(typeof(_klass.prepareFrameStart))&_vfuncPrepareFrameStartTramp;
        break;
      }
      case "update_conversion_info":
      {
        static extern(C) void _vfuncUpdateConversionInfoTramp(GstVideoAggregatorPad* pad) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pad);
          if (!_obj)
          {
            auto _klass = cast(GstVideoAggregatorPadClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pad);
            if (_klass.updateConversionInfo)
              return (cast(typeof(&_vfuncUpdateConversionInfoTramp))_klass.updateConversionInfo)(pad);
            return;
          }

          try
          {
            _obj.vfuncUpdateConversionInfo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad.vfuncUpdateConversionInfo");
          }
        }

        _klass.updateConversionInfo = cast(typeof(_klass.updateConversionInfo))&_vfuncUpdateConversionInfoTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad]
class VideoAggregatorPadGidBuilderImpl(T) : gid.gstbase1.aggregator_pad.AggregatorPadGidBuilderImpl!T
{

  /** */
  T maxLastBufferRepeat(ulong propval) nothrow
  {
    return setProperty("max-last-buffer-repeat", propval);
  }

  /** */
  T repeatAfterEos(bool propval) nothrow
  {
    return setProperty("repeat-after-eos", propval);
  }

  /** */
  T zorder(uint propval) nothrow
  {
    return setProperty("zorder", propval);
  }
}

/// Fluent builder for [gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad]
final class VideoAggregatorPadGidBuilder : VideoAggregatorPadGidBuilderImpl!VideoAggregatorPadGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoAggregatorPad build() nothrow
  {
    return new VideoAggregatorPad(cast(void*)createGObject(VideoAggregatorPad._getGType), Yes.Take);
  }
}
