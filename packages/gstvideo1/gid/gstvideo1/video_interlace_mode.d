/// Module for [VideoInterlaceMode] enum namespace
module gid.gstvideo1.video_interlace_mode;

import gid.core.utils;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/// Namespace for [VideoInterlaceMode] enum
struct VideoInterlaceMode
{
  alias Enum = gid.gstvideo1.types.VideoInterlaceMode; ///

  /**
      Convert mode to a #GstVideoInterlaceMode
  
      Params:
        mode = a mode
      Returns: the #GstVideoInterlaceMode of mode or
           #GST_VIDEO_INTERLACE_MODE_PROGRESSIVE when mode is not a valid
           string representation for a #GstVideoInterlaceMode.
  */
  static gid.gstvideo1.types.VideoInterlaceMode fromString(string mode) nothrow
  {
    GstVideoInterlaceMode _cretval;
    const(char)* _mode = mode.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_video_interlace_mode_from_string(_mode);
    gid.gstvideo1.types.VideoInterlaceMode _retval = cast(gid.gstvideo1.types.VideoInterlaceMode)_cretval;
    return _retval;
  }

  /**
      Convert mode to its string representation.
  
      Params:
        mode = a #GstVideoInterlaceMode
      Returns: mode as a string.
  */
  static string toString_(gid.gstvideo1.types.VideoInterlaceMode mode) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_video_interlace_mode_to_string(mode);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
