/// Module for [VideoAFDMeta] class
module gid.gstvideo1.video_afdmeta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

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
@gidGir("VideoAFDMeta")
class VideoAFDMeta : StructWrap!(GstVideoAFDMeta)
{
  /**
      Create a `video_afdmeta.VideoAFDMeta` wrap type.
      Params:
        field = 0 for progressive or field 1 and 1 for field 2
        spec = #GstVideoAFDSpec that applies to @afd
        afd = #GstVideoAFDValue AFD value
  */
  this(ubyte field = ubyte.init, gid.gstvideo1.types.VideoAFDSpec spec = gid.gstvideo1.types.VideoAFDSpec.init, gid.gstvideo1.types.VideoAFDValue afd = gid.gstvideo1.types.VideoAFDValue.init) nothrow
  {
    this.field = field;
    this.spec = spec;
    this.afd = afd;
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
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstVideoAFDMeta*)this._cPtr).meta, this);
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
  @property gid.gstvideo1.types.VideoAFDSpec spec() nothrow
  {
    return cast(gid.gstvideo1.types.VideoAFDSpec)(cast(GstVideoAFDMeta*)this._cPtr).spec;
  }

  /**
      Set `spec` field.
      Params:
        propval = #GstVideoAFDSpec that applies to @afd
  */
  @property void spec(gid.gstvideo1.types.VideoAFDSpec propval) nothrow
  {
    (cast(GstVideoAFDMeta*)this._cPtr).spec = cast(GstVideoAFDSpec)propval;
  }

  /**
      Get `afd` field.
      Returns: #GstVideoAFDValue AFD value
  */
  @property gid.gstvideo1.types.VideoAFDValue afd() nothrow
  {
    return cast(gid.gstvideo1.types.VideoAFDValue)(cast(GstVideoAFDMeta*)this._cPtr).afd;
  }

  /**
      Set `afd` field.
      Params:
        propval = #GstVideoAFDValue AFD value
  */
  @property void afd(gid.gstvideo1.types.VideoAFDValue propval) nothrow
  {
    (cast(GstVideoAFDMeta*)this._cPtr).afd = cast(GstVideoAFDValue)propval;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_afd_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
