/// Module for [VideoFrame] class
module gstvideo.video_frame;

import gid.gid;
import gst.buffer;
import gst.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_info;

/**
    A video frame obtained from [gstvideo.video_frame.VideoFrame.map]
*/
class VideoFrame
{
  GstVideoFrame cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_frame.VideoFrame");

    cInstance = *cast(GstVideoFrame*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `info` field.
      Returns: the #GstVideoInfo
  */
  @property gstvideo.video_info.VideoInfo info()
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)&(cast(GstVideoFrame*)this._cPtr).info);
  }

  /**
      Get `flags` field.
      Returns: #GstVideoFrameFlags for the frame
  */
  @property gstvideo.types.VideoFrameFlags flags()
  {
    return cast(gstvideo.types.VideoFrameFlags)(cast(GstVideoFrame*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #GstVideoFrameFlags for the frame
  */
  @property void flags(gstvideo.types.VideoFrameFlags propval)
  {
    (cast(GstVideoFrame*)this._cPtr).flags = cast(GstVideoFrameFlags)propval;
  }

  /**
      Get `buffer` field.
      Returns: the mapped buffer
  */
  @property gst.buffer.Buffer buffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoFrame*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = the mapped buffer
  */
  @property void buffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoFrame*)this._cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstVideoFrame*)this._cPtr).buffer);
  }

  /**
      Get `id` field.
      Returns: id of the mapped frame. the id can for example be used to
        identify the frame in case of multiview video.
  */
  @property int id()
  {
    return (cast(GstVideoFrame*)this._cPtr).id;
  }

  /**
      Set `id` field.
      Params:
        propval = id of the mapped frame. the id can for example be used to
          identify the frame in case of multiview video.
  */
  @property void id(int propval)
  {
    (cast(GstVideoFrame*)this._cPtr).id = propval;
  }

  /**
      Copy the contents from src to dest.
      
      Note: Since: 1.18, dest dimensions are allowed to be
      smaller than src dimensions.
  
      Params:
        src = a #GstVideoFrame
      Returns: TRUE if the contents could be copied.
  */
  bool copy(gstvideo.video_frame.VideoFrame src)
  {
    bool _retval;
    _retval = cast(bool)gst_video_frame_copy(cast(GstVideoFrame*)this._cPtr, src ? cast(const(GstVideoFrame)*)src._cPtr : null);
    return _retval;
  }

  /**
      Copy the plane with index plane from src to dest.
      
      Note: Since: 1.18, dest dimensions are allowed to be
      smaller than src dimensions.
  
      Params:
        src = a #GstVideoFrame
        plane = a plane
      Returns: TRUE if the contents could be copied.
  */
  bool copyPlane(gstvideo.video_frame.VideoFrame src, uint plane)
  {
    bool _retval;
    _retval = cast(bool)gst_video_frame_copy_plane(cast(GstVideoFrame*)this._cPtr, src ? cast(const(GstVideoFrame)*)src._cPtr : null, plane);
    return _retval;
  }

  /**
      Unmap the memory previously mapped with gst_video_frame_map.
  */
  void unmap()
  {
    gst_video_frame_unmap(cast(GstVideoFrame*)this._cPtr);
  }

  /**
      Use info and buffer to fill in the values of frame. frame is usually
      allocated on the stack, and you will pass the address to the #GstVideoFrame
      structure allocated on the stack; [gstvideo.video_frame.VideoFrame.map] will then fill in
      the structures with the various video-specific information you need to access
      the pixels of the video buffer. You can then use accessor macros such as
      GST_VIDEO_FRAME_COMP_DATA(), GST_VIDEO_FRAME_PLANE_DATA(),
      GST_VIDEO_FRAME_COMP_STRIDE(), GST_VIDEO_FRAME_PLANE_STRIDE() etc.
      to get to the pixels.
      
      ```c
        GstVideoFrame vframe;
        ...
        // set RGB pixels to black one at a time
        if (gst_video_frame_map (&vframe, video_info, video_buffer, GST_MAP_WRITE)) {
          guint8 *pixels = GST_VIDEO_FRAME_PLANE_DATA (vframe, 0);
          guint stride = GST_VIDEO_FRAME_PLANE_STRIDE (vframe, 0);
          guint pixel_stride = GST_VIDEO_FRAME_COMP_PSTRIDE (vframe, 0);
      
          for (h = 0; h < height; ++h) {
            for (w = 0; w < width; ++w) {
              guint8 *pixel = pixels + h * stride + w * pixel_stride;
      
              memset (pixel, 0, pixel_stride);
            }
          }
      
          gst_video_frame_unmap (&vframe);
        }
        ...
      ```
      
      All video planes of buffer will be mapped and the pointers will be set in
      frame->data.
      
      The purpose of this function is to make it easy for you to get to the video
      pixels in a generic way, without you having to worry too much about details
      such as whether the video data is allocated in one contiguous memory chunk
      or multiple memory chunks (e.g. one for each plane); or if custom strides
      and custom plane offsets are used or not (as signalled by GstVideoMeta on
      each buffer). This function will just fill the #GstVideoFrame structure
      with the right values and if you use the accessor macros everything will
      just work and you can access the data easily. It also maps the underlying
      memory chunks for you.
  
      Params:
        frame = pointer to #GstVideoFrame
        info = a #GstVideoInfo
        buffer = the buffer to map
        flags = #GstMapFlags
      Returns: true on success.
  */
  static bool map(out gstvideo.video_frame.VideoFrame frame, gstvideo.video_info.VideoInfo info, gst.buffer.Buffer buffer, gst.types.MapFlags flags)
  {
    bool _retval;
    GstVideoFrame _frame;
    _retval = cast(bool)gst_video_frame_map(&_frame, info ? cast(const(GstVideoInfo)*)info._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, flags);
    frame = new gstvideo.video_frame.VideoFrame(cast(void*)&_frame, No.Take);
    return _retval;
  }

  /**
      Use info and buffer to fill in the values of frame with the video frame
      information of frame id.
      
      When id is -1, the default frame is mapped. When id != -1, this function
      will return false when there is no GstVideoMeta with that id.
      
      All video planes of buffer will be mapped and the pointers will be set in
      frame->data.
  
      Params:
        frame = pointer to #GstVideoFrame
        info = a #GstVideoInfo
        buffer = the buffer to map
        id = the frame id to map
        flags = #GstMapFlags
      Returns: true on success.
  */
  static bool mapId(out gstvideo.video_frame.VideoFrame frame, gstvideo.video_info.VideoInfo info, gst.buffer.Buffer buffer, int id, gst.types.MapFlags flags)
  {
    bool _retval;
    GstVideoFrame _frame;
    _retval = cast(bool)gst_video_frame_map_id(&_frame, info ? cast(const(GstVideoInfo)*)info._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, id, flags);
    frame = new gstvideo.video_frame.VideoFrame(cast(void*)&_frame, No.Take);
    return _retval;
  }
}
