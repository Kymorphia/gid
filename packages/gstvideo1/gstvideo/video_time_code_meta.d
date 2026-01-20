/// Module for [VideoTimeCodeMeta] class
module gstvideo.video_time_code_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_time_code;

/**
    Extra buffer metadata describing the GstVideoTimeCode of the frame.
    
    Each frame is assumed to have its own timecode, i.e. they are not
    automatically incremented/interpolated.
*/
class VideoTimeCodeMeta
{
  GstVideoTimeCodeMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_time_code_meta.VideoTimeCodeMeta");

    _cInstance = *cast(GstVideoTimeCodeMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoTimeCodeMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `tc` field.
      Returns: the GstVideoTimeCode to attach
  */
  @property gstvideo.video_time_code.VideoTimeCode tc()
  {
    return cToD!(gstvideo.video_time_code.VideoTimeCode)(cast(void*)&(cast(GstVideoTimeCodeMeta*)this._cPtr).tc);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_time_code_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
