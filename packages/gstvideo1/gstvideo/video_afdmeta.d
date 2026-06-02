/// Module for [VideoAFDMeta] class
module gstvideo.video_afdmeta;

public import gid.basictypes;
import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Active Format Description (AFD)
    
    For details, see Table 6.14 Active Format in:
    
    ATSC Digital Television Standard:
    Part 4 – MPEG-2 Video System Characteristics
    
    https://www.atsc.org/wp-content/uploads/2015/03/a_53-Part-4-2009.pdf
    
    and Active Format Description in Complete list of AFD codes
    
    https://en.wikipedia.org/wiki/Active_Format_Description#Complete_list_of_AFD_codes
    
    and SMPTE ST2016-1
*/
class VideoAFDMeta
{
  GstVideoAFDMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstVideoAFDMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoAFDMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `field` field.
      Returns: 0 for progressive or field 1 and 1 for field 2
  */
  @property ubyte field() nothrow
  {
    return (cast(GstVideoAFDMeta*)this._cPtr).field;
  }

  /**
      Set `field` field.
      Params:
        propval = 0 for progressive or field 1 and 1 for field 2
  */
  @property void field(ubyte propval) nothrow
  {
    (cast(GstVideoAFDMeta*)this._cPtr).field = propval;
  }

  /**
      Get `spec` field.
      Returns: #GstVideoAFDSpec that applies to @afd
  */
  @property gstvideo.types.VideoAFDSpec spec() nothrow
  {
    return cast(gstvideo.types.VideoAFDSpec)(cast(GstVideoAFDMeta*)this._cPtr).spec;
  }

  /**
      Set `spec` field.
      Params:
        propval = #GstVideoAFDSpec that applies to @afd
  */
  @property void spec(gstvideo.types.VideoAFDSpec propval) nothrow
  {
    (cast(GstVideoAFDMeta*)this._cPtr).spec = cast(GstVideoAFDSpec)propval;
  }

  /**
      Get `afd` field.
      Returns: #GstVideoAFDValue AFD value
  */
  @property gstvideo.types.VideoAFDValue afd() nothrow
  {
    return cast(gstvideo.types.VideoAFDValue)(cast(GstVideoAFDMeta*)this._cPtr).afd;
  }

  /**
      Set `afd` field.
      Params:
        propval = #GstVideoAFDValue AFD value
  */
  @property void afd(gstvideo.types.VideoAFDValue propval) nothrow
  {
    (cast(GstVideoAFDMeta*)this._cPtr).afd = cast(GstVideoAFDValue)propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_afd_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
