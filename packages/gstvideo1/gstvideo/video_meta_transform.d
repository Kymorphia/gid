/// Module for [VideoMetaTransform] class
module gstvideo.video_meta_transform;

public import gid.basictypes;
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

  /**
      Create a `video_meta_transform.VideoMetaTransform` wrap type.
      Params:
        inInfo = the input #GstVideoInfo
        outInfo = the output #GstVideoInfo
  */
  this(gstvideo.video_info.VideoInfo inInfo = gstvideo.video_info.VideoInfo.init, gstvideo.video_info.VideoInfo outInfo = gstvideo.video_info.VideoInfo.init) nothrow
  {
    this.inInfo = inInfo;
    this.outInfo = outInfo;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstVideoMetaTransform*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `inInfo` field.
      Returns: the input #GstVideoInfo
  */
  @property gstvideo.video_info.VideoInfo inInfo() nothrow
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransform*)this._cPtr).inInfo);
  }

  /**
      Set `inInfo` field.
      Params:
        propval = the input #GstVideoInfo
  */
  @property void inInfo(gstvideo.video_info.VideoInfo propval) nothrow
  {
    cValueFree!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransform*)this._cPtr).inInfo);
    dToC(propval, cast(void*)&(cast(GstVideoMetaTransform*)this._cPtr).inInfo);
  }

  /**
      Get `outInfo` field.
      Returns: the output #GstVideoInfo
  */
  @property gstvideo.video_info.VideoInfo outInfo() nothrow
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransform*)this._cPtr).outInfo);
  }

  /**
      Set `outInfo` field.
      Params:
        propval = the output #GstVideoInfo
  */
  @property void outInfo(gstvideo.video_info.VideoInfo propval) nothrow
  {
    cValueFree!(gstvideo.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransform*)this._cPtr).outInfo);
    dToC(propval, cast(void*)&(cast(GstVideoMetaTransform*)this._cPtr).outInfo);
  }

  /**
      Get the #GQuark for the "gst-video-scale" metadata transform operation.
      Returns: a #GQuark
  */
  static glib.types.Quark scaleGetQuark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_video_meta_transform_scale_get_quark();
    return _retval;
  }
}
