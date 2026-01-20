/// Module for [VideoSEIUserDataUnregisteredMeta] class
module gstvideo.video_seiuser_data_unregistered_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    H.264 H.265 metadata from SEI User Data Unregistered messages
*/
class VideoSEIUserDataUnregisteredMeta
{
  GstVideoSEIUserDataUnregisteredMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_seiuser_data_unregistered_meta.VideoSEIUserDataUnregisteredMeta");

    _cInstance = *cast(GstVideoSEIUserDataUnregisteredMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoSEIUserDataUnregisteredMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `size` field.
      Returns: Size of the data buffer
  */
  @property size_t size()
  {
    return (cast(GstVideoSEIUserDataUnregisteredMeta*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = Size of the data buffer
  */
  @property void size(size_t propval)
  {
    (cast(GstVideoSEIUserDataUnregisteredMeta*)this._cPtr).size = propval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_sei_user_data_unregistered_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
