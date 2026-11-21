/// Module for [VideoAlignment] struct
module gid.gstvideo1.video_alignment;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

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
  void reset() nothrow
  {
    gst_video_alignment_reset(cast(GstVideoAlignment*)&this);
  }
}
