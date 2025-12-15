/// Module for [VideoColorPrimaries] enum namespace
module gstvideo.video_color_primaries;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/// Namespace for [VideoColorPrimaries] enum
struct VideoColorPrimaries
{
  alias Enum = gstvideo.types.VideoColorPrimaries; ///

  /**
      Converts the value to the #GstVideoColorPrimaries
      The colour primaries (ColourPrimaries) value is
      defined by "ISO/IEC 23001-8 Section 7.1 Table 2" and "ITU-T H.273 Table 2".
      "H.264 Table E-3" and "H.265 Table E.3" share the identical values.
  
      Params:
        value = a ITU-T H.273 colour primaries value
      Returns: the matched #GstVideoColorPrimaries
  */
  static gstvideo.types.VideoColorPrimaries fromIso(uint value)
  {
    GstVideoColorPrimaries _cretval;
    _cretval = gst_video_color_primaries_from_iso(value);
    gstvideo.types.VideoColorPrimaries _retval = cast(gstvideo.types.VideoColorPrimaries)_cretval;
    return _retval;
  }

  /**
      Get information about the chromaticity coordinates of primaries.
  
      Params:
        primaries = a #GstVideoColorPrimaries
      Returns: a #GstVideoColorPrimariesInfo for primaries.
  */
  static gstvideo.types.VideoColorPrimariesInfo getInfo(gstvideo.types.VideoColorPrimaries primaries)
  {
    const(GstVideoColorPrimariesInfo)* _cretval;
    _cretval = gst_video_color_primaries_get_info(primaries);
    gstvideo.types.VideoColorPrimariesInfo _retval;
    if (_cretval)
      _retval = *cast(gstvideo.types.VideoColorPrimariesInfo*)_cretval;
    return _retval;
  }

  /**
      Checks whether primaries and other are functionally equivalent
  
      Params:
        primaries = a #GstVideoColorPrimaries
        other = another #GstVideoColorPrimaries
      Returns: TRUE if primaries and other can be considered equivalent.
  */
  static bool isEquivalent(gstvideo.types.VideoColorPrimaries primaries, gstvideo.types.VideoColorPrimaries other)
  {
    bool _retval;
    _retval = cast(bool)gst_video_color_primaries_is_equivalent(primaries, other);
    return _retval;
  }

  /**
      Converts #GstVideoColorPrimaries to the "colour primaries" (ColourPrimaries)
      value defined by "ISO/IEC 23001-8 Section 7.1 Table 2"
      and "ITU-T H.273 Table 2".
      "H.264 Table E-3" and "H.265 Table E.3" share the identical values.
  
      Params:
        primaries = a #GstVideoColorPrimaries
      Returns: The value of ISO/IEC 23001-8 colour primaries.
  */
  static uint toIso(gstvideo.types.VideoColorPrimaries primaries)
  {
    uint _retval;
    _retval = gst_video_color_primaries_to_iso(primaries);
    return _retval;
  }
}
