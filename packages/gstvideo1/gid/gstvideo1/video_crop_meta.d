/// Module for [VideoCropMeta] class
module gid.gstvideo1.video_crop_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/**
    Extra buffer metadata describing image cropping.
*/
class VideoCropMeta : StructWrap!(GstVideoCropMeta)
{
  /**
      Create a `video_crop_meta.VideoCropMeta` wrap type.
      Params:
        x = the horizontal offset
        y = the vertical offset
        width = the cropped width
        height = the cropped height
  */
  this(uint x = uint.init, uint y = uint.init, uint width = uint.init, uint height = uint.init) nothrow
  {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
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
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstVideoCropMeta*)this._cPtr).meta, this);
  }

  /**
      Get `x` field.
      Returns: the horizontal offset
  */
  @property uint x() nothrow
  {
    return (cast(GstVideoCropMeta*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = the horizontal offset
  */
  @property void x(uint propval) nothrow
  {
    (cast(GstVideoCropMeta*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: the vertical offset
  */
  @property uint y() nothrow
  {
    return (cast(GstVideoCropMeta*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = the vertical offset
  */
  @property void y(uint propval) nothrow
  {
    (cast(GstVideoCropMeta*)this._cPtr).y = propval;
  }

  /**
      Get `width` field.
      Returns: the cropped width
  */
  @property uint width() nothrow
  {
    return (cast(GstVideoCropMeta*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = the cropped width
  */
  @property void width(uint propval) nothrow
  {
    (cast(GstVideoCropMeta*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: the cropped height
  */
  @property uint height() nothrow
  {
    return (cast(GstVideoCropMeta*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = the cropped height
  */
  @property void height(uint propval) nothrow
  {
    (cast(GstVideoCropMeta*)this._cPtr).height = propval;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_crop_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
