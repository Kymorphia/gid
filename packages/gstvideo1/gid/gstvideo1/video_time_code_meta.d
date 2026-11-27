/// Module for [VideoTimeCodeMeta] class
module gid.gstvideo1.video_time_code_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_time_code;

/**
    Extra buffer metadata describing the GstVideoTimeCode of the frame.
    
    Each frame is assumed to have its own timecode, i.e. they are not
    automatically incremented/interpolated.
*/
@gidGir("VideoTimeCodeMeta")
class VideoTimeCodeMeta : StructWrap!(GstVideoTimeCodeMeta)
{
  /**
      Create a `video_time_code_meta.VideoTimeCodeMeta` wrap type.
  */
  this() nothrow
  {
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

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gid.gst1.meta.Meta meta() nothrow
  {
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstVideoTimeCodeMeta*)this._cPtr).meta, this);
  }

  /**
      Get `tc` field.
      Returns: the GstVideoTimeCode to attach
  */
  @property gid.gstvideo1.video_time_code.VideoTimeCode tc() nothrow
  {
    return cToD!(gid.gstvideo1.video_time_code.VideoTimeCode)(cast(void*)&(cast(GstVideoTimeCodeMeta*)this._cPtr).tc);
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_time_code_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
