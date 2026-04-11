/// Module for [VideoAggregator] class
module gstvideo.video_aggregator;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gst.task_pool;
import gstbase.aggregator;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    VideoAggregator can accept AYUV, ARGB and BGRA video streams. For each of the requested
    sink pads it will compare the incoming geometry and framerate to define the
    output parameters. Indeed output video frames will have the geometry of the
    biggest incoming video stream and the framerate of the fastest incoming one.
    
    VideoAggregator will do colorspace conversion.
    
    Zorder for each input stream can be configured on the
    #GstVideoAggregatorPad.
*/
class VideoAggregator : gstbase.aggregator.Aggregator
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
    return cast(void function())gst_video_aggregator_get_type != &gidSymbolNotFound ? gst_video_aggregator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoAggregator self()
  {
    return this;
  }

  /**
      Get builder for [gstvideo.video_aggregator.VideoAggregator]
      Returns: New builder object
  */
  static VideoAggregatorGidBuilder builder()
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
  @property bool forceLive()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("force-live");
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
  gst.task_pool.TaskPool getExecutionTaskPool()
  {
    GstTaskPool* _cretval;
    _cretval = gst_video_aggregator_get_execution_task_pool(cast(GstVideoAggregator*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.task_pool.TaskPool)(cast(GstTaskPool*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gstvideo.video_aggregator.VideoAggregator]
class VideoAggregatorGidBuilderImpl(T) : gstbase.aggregator.AggregatorGidBuilderImpl!T
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
  T forceLive(bool propval)
  {
    return setProperty("force-live", propval);
  }
}

/// Fluent builder for [gstvideo.video_aggregator.VideoAggregator]
final class VideoAggregatorGidBuilder : VideoAggregatorGidBuilderImpl!VideoAggregatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VideoAggregator build()
  {
    return new VideoAggregator(cast(void*)createGObject(VideoAggregator._getGType), No.Take);
  }
}
