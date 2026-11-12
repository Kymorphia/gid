/// Module for [VideoFrame] class
module gstvideo.video_frame;

public import gid.basictypes;
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
class VideoFrame : StructWrap!(GstVideoFrame)
{
  /**
      Create a `video_frame.VideoFrame` wrap type.
      Params:
        flags = #GstVideoFrameFlags for the frame
        buffer = the mapped buffer
        id = id of the mapped frame. the id can for example be used to
            identify the frame in case of multiview video.
  */
  this(gstvideo.types.VideoFrameFlags flags = gstvideo.types.VideoFrameFlags.init, gst.buffer.Buffer buffer = gst.buffer.Buffer.init, int id = int.init) nothrow
  {
    this.flags = flags;
    this.buffer = buffer;
    this.id = id;
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

  /** Scope of a structure mapped by [gstvideo.video_frame.VideoFrame.map] (see [gid.wrap.MapScope]) */
  alias MapScope = gid.wrap.MapScope!(gstvideo.video_frame.VideoFrame, gst_video_frame_unmap, gst.buffer.Buffer);

  /**
      Get `info` field.
      Returns: the #GstVideoInfo
  */
  @property gstvideo.video_info.VideoInfo info() nothrow
  {
    return cToD!(gstvideo.video_info.VideoInfo)(cast(void*)&(cast(GstVideoFrame*)this._cPtr).info);
  }

  /**
      Get `flags` field.
      Returns: #GstVideoFrameFlags for the frame
  */
  @property gstvideo.types.VideoFrameFlags flags() nothrow
  {
    return cast(gstvideo.types.VideoFrameFlags)(cast(GstVideoFrame*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #GstVideoFrameFlags for the frame
  */
  @property void flags(gstvideo.types.VideoFrameFlags propval) nothrow
  {
    (cast(GstVideoFrame*)this._cPtr).flags = cast(GstVideoFrameFlags)propval;
  }

  private gst.buffer.Buffer _bufferRef; // Keeps borrowed field value alive

  /**
      Get `buffer` field.
      Returns: the mapped buffer
  */
  @property gst.buffer.Buffer buffer() nothrow
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoFrame*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = the mapped buffer
  */
  @property void buffer(gst.buffer.Buffer propval) nothrow
  {
    if (_refuseBorrowedStore("buffer"))
      return;

    _bufferRef = propval;
    (cast(GstVideoFrame*)this._cPtr).buffer = propval ? cast(GstBuffer*)propval._cPtr(No.Dup) : null;
  }

  /**
      Get `id` field.
      Returns: id of the mapped frame. the id can for example be used to
          identify the frame in case of multiview video.
  */
  @property int id() nothrow
  {
    return (cast(GstVideoFrame*)this._cPtr).id;
  }

  /**
      Set `id` field.
      Params:
        propval = id of the mapped frame. the id can for example be used to
            identify the frame in case of multiview video.
  */
  @property void id(int propval) nothrow
  {
    (cast(GstVideoFrame*)this._cPtr).id = propval;
  }

  /**
  Get the data of a plane of a mapped video frame.
  The returned slice references the mapped memory of the frame and is only valid while the frame is mapped (see
  [gstvideo.video_frame.VideoFrame.map]). Writing to it modifies the frame if it was mapped for writing.
  For formats which are not tiled the length is the plane stride times the plane height, otherwise it extends to
  the end of the mapped memory. Use the stride of the plane from [gstvideo.video_frame.VideoFrame.info] to access
  rows.
  Params:
  plane = the plane index (less than the number of planes of the video format)
  Returns: the plane data or null if the frame is not mapped or plane is out of range
  */
  ubyte[] planeData(uint plane) nothrow
  {
    auto frame = cast(GstVideoFrame*)this._cPtr;
    auto finfo = frame.info.finfo;

    if (!finfo || plane >= finfo.nPlanes || plane >= frame.data.length || !frame.data[plane])
      return null;

    auto data = cast(ubyte*)frame.data[plane];
    auto mapIndex = frame.meta ? plane : 0; // Each plane has its own memory map when mapped with a VideoMeta
    auto mapInfo = &frame.map[mapIndex];

    if (!mapInfo.data || data < mapInfo.data || data >= mapInfo.data + mapInfo.size)
      return null;

    size_t size = mapInfo.data + mapInfo.size - data; // Remaining mapped bytes from the plane start
    auto stride = frame.info.stride[plane];

    if (!(finfo.flags & GstVideoFormatFlags.Tiled) && stride > 0)
    {
      int height = frame.info.height;

      if (frame.info.interlaceMode == GstVideoInterlaceMode.Alternate) // One field per buffer
        height = (height + 1) / 2;

      foreach (comp; 0 .. finfo.nComponents) // Scale the height by the vertical subsampling of a component in the plane
      {
        if (finfo.plane[comp] == plane)
        {
          height = -((-height) >> finfo.hSub[comp]);
          break;
        }
      }

      if (height >= 0 && cast(size_t)stride * height < size)
        size = cast(size_t)stride * height;
    }

    return data[0 .. size];
  }

  /**
      Copy the contents from src to dest.
      
      Note: Since: 1.18, dest dimensions are allowed to be
      smaller than src dimensions.
  
      Params:
        src = a #GstVideoFrame
      Returns: TRUE if the contents could be copied.
  */
  bool copy(gstvideo.video_frame.VideoFrame src) nothrow
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
  bool copyPlane(gstvideo.video_frame.VideoFrame src, uint plane) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_video_frame_copy_plane(cast(GstVideoFrame*)this._cPtr, src ? cast(const(GstVideoFrame)*)src._cPtr : null, plane);
    return _retval;
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
        frame = pointer to #GstVideoFrame (mapped structure scope, unmapped by its `unmap()` or when it goes out of scope, use a local variable: `VideoFrame.MapScope frame;`)
        info = a #GstVideoInfo
        buffer = the buffer to map
        flags = #GstMapFlags
      Returns: true on success.
  */
  static bool map(out gstvideo.video_frame.VideoFrame.MapScope frame, gstvideo.video_info.VideoInfo info, gst.buffer.Buffer buffer, gst.types.MapFlags flags) nothrow
  {
    bool _retval;
    auto _frame = cast(GstVideoFrame*)frame._begin(buffer);
    _retval = cast(bool)gst_video_frame_map(_frame, info ? cast(const(GstVideoInfo)*)info._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, flags);
    frame._mapped = _retval;
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
        frame = pointer to #GstVideoFrame (mapped structure scope, unmapped by its `unmap()` or when it goes out of scope, use a local variable: `VideoFrame.MapScope frame;`)
        info = a #GstVideoInfo
        buffer = the buffer to map
        id = the frame id to map
        flags = #GstMapFlags
      Returns: true on success.
  */
  static bool mapId(out gstvideo.video_frame.VideoFrame.MapScope frame, gstvideo.video_info.VideoInfo info, gst.buffer.Buffer buffer, int id, gst.types.MapFlags flags) nothrow
  {
    bool _retval;
    auto _frame = cast(GstVideoFrame*)frame._begin(buffer);
    _retval = cast(bool)gst_video_frame_map_id(_frame, info ? cast(const(GstVideoInfo)*)info._cPtr(No.Dup) : null, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, id, flags);
    frame._mapped = _retval;
    return _retval;
  }
}
