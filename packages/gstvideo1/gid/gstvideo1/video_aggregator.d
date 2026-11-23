/// Module for [VideoAggregator] class
module gid.gstvideo1.video_aggregator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.task_pool;
import gid.gst1.types;
import gid.gstbase1.aggregator;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_info;

/**
    VideoAggregator can accept AYUV, ARGB and BGRA video streams. For each of the requested
    sink pads it will compare the incoming geometry and framerate to define the
    output parameters. Indeed output video frames will have the geometry of the
    biggest incoming video stream and the framerate of the fastest incoming one.
    
    VideoAggregator will do colorspace conversion.
    
    Zorder for each input stream can be configured on the
    #GstVideoAggregatorPad.
*/
class VideoAggregator : gid.gstbase1.aggregator.Aggregator
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
    return cast(void function())gst_video_aggregator_get_type != &gidSymbolNotFound ? gst_video_aggregator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstVideoAggregator";
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoAggregator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstvideo1.video_aggregator.VideoAggregator]
      Returns: New builder object
  */
  static VideoAggregatorGidBuilder builder() nothrow
  {
    return new VideoAggregatorGidBuilder;
  }

  /**
      Get `forceLive` property.
      Returns: Causes the element to aggregate on a timeout even when no live source is
        connected to its sinks. See #GstAggregator:min-upstream-latency for a
        companion property: in the vast majority of cases where you plan to plug in
        live sources with a non-zero latency, you should set it to a non-zero value.
  */
  @property bool forceLive() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("force-live");
  }

  /**
      Lets subclasses aggregate frames that are ready. Subclasses
                                 should iterate the GstElement.sinkpads and use the already
                                 mapped #GstVideoFrame from [gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad.getPreparedFrame]
                                 or directly use the #GstBuffer from [gid.gstvideo1.video_aggregator_pad.VideoAggregatorPad.getCurrentBuffer]
                                 if it needs to map the buffer in a special way. The result of the
                                 aggregation should land in outbuffer.
  
      Params:
        outbuffer =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAggregateFrames` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncAggregateFrames(gid.gst1.buffer.Buffer outbuffer)
  {
    auto _klass = cast(GstVideoAggregatorClass*)_vfuncClass;
    if (!_klass.aggregateFrames)
      return typeof(return).init;

    GstFlowReturn _cretval;
    _cretval = _klass.aggregateFrames(cast(GstVideoAggregator*)this._cPtr, outbuffer ? cast(GstBuffer*)outbuffer._cPtr(No.Dup) : null);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    return _retval;
  }

  /** */
  protected void vfuncFindBestFormat(gid.gst1.caps.Caps downstreamCaps, gid.gstvideo1.video_info.VideoInfo bestInfo, out bool atLeastOneAlpha)
  {
    auto _klass = cast(GstVideoAggregatorClass*)_vfuncClass;
    if (!_klass.findBestFormat)
      return;

    gboolean _atLeastOneAlpha;
    _klass.findBestFormat(cast(GstVideoAggregator*)this._cPtr, downstreamCaps ? cast(GstCaps*)downstreamCaps._cPtr(No.Dup) : null, bestInfo ? cast(GstVideoInfo*)bestInfo._cPtr(No.Dup) : null, &_atLeastOneAlpha);
    atLeastOneAlpha = cast(bool)_atLeastOneAlpha;
  }

  /**
      Optional.
                                 Lets subclasses update the #GstCaps representing
                                 the src pad caps before usage.  Return null to indicate failure.
  
      Params:
        caps =  (modified in place, changes are seen by the caller)
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUpdateCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gst1.caps.Caps vfuncUpdateCaps(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstVideoAggregatorClass*)_vfuncClass;
    if (!_klass.updateCaps)
      return typeof(return).init;

    GstCaps* _cretval;
    _cretval = _klass.updateCaps(cast(GstVideoAggregator*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      The returned #GstTaskPool is used internally for performing parallel
      video format conversions/scaling/etc during the
      #GstVideoAggregatorPadClass::prepare_frame_start() process.
      Subclasses can add their own operation to perform using the returned
      #GstTaskPool during #GstVideoAggregatorClass::aggregate_frames().
      Returns: the #GstTaskPool that can be used by subclasses
            for performing concurrent operations
  */
  gid.gst1.task_pool.TaskPool getExecutionTaskPool() nothrow
  {
    GstTaskPool* _cretval;
    _cretval = gst_video_aggregator_get_execution_task_pool(cast(GstVideoAggregator*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.task_pool.TaskPool)(cast(GstTaskPool*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from VideoAggregator
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstvideo1.video_aggregator.VideoAggregator), T.stringof ~ " is not derived from gid.gstvideo1.video_aggregator.VideoAggregator");

    gid.gstbase1.aggregator.Aggregator._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAggregateFrames", true)[0]) == gid.gstvideo1.video_aggregator.VideoAggregator))
      _installVfunc(klass, "aggregate_frames");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFindBestFormat", true)[0]) == gid.gstvideo1.video_aggregator.VideoAggregator))
      _installVfunc(klass, "find_best_format");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUpdateCaps", true)[0]) == gid.gstvideo1.video_aggregator.VideoAggregator))
      _installVfunc(klass, "update_caps");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstVideoAggregatorClass*)klass;

    switch (vfunc)
    {
      case "aggregate_frames":
      {
        static extern(C) GstFlowReturn _vfuncAggregateFramesTramp(GstVideoAggregator* videoaggregator, GstBuffer* outbuffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_aggregator.VideoAggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoaggregator);
          if (!_obj)
          {
            auto _klass = cast(GstVideoAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoaggregator);
            if (_klass.aggregateFrames)
              return (cast(typeof(&_vfuncAggregateFramesTramp))_klass.aggregateFrames)(videoaggregator, outbuffer);
            return typeof(return).init;
          }

          gid.gst1.types.FlowReturn _dretval;
          auto _outbuffer = outbuffer ? new gid.gst1.buffer.Buffer(cast(void*)outbuffer, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncAggregateFrames(_outbuffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_aggregator.VideoAggregator.vfuncAggregateFrames");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          if (_outbuffer)
            _outbuffer._cUnborrow;

          return _retval;
        }

        _klass.aggregateFrames = cast(typeof(_klass.aggregateFrames))&_vfuncAggregateFramesTramp;
        break;
      }
      case "find_best_format":
      {
        static extern(C) void _vfuncFindBestFormatTramp(GstVideoAggregator* vagg, GstCaps* downstreamCaps, GstVideoInfo* bestInfo, gboolean* atLeastOneAlpha) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_aggregator.VideoAggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)vagg);
          if (!_obj)
          {
            auto _klass = cast(GstVideoAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)vagg);
            if (_klass.findBestFormat)
              return (cast(typeof(&_vfuncFindBestFormatTramp))_klass.findBestFormat)(vagg, downstreamCaps, bestInfo, atLeastOneAlpha);
            return;
          }

          auto _downstreamCaps = downstreamCaps ? new gid.gst1.caps.Caps(cast(void*)downstreamCaps, Yes.Take)._cBorrow : null;
          auto _bestInfo = bestInfo ? new gid.gstvideo1.video_info.VideoInfo(cast(void*)bestInfo, Yes.Take)._cBorrow : null;
          bool _atLeastOneAlpha;

          try
          {
            _obj.vfuncFindBestFormat(_downstreamCaps, _bestInfo, _atLeastOneAlpha);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_aggregator.VideoAggregator.vfuncFindBestFormat");
          }
          if (_downstreamCaps)
            _downstreamCaps._cUnborrow;
          if (_bestInfo)
            _bestInfo._cUnborrow;
          *atLeastOneAlpha = _atLeastOneAlpha;

        }

        _klass.findBestFormat = cast(typeof(_klass.findBestFormat))&_vfuncFindBestFormatTramp;
        break;
      }
      case "update_caps":
      {
        static extern(C) GstCaps* _vfuncUpdateCapsTramp(GstVideoAggregator* videoaggregator, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstvideo1.video_aggregator.VideoAggregator)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)videoaggregator);
          if (!_obj)
          {
            auto _klass = cast(GstVideoAggregatorClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)videoaggregator);
            if (_klass.updateCaps)
              return (cast(typeof(&_vfuncUpdateCapsTramp))_klass.updateCaps)(videoaggregator, caps);
            return typeof(return).init;
          }

          gid.gst1.caps.Caps _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncUpdateCaps(_caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstvideo1.video_aggregator.VideoAggregator.vfuncUpdateCaps");
          }
          auto _retval = _dretval ? cast(GstCaps*)_dretval._cPtr(Yes.Dup) : null;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.updateCaps = cast(typeof(_klass.updateCaps))&_vfuncUpdateCapsTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstvideo1.video_aggregator.VideoAggregator]
class VideoAggregatorGidBuilderImpl(T) : gid.gstbase1.aggregator.AggregatorGidBuilderImpl!T
{

  /**
      Set `forceLive` property.
      Params:
        propval = Causes the element to aggregate on a timeout even when no live source is
          connected to its sinks. See #GstAggregator:min-upstream-latency for a
          companion property: in the vast majority of cases where you plan to plug in
          live sources with a non-zero latency, you should set it to a non-zero value.
      Returns: Builder instance for fluent chaining
  */
  T forceLive(bool propval) nothrow
  {
    return setProperty("force-live", propval);
  }
}

/// Fluent builder for [gid.gstvideo1.video_aggregator.VideoAggregator]
final class VideoAggregatorGidBuilder : VideoAggregatorGidBuilderImpl!VideoAggregatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoAggregator build() nothrow
  {
    return new VideoAggregator(cast(void*)createGObject(VideoAggregator._getGType), Yes.Take);
  }
}
