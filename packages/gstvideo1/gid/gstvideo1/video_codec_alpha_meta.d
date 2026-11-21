/// Module for [VideoCodecAlphaMeta] class
module gid.gstvideo1.video_codec_alpha_meta;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gst1.buffer;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/**
    This meta is primarily for internal use in GStreamer elements to support
    VP8/VP9 transparent video stored into WebM or Matroska containers, or
    transparent static AV1 images. Nothing prevents you from using this meta
    for custom purposes, but it generally can't be used to easily to add support
    for alpha channels to CODECs or formats that don't support that out of the
    box.
*/
class VideoCodecAlphaMeta : StructWrap!(GstVideoCodecAlphaMeta)
{
  /**
      Create a `video_codec_alpha_meta.VideoCodecAlphaMeta` wrap type.
      Params:
        buffer = the encoded alpha frame
  */
  this(gid.gst1.buffer.Buffer buffer = gid.gst1.buffer.Buffer.init) nothrow
  {
    this.buffer = buffer;
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
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstVideoCodecAlphaMeta*)this._cPtr).meta, this);
  }

  private gid.gst1.buffer.Buffer _bufferRef; // Keeps borrowed field value alive

  /**
      Get `buffer` field.
      Returns: the encoded alpha frame
  */
  @property gid.gst1.buffer.Buffer buffer() nothrow
  {
    return cToD!(gid.gst1.buffer.Buffer)(cast(void*)(cast(GstVideoCodecAlphaMeta*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = the encoded alpha frame
  */
  @property void buffer(gid.gst1.buffer.Buffer propval) nothrow
  {
    if (_refuseBorrowedStore("buffer"))
      return;

    _bufferRef = propval;
    (cast(GstVideoCodecAlphaMeta*)this._cPtr).buffer = propval ? cast(GstBuffer*)propval._cPtr(No.Dup) : null;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_codec_alpha_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
