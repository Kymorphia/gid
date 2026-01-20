/// Module for [VideoAlignment] struct
module gstvideo.video_alignment;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Extra alignment parameters for the memory of video buffers. This
    structure is usually used to configure the bufferpool if it supports the
    #GST_BUFFER_POOL_OPTION_VIDEO_ALIGNMENT.
*/
struct VideoAlignment
{
  /**
      extra pixels on the top
  */
  uint paddingTop;

  /**
      extra pixels on the bottom
  */
  uint paddingBottom;

  /**
      extra pixels on the left side
  */
  uint paddingLeft;

  /**
      extra pixels on the right side
  */
  uint paddingRight;

  /**
      array with extra alignment requirements for the strides
  */
  uint[4] strideAlign;

  /**
      Set align to its default values with no padding and no alignment.
  */
  void reset()
  {
    gst_video_alignment_reset(cast(GstVideoAlignment*)&this);
  }
}
