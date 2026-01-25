/// Module for [VideoConverter] class
module gstvideo.video_converter;

import gid.gid;
import gst.structure;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_frame;
import gstvideo.video_info;

/** */
class VideoConverter
{
  GstVideoConverter* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_converter.VideoConverter");

    _cInstancePtr = cast(GstVideoConverter*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Convert the pixels of src into dest using convert.
      
      If #GST_VIDEO_CONVERTER_OPT_ASYNC_TASKS is true then this function will
      return immediately and needs to be followed by a call to
      [gstvideo.video_converter.VideoConverter.frameFinish].
  
      Params:
        src = a #GstVideoFrame
        dest = a #GstVideoFrame
  */
  void frame(gstvideo.video_frame.VideoFrame src, gstvideo.video_frame.VideoFrame dest)
  {
    gst_video_converter_frame(cast(GstVideoConverter*)this._cPtr, src ? cast(const(GstVideoFrame)*)src._cPtr : null, dest ? cast(GstVideoFrame*)dest._cPtr : null);
  }

  /**
      Wait for a previous async conversion performed using
      [gstvideo.video_converter.VideoConverter.frame] to complete.
  */
  void frameFinish()
  {
    gst_video_converter_frame_finish(cast(GstVideoConverter*)this._cPtr);
  }

  /**
      Get the current configuration of convert.
      Returns: a #GstStructure that remains valid for as long as convert is valid
          or until [gstvideo.video_converter.VideoConverter.setConfig] is called.
  */
  gst.structure.Structure getConfig()
  {
    const(GstStructure)* _cretval;
    _cretval = gst_video_converter_get_config(cast(GstVideoConverter*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieve the input format of convert.
      Returns: a #GstVideoInfo
  */
  gstvideo.video_info.VideoInfo getInInfo()
  {
    const(GstVideoInfo)* _cretval;
    _cretval = gst_video_converter_get_in_info(cast(GstVideoConverter*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_info.VideoInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieve the output format of convert.
      Returns: a #GstVideoInfo
  */
  gstvideo.video_info.VideoInfo getOutInfo()
  {
    const(GstVideoInfo)* _cretval;
    _cretval = gst_video_converter_get_out_info(cast(GstVideoConverter*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_info.VideoInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Set config as extra configuration for convert.
      
      If the parameters in config can not be set exactly, this function returns
      false and will try to update as much state as possible. The new state can
      then be retrieved and refined with [gstvideo.video_converter.VideoConverter.getConfig].
      
      Look at the `GST_VIDEO_CONVERTER_OPT_*` fields to check valid configuration
      option and values.
  
      Params:
        config = a #GstStructure
      Returns: true when config could be set.
  */
  bool setConfig(gst.structure.Structure config)
  {
    bool _retval;
    _retval = cast(bool)gst_video_converter_set_config(cast(GstVideoConverter*)this._cPtr, config ? cast(GstStructure*)config._cPtr(Yes.Dup) : null);
    return _retval;
  }
}
