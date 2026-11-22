/// Module for [VideoColorPrimaries] enum namespace
module gid.gstvideo1.video_color_primaries;

import gid.core.utils;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/// Namespace for [VideoColorPrimaries] enum
struct VideoColorPrimaries
{
  alias Enum = gid.gstvideo1.types.VideoColorPrimaries; ///

  /**
      Converts the value to the #GstVideoColorPrimaries
      The colour primaries (ColourPrimaries) value is
      defined by "ISO/IEC 23001-8 Section 7.1 Table 2" and "ITU-T H.273 Table 2".
      "H.264 Table E-3" and "H.265 Table E.3" share the identical values.
  
      Params:
        value = a ITU-T H.273 colour primaries value
      Returns: the matched #GstVideoColorPrimaries
  */
  static gid.gstvideo1.types.VideoColorPrimaries fromIso(uint value) nothrow
  {
    GstVideoColorPrimaries _cretval;
    _cretval = gst_video_color_primaries_from_iso(value);
    gid.gstvideo1.types.VideoColorPrimaries _retval = cast(gid.gstvideo1.types.VideoColorPrimaries)_cretval;
    return _retval;
  }

  /**
      Get information about the chromaticity coordinates of primaries.
  
      Params:
        primaries = a #GstVideoColorPrimaries
      Returns: a #GstVideoColorPrimariesInfo for primaries.
  */
  static gid.gstvideo1.types.VideoColorPrimariesInfo getInfo(gid.gstvideo1.types.VideoColorPrimaries primaries) nothrow
  {
    const(GstVideoColorPrimariesInfo)* _cretval;
    _cretval = gst_video_color_primaries_get_info(primaries);
    gid.gstvideo1.types.VideoColorPrimariesInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gstvideo1.types.VideoColorPrimariesInfo*)_cretval;
    return _retval;
  }

  /**
      Checks whether primaries and other are functionally equivalent
  
      Params:
        primaries = a #GstVideoColorPrimaries
        other = another #GstVideoColorPrimaries
      Returns: TRUE if primaries and other can be considered equivalent.
  */
  static bool isEquivalent(gid.gstvideo1.types.VideoColorPrimaries primaries, gid.gstvideo1.types.VideoColorPrimaries other) nothrow
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
  static uint toIso(gid.gstvideo1.types.VideoColorPrimaries primaries) nothrow
  {
    uint _retval;
    _retval = gst_video_color_primaries_to_iso(primaries);
    return _retval;
  }
}
