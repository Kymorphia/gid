/// Module for [VideoSEIUserDataUnregisteredMeta] class
module gid.gstvideo1.video_seiuser_data_unregistered_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/**
    H.264 H.265 metadata from SEI User Data Unregistered messages
*/
class VideoSEIUserDataUnregisteredMeta : StructWrap!(GstVideoSEIUserDataUnregisteredMeta)
{
  /**
      Create a `video_seiuser_data_unregistered_meta.VideoSEIUserDataUnregisteredMeta` wrap type.
      Params:
        uuid = User Data Unregistered UUID
  */
  this(ubyte[16] uuid = (ubyte[16]).init) nothrow
  {
    this.uuid = uuid;
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
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstVideoSEIUserDataUnregisteredMeta*)this._cPtr).meta, this);
  }

  /**
      Get `uuid` field.
      Returns: User Data Unregistered UUID
  */
  @property ubyte[16] uuid() nothrow
  {
    return *cast(ubyte[16]*)&(cast(GstVideoSEIUserDataUnregisteredMeta*)this._cPtr).uuid;
  }

  /**
      Set `uuid` field.
      Params:
        propval = User Data Unregistered UUID
  */
  @property void uuid(ubyte[16] propval) nothrow
  {
    (cast(GstVideoSEIUserDataUnregisteredMeta*)this._cPtr).uuid = *cast(ubyte[16]*)&propval;
  }

  /**
      Get `data` field.
      Returns: Unparsed data buffer
  */
  @property ubyte[] data() nothrow
  {
    if (!(cast(GstVideoSEIUserDataUnregisteredMeta*)this._cPtr).data)
      return null;

    return (cast(GstVideoSEIUserDataUnregisteredMeta*)this._cPtr).data[0 .. (cast(GstVideoSEIUserDataUnregisteredMeta*)this._cPtr).size].dup;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_sei_user_data_unregistered_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
