/// Module for [VideoCaptionMeta] class
module gstvideo.video_caption_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Extra buffer metadata providing Closed Caption.
*/
class VideoCaptionMeta
{
  GstVideoCaptionMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_caption_meta.VideoCaptionMeta");

    _cInstance = *cast(GstVideoCaptionMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoCaptionMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `captionType` field.
      Returns: The type of Closed Caption contained in the meta.
  */
  @property gstvideo.types.VideoCaptionType captionType()
  {
    return cast(gstvideo.types.VideoCaptionType)(cast(GstVideoCaptionMeta*)this._cPtr).captionType;
  }

  /**
      Set `captionType` field.
      Params:
        propval = The type of Closed Caption contained in the meta.
  */
  @property void captionType(gstvideo.types.VideoCaptionType propval)
  {
    (cast(GstVideoCaptionMeta*)this._cPtr).captionType = cast(GstVideoCaptionType)propval;
  }

  /**
      Get `size` field.
      Returns: The size in bytes of @data
  */
  @property size_t size()
  {
    return (cast(GstVideoCaptionMeta*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = The size in bytes of @data
  */
  @property void size(size_t propval)
  {
    (cast(GstVideoCaptionMeta*)this._cPtr).size = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_caption_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
