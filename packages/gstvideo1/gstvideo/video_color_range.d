/// Module for [VideoColorRange] enum namespace
module gstvideo.video_color_range;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_format_info;

/// Namespace for [VideoColorRange] enum
struct VideoColorRange
{
  alias Enum = gstvideo.types.VideoColorRange; ///

  /**
      Compute the offset and scale values for each component of info. For each
      component, (c[i] - offset[i]) / scale[i] will scale the component c[i] to the
      range [0.0 .. 1.0].
      
      The reverse operation (c[i] * scale[i]) + offset[i] can be used to convert
      the component values in range [0.0 .. 1.0] back to their representation in
      info and range.
  
      Params:
        range = a #GstVideoColorRange
        info = a #GstVideoFormatInfo
        offset = output offsets
        scale = output scale
  */
  static void offsets(gstvideo.types.VideoColorRange range, gstvideo.video_format_info.VideoFormatInfo info, ref int[] offset, ref int[] scale) nothrow
  {
    gst_video_color_range_offsets(range, info ? cast(const(GstVideoFormatInfo)*)info._cPtr : null, offset.ptr, scale.ptr);
  }
}
