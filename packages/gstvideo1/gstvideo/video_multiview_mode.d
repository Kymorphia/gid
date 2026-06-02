/// Module for [VideoMultiviewMode] enum namespace
module gstvideo.video_multiview_mode;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/// Namespace for [VideoMultiviewMode] enum
struct VideoMultiviewMode
{
  alias Enum = gstvideo.types.VideoMultiviewMode; ///

  /** */
  static gstvideo.types.VideoMultiviewMode fromCapsString(string capsMviewMode) nothrow
  {
    GstVideoMultiviewMode _cretval;
    const(char)* _capsMviewMode = capsMviewMode.toCString(No.Alloc);
    _cretval = gst_video_multiview_mode_from_caps_string(_capsMviewMode);
    gstvideo.types.VideoMultiviewMode _retval = cast(gstvideo.types.VideoMultiviewMode)_cretval;
    return _retval;
  }

  /**
      Given a #GstVideoMultiviewMode returns the multiview-mode caps string
      for insertion into a caps structure
  
      Params:
        mviewMode = A #GstVideoMultiviewMode value
      Returns: The caps string representation of the mode, or NULL if invalid.
  */
  static string toCapsString(gstvideo.types.VideoMultiviewMode mviewMode) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_video_multiview_mode_to_caps_string(mviewMode);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
