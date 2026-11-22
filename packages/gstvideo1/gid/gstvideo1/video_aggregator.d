/// Module for [VideoAggregator] class
module gid.gstvideo1.video_aggregator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.task_pool;
import gid.gstbase1.aggregator;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

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
