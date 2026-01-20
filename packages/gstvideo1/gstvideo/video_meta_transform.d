/// Module for [VideoMetaTransform] class
module gstvideo.video_meta_transform;

import gid.gid;
import glib.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_info;

/**
    Extra data passed to a video transform #GstMetaTransformFunction such as:
    "gst-video-scale".
*/
class VideoMetaTransform
{
  GstVideoMetaTransform _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_meta_transform.VideoMetaTransform");

    _cInstance = *cast(GstVideoMetaTransform*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `inInfo` field.
      Returns: the input #GstVideoInfo
  */
  @property gstvideo.video_info.VideoInfo inInfo()
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransform*)this._cPtr).inInfo);
  }

  /**
      Set `inInfo` field.
      Params:
        propval = the input #GstVideoInfo
  */
  @property void inInfo(gstvideo.video_info.VideoInfo propval)
  {
    cValueFree!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransform*)this._cPtr).inInfo);
    dToC(propval, cast(void*)&(cast(GstVideoMetaTransform*)this._cPtr).inInfo);
  }

  /**
      Get `outInfo` field.
      Returns: the output #GstVideoInfo
  */
  @property gstvideo.video_info.VideoInfo outInfo()
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransform*)this._cPtr).outInfo);
  }

  /**
      Set `outInfo` field.
      Params:
        propval = the output #GstVideoInfo
  */
  @property void outInfo(gstvideo.video_info.VideoInfo propval)
  {
    cValueFree!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransform*)this._cPtr).outInfo);
    dToC(propval, cast(void*)&(cast(GstVideoMetaTransform*)this._cPtr).outInfo);
  }

  /**
      Get the #GQuark for the "gst-video-scale" metadata transform operation.
      Returns: a #GQuark
  */
  static glib.types.Quark scaleGetQuark()
  {
    glib.types.Quark _retval;
    _retval = gst_video_meta_transform_scale_get_quark();
    return _retval;
  }
}
