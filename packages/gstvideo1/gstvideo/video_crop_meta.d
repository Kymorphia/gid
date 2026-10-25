/// Module for [VideoCropMeta] class
module gstvideo.video_crop_meta;

public import gid.basictypes;
import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Extra buffer metadata describing image cropping.
*/
class VideoCropMeta
{
  GstVideoCropMeta _cInstance;

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
    _cInstance = *cast(GstVideoCropMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta() nothrow
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoCropMeta*)this._cPtr).meta, No.Take);
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
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_crop_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
