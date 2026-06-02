/// Module for [VideoInterlaceMode] enum namespace
module gstvideo.video_interlace_mode;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/// Namespace for [VideoInterlaceMode] enum
struct VideoInterlaceMode
{
  alias Enum = gstvideo.types.VideoInterlaceMode; ///

  /**
      Convert mode to a #GstVideoInterlaceMode
  
      Params:
        mode = a mode
      Returns: the #GstVideoInterlaceMode of mode or
           #GST_VIDEO_INTERLACE_MODE_PROGRESSIVE when mode is not a valid
           string representation for a #GstVideoInterlaceMode.
  */
  static gstvideo.types.VideoInterlaceMode fromString(string mode) nothrow
  {
    GstVideoInterlaceMode _cretval;
    const(char)* _mode = mode.toCString(No.Alloc);
    _cretval = gst_video_interlace_mode_from_string(_mode);
    gstvideo.types.VideoInterlaceMode _retval = cast(gstvideo.types.VideoInterlaceMode)_cretval;
    return _retval;
  }

  /**
      Convert mode to its string representation.
  
      Params:
        mode = a #GstVideoInterlaceMode
      Returns: mode as a string.
  */
  static string toString_(gstvideo.types.VideoInterlaceMode mode) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_video_interlace_mode_to_string(mode);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
