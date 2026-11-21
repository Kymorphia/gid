/// Module for [VideoColorRange] enum namespace
module gid.gstvideo1.video_color_range;

import gid.core.gid;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;
import gid.gstvideo1.video_format_info;

/// Namespace for [VideoColorRange] enum
struct VideoColorRange
{
  alias Enum = gid.gstvideo1.types.VideoColorRange; ///

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
  static void offsets(gid.gstvideo1.types.VideoColorRange range, gid.gstvideo1.video_format_info.VideoFormatInfo info, out int[] offset, out int[] scale) nothrow
  {
    offset.length = 4;
    scale.length = 4;
    gst_video_color_range_offsets(range, info ? cast(const(GstVideoFormatInfo)*)info._cPtr : null, offset.ptr, scale.ptr);
  }
}
