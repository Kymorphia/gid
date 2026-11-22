/// Module for [VideoMultiviewMode] enum namespace
module gid.gstvideo1.video_multiview_mode;

import gid.core.utils;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/// Namespace for [VideoMultiviewMode] enum
struct VideoMultiviewMode
{
  alias Enum = gid.gstvideo1.types.VideoMultiviewMode; ///

  /** */
  static gid.gstvideo1.types.VideoMultiviewMode fromCapsString(string capsMviewMode) nothrow
  {
    GstVideoMultiviewMode _cretval;
    const(char)* _capsMviewMode = capsMviewMode.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_video_multiview_mode_from_caps_string(_capsMviewMode);
    gid.gstvideo1.types.VideoMultiviewMode _retval = cast(gid.gstvideo1.types.VideoMultiviewMode)_cretval;
    return _retval;
  }

  /**
      Given a #GstVideoMultiviewMode returns the multiview-mode caps string
      for insertion into a caps structure
  
      Params:
        mviewMode = A #GstVideoMultiviewMode value
      Returns: The caps string representation of the mode, or NULL if invalid.
  */
  static string toCapsString(gid.gstvideo1.types.VideoMultiviewMode mviewMode) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_video_multiview_mode_to_caps_string(mviewMode);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
