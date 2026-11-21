/// Module for [VideoMetaTransform] class
module gid.gstvideo1.video_meta_transform;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.types;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_info;

/**
    Extra data passed to a video transform #GstMetaTransformFunction such as:
    "gst-video-scale".
    
    This transformation can not express letterbox, cropping, or rotations,
    use #GstVideoMetaTransformMatrix instead
*/
class VideoMetaTransform : StructWrap!(GstVideoMetaTransform)
{
  /**
      Create a `video_meta_transform.VideoMetaTransform` wrap type.
      Params:
        inInfo = the input #GstVideoInfo
        outInfo = the output #GstVideoInfo
  */
  this(gid.gstvideo1.video_info.VideoInfo inInfo = gid.gstvideo1.video_info.VideoInfo.init, gid.gstvideo1.video_info.VideoInfo outInfo = gid.gstvideo1.video_info.VideoInfo.init) nothrow
  {
    this.inInfo = inInfo;
    this.outInfo = outInfo;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  private gid.gstvideo1.video_info.VideoInfo _inInfoRef; // Keeps borrowed field value alive

  /**
      Get `inInfo` field.
      Returns: the input #GstVideoInfo
  */
  @property gid.gstvideo1.video_info.VideoInfo inInfo() nothrow
  {
    return cToD!(gid.gstvideo1.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransform*)this._cPtr).inInfo);
  }

  /**
      Set `inInfo` field.
      Params:
        propval = the input #GstVideoInfo
  */
  @property void inInfo(gid.gstvideo1.video_info.VideoInfo propval) nothrow
  {
    if (_refuseBorrowedStore("inInfo"))
      return;

    _inInfoRef = propval;
    (cast(GstVideoMetaTransform*)this._cPtr).inInfo = propval ? cast(GstVideoInfo*)propval._cPtr(No.Dup) : null;
  }

  private gid.gstvideo1.video_info.VideoInfo _outInfoRef; // Keeps borrowed field value alive

  /**
      Get `outInfo` field.
      Returns: the output #GstVideoInfo
  */
  @property gid.gstvideo1.video_info.VideoInfo outInfo() nothrow
  {
    return cToD!(gid.gstvideo1.video_info.VideoInfo)(cast(void*)(cast(GstVideoMetaTransform*)this._cPtr).outInfo);
  }

  /**
      Set `outInfo` field.
      Params:
        propval = the output #GstVideoInfo
  */
  @property void outInfo(gid.gstvideo1.video_info.VideoInfo propval) nothrow
  {
    if (_refuseBorrowedStore("outInfo"))
      return;

    _outInfoRef = propval;
    (cast(GstVideoMetaTransform*)this._cPtr).outInfo = propval ? cast(GstVideoInfo*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get the #GQuark for the "gst-video-scale" metadata transform operation.
      Returns: a #GQuark
  */
  static gid.glib2.types.Quark scaleGetQuark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_video_meta_transform_scale_get_quark();
    return _retval;
  }
}
