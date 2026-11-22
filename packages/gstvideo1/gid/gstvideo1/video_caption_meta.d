/// Module for [VideoCaptionMeta] class
module gid.gstvideo1.video_caption_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/**
    Extra buffer metadata providing Closed Caption.
*/
class VideoCaptionMeta : StructWrap!(GstVideoCaptionMeta)
{
  /**
      Create a `video_caption_meta.VideoCaptionMeta` wrap type.
      Params:
        captionType = The type of Closed Caption contained in the meta.
  */
  this(gid.gstvideo1.types.VideoCaptionType captionType = gid.gstvideo1.types.VideoCaptionType.init) nothrow
  {
    this.captionType = captionType;
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
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstVideoCaptionMeta*)this._cPtr).meta, this);
  }

  /**
      Get `captionType` field.
      Returns: The type of Closed Caption contained in the meta.
  */
  @property gid.gstvideo1.types.VideoCaptionType captionType() nothrow
  {
    return cast(gid.gstvideo1.types.VideoCaptionType)(cast(GstVideoCaptionMeta*)this._cPtr).captionType;
  }

  /**
      Set `captionType` field.
      Params:
        propval = The type of Closed Caption contained in the meta.
  */
  @property void captionType(gid.gstvideo1.types.VideoCaptionType propval) nothrow
  {
    (cast(GstVideoCaptionMeta*)this._cPtr).captionType = cast(GstVideoCaptionType)propval;
  }

  /**
      Get `data` field.
      Returns: The Closed Caption data.
  */
  @property ubyte[] data() nothrow
  {
    if (!(cast(GstVideoCaptionMeta*)this._cPtr).data)
      return null;

    return (cast(GstVideoCaptionMeta*)this._cPtr).data[0 .. (cast(GstVideoCaptionMeta*)this._cPtr).size].dup;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_caption_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
