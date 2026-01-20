/// Module for [VideoCodecAlphaMeta] class
module gstvideo.video_codec_alpha_meta;

import gid.gid;
import gst.buffer;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    This meta is primarily for internal use in GStreamer elements to support
    VP8/VP9 transparent video stored into WebM or Matroska containers, or
    transparent static AV1 images. Nothing prevents you from using this meta
    for custom purposes, but it generally can't be used to easily to add support
    for alpha channels to CODECs or formats that don't support that out of the
    box.
*/
class VideoCodecAlphaMeta
{
  GstVideoCodecAlphaMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_codec_alpha_meta.VideoCodecAlphaMeta");

    _cInstance = *cast(GstVideoCodecAlphaMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoCodecAlphaMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `buffer` field.
      Returns: the encoded alpha frame
  */
  @property gst.buffer.Buffer buffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecAlphaMeta*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = the encoded alpha frame
  */
  @property void buffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoCodecAlphaMeta*)this._cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstVideoCodecAlphaMeta*)this._cPtr).buffer);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_codec_alpha_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
