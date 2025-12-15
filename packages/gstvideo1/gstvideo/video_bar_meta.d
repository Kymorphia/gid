/// Module for [VideoBarMeta] class
module gstvideo.video_bar_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Bar data should be included in video user data
    whenever the rectangular picture area containing useful information
    does not extend to the full height or width of the coded frame
    and AFD alone is insufficient to describe the extent of the image.
    
    Note: either vertical or horizontal bars are specified, but not both.
    
    For more details, see:
    
    https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
    
    and SMPTE ST2016-1
*/
class VideoBarMeta
{
  GstVideoBarMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_bar_meta.VideoBarMeta");

    cInstance = *cast(GstVideoBarMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoBarMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `field` field.
      Returns: 0 for progressive or field 1 and 1 for field 2
  */
  @property ubyte field()
  {
    return (cast(GstVideoBarMeta*)this._cPtr).field;
  }

  /**
      Set `field` field.
      Params:
        propval = 0 for progressive or field 1 and 1 for field 2
  */
  @property void field(ubyte propval)
  {
    (cast(GstVideoBarMeta*)this._cPtr).field = propval;
  }

  /**
      Get `isLetterbox` field.
      Returns: if true then bar data specifies letterbox, otherwise pillarbox
  */
  @property bool isLetterbox()
  {
    return cast(bool)(cast(GstVideoBarMeta*)this._cPtr).isLetterbox;
  }

  /**
      Set `isLetterbox` field.
      Params:
        propval = if true then bar data specifies letterbox, otherwise pillarbox
  */
  @property void isLetterbox(bool propval)
  {
    (cast(GstVideoBarMeta*)this._cPtr).isLetterbox = propval;
  }

  /**
      Get `barData1` field.
      Returns: If @is_letterbox is true, then the value specifies the
           last line of a horizontal letterbox bar area at top of reconstructed frame.
           Otherwise, it specifies the last horizontal luminance sample of a vertical pillarbox
           bar area at the left side of the reconstructed frame
  */
  @property uint barData1()
  {
    return (cast(GstVideoBarMeta*)this._cPtr).barData1;
  }

  /**
      Set `barData1` field.
      Params:
        propval = If @is_letterbox is true, then the value specifies the
             last line of a horizontal letterbox bar area at top of reconstructed frame.
             Otherwise, it specifies the last horizontal luminance sample of a vertical pillarbox
             bar area at the left side of the reconstructed frame
  */
  @property void barData1(uint propval)
  {
    (cast(GstVideoBarMeta*)this._cPtr).barData1 = propval;
  }

  /**
      Get `barData2` field.
      Returns: If @is_letterbox is true, then the value specifies the
           first line of a horizontal letterbox bar area at bottom of reconstructed frame.
           Otherwise, it specifies the first horizontal
           luminance sample of a vertical pillarbox bar area at the right side of the reconstructed frame.
  */
  @property uint barData2()
  {
    return (cast(GstVideoBarMeta*)this._cPtr).barData2;
  }

  /**
      Set `barData2` field.
      Params:
        propval = If @is_letterbox is true, then the value specifies the
             first line of a horizontal letterbox bar area at bottom of reconstructed frame.
             Otherwise, it specifies the first horizontal
             luminance sample of a vertical pillarbox bar area at the right side of the reconstructed frame.
  */
  @property void barData2(uint propval)
  {
    (cast(GstVideoBarMeta*)this._cPtr).barData2 = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_bar_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval, No.Take) : null;
    return _retval;
  }
}
