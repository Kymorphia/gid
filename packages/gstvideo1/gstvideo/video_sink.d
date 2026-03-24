/// Module for [VideoSink] class
module gstvideo.video_sink;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gstbase.base_sink;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Provides useful functions and a base class for video sinks.
    
    GstVideoSink will configure the default base sink to drop frames that
    arrive later than 20ms as this is considered the default threshold for
    observing out-of-sync frames.
*/
class VideoSink : gstbase.base_sink.BaseSink
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
    return cast(void function())gst_video_sink_get_type != &gidSymbolNotFound ? gst_video_sink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoSink self()
  {
    return this;
  }

  /**
  Get builder for [gstvideo.video_sink.VideoSink]
  Returns: New builder object
  */
  static VideoSinkGidBuilder builder()
  {
    return new VideoSinkGidBuilder;
  }

  /**
      Get `showPrerollFrame` property.
      Returns: Whether to show video frames during preroll. If set to false, video
        frames will only be rendered in PLAYING state.
  */
  @property bool showPrerollFrame()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-preroll-frame");
  }

  /**
      Set `showPrerollFrame` property.
      Params:
        propval = Whether to show video frames during preroll. If set to false, video
          frames will only be rendered in PLAYING state.
  */
  @property void showPrerollFrame(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("show-preroll-frame", propval);
  }
}

class VideoSinkGidBuilderImpl(T) : gstbase.base_sink.BaseSinkGidBuilderImpl!T
{

  /**
      Set `showPrerollFrame` property.
      Params:
        propval = Whether to show video frames during preroll. If set to false, video
          frames will only be rendered in PLAYING state.
      Returns: Builder instance for fluent chaining
  */
  T showPrerollFrame(bool propval)
  {
    return setProperty("show-preroll-frame", propval);
  }
}

/// Fluent builder for [gstvideo.video_sink.VideoSink]
final class VideoSinkGidBuilder : VideoSinkGidBuilderImpl!VideoSinkGidBuilder
{
  VideoSink build()
  {
    return new VideoSink(cast(void*)createGObject(VideoSink._getGType), No.Take);
  }
}
