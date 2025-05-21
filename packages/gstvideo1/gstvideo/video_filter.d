/// Module for [VideoFilter] class
module gstvideo.video_filter;

import gid.gid;
import gstbase.base_transform;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Provides useful functions and a base class for video filters.
    
    The videofilter will by default enable QoS on the parent GstBaseTransform
    to implement frame dropping.
*/
class VideoFilter : gstbase.base_transform.BaseTransform
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
    return cast(void function())gst_video_filter_get_type != &gidSymbolNotFound ? gst_video_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoFilter self()
  {
    return this;
  }
}
