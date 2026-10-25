/// Module for [VideoCaptionMeta] class
module gstvideo.video_caption_meta;

public import gid.basictypes;
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

  /**
      Create a `video_caption_meta.VideoCaptionMeta` wrap type.
      Params:
        captionType = The type of Closed Caption contained in the meta.
  */
  this(gstvideo.types.VideoCaptionType captionType = gstvideo.types.VideoCaptionType.init) nothrow
  {
    this.captionType = captionType;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstVideoCaptionMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta() nothrow
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoCaptionMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `captionType` field.
      Returns: The type of Closed Caption contained in the meta.
  */
  @property gstvideo.types.VideoCaptionType captionType() nothrow
  {
    return cast(gstvideo.types.VideoCaptionType)(cast(GstVideoCaptionMeta*)this._cPtr).captionType;
  }

  /**
      Set `captionType` field.
      Params:
        propval = The type of Closed Caption contained in the meta.
  */
  @property void captionType(gstvideo.types.VideoCaptionType propval) nothrow
  {
    (cast(GstVideoCaptionMeta*)this._cPtr).captionType = cast(GstVideoCaptionType)propval;
  }

  /**
      Get `data` field.
      Returns: The Closed Caption data.
  */
  @property ubyte[] data() nothrow
  {
    return (cast(GstVideoCaptionMeta*)this._cPtr).data[0 .. (cast(GstVideoCaptionMeta*)this._cPtr).size].dup;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_caption_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
