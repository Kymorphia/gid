/// Module for [VideoConverter] class
module gid.gstvideo1.video_converter;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gst1.buffer;
import gid.gst1.structure;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_frame;
import gid.gstvideo1.video_info;

/** */
class VideoConverter : OpaqueWrap!(GstVideoConverter*, void, void)
{

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
      Convert the pixels of src into dest using convert.
      
      If #GST_VIDEO_CONVERTER_OPT_ASYNC_TASKS is true then this function will
      return immediately and needs to be followed by a call to
      [gid.gstvideo1.video_converter.VideoConverter.frameFinish].
  
      Params:
        src = a #GstVideoFrame
        dest = a #GstVideoFrame
  */
  void frame(gid.gstvideo1.video_frame.VideoFrame src, gid.gstvideo1.video_frame.VideoFrame dest) nothrow
  {
    gst_video_converter_frame(cast(GstVideoConverter*)this._cPtr, src ? cast(const(GstVideoFrame)*)src._cPtr : null, dest ? cast(GstVideoFrame*)dest._cPtr : null);
  }

  /**
      Wait for a previous async conversion performed using
      [gid.gstvideo1.video_converter.VideoConverter.frame] to complete.
  */
  void frameFinish() nothrow
  {
    gst_video_converter_frame_finish(cast(GstVideoConverter*)this._cPtr);
  }

  /**
      Get the current configuration of convert.
      Returns: a #GstStructure that remains valid for as long as convert is valid
          or until [gid.gstvideo1.video_converter.VideoConverter.setConfig] is called.
  */
  gid.gst1.structure.Structure getConfig() nothrow
  {
    const(GstStructure)* _cretval;
    _cretval = gst_video_converter_get_config(cast(GstVideoConverter*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieve the input format of convert.
      Returns: a #GstVideoInfo
  */
  gid.gstvideo1.video_info.VideoInfo getInInfo() nothrow
  {
    const(GstVideoInfo)* _cretval;
    _cretval = gst_video_converter_get_in_info(cast(GstVideoConverter*)this._cPtr);
    auto _retval = _cretval ? new gid.gstvideo1.video_info.VideoInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieve the output format of convert.
      Returns: a #GstVideoInfo
  */
  gid.gstvideo1.video_info.VideoInfo getOutInfo() nothrow
  {
    const(GstVideoInfo)* _cretval;
    _cretval = gst_video_converter_get_out_info(cast(GstVideoConverter*)this._cPtr);
    auto _retval = _cretval ? new gid.gstvideo1.video_info.VideoInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Set config as extra configuration for convert.
      
      If the parameters in config can not be set exactly, this function returns
      false and will try to update as much state as possible. The new state can
      then be retrieved and refined with [gid.gstvideo1.video_converter.VideoConverter.getConfig].
      
      Look at the `GST_VIDEO_CONVERTER_OPT_*` fields to check valid configuration
      option and values.
  
      Params:
        config = a #GstStructure
      Returns: true when config could be set.
  */
  bool setConfig(gid.gst1.structure.Structure config) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_converter_set_config(cast(GstVideoConverter*)this._cPtr, config ? cast(GstStructure*)config._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Transform the GstMeta of src into dest using convert.
  
      Params:
        src = a #GstBuffer
        dest = a writable #GstBuffer
      Returns: TRUE if any meta was copied
  */
  bool transformMetas(gid.gst1.buffer.Buffer src, gid.gst1.buffer.Buffer dest) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_converter_transform_metas(cast(GstVideoConverter*)this._cPtr, src ? cast(GstBuffer*)src._cPtr(No.Dup) : null, dest ? cast(GstBuffer*)dest._cPtr(No.Dup) : null);
    return _retval;
  }
}
