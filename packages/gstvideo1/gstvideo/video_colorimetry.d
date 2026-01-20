/// Module for [VideoColorimetry] struct
module gstvideo.video_colorimetry;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Structure describing the color info.
*/
struct VideoColorimetry
{
  /**
      the color range. This is the valid range for the samples.
              It is used to convert the samples to Y'PbPr values.
  */
  VideoColorRange range;

  /**
      the color matrix. Used to convert between Y'PbPr and
               non-linear RGB (R'G'B')
  */
  VideoColorMatrix matrix;

  /**
      the transfer function. used to convert between R'G'B' and RGB
  */
  VideoTransferFunction transfer;

  /**
      color primaries. used to convert between R'G'B' and CIE XYZ
  */
  VideoColorPrimaries primaries;

  /**
      Parse the colorimetry string and update cinfo with the parsed
      values.
  
      Params:
        color = a colorimetry string
      Returns: true if color points to valid colorimetry info.
  */
  bool fromString(string color)
  {
    bool _retval;
    const(char)* _color = color.toCString(No.Alloc);
    _retval = cast(bool)gst_video_colorimetry_from_string(cast(GstVideoColorimetry*)&this, _color);
    return _retval;
  }

  /**
      Compare the 2 colorimetry sets for equality
  
      Params:
        other = another #GstVideoColorimetry
      Returns: true if cinfo and other are equal.
  */
  bool isEqual(gstvideo.video_colorimetry.VideoColorimetry other)
  {
    bool _retval;
    _retval = cast(bool)gst_video_colorimetry_is_equal(cast(const(GstVideoColorimetry)*)&this, cast(const(GstVideoColorimetry)*)&other);
    return _retval;
  }

  /**
      Compare the 2 colorimetry sets for functionally equality
  
      Params:
        bitdepth = bitdepth of a format associated with cinfo
        other = another #GstVideoColorimetry
        otherBitdepth = bitdepth of a format associated with other
      Returns: true if cinfo and other are equivalent.
  */
  bool isEquivalent(uint bitdepth, gstvideo.video_colorimetry.VideoColorimetry other, uint otherBitdepth)
  {
    bool _retval;
    _retval = cast(bool)gst_video_colorimetry_is_equivalent(cast(const(GstVideoColorimetry)*)&this, bitdepth, cast(const(GstVideoColorimetry)*)&other, otherBitdepth);
    return _retval;
  }

  /**
      Check if the colorimetry information in info matches that of the
      string color.
  
      Params:
        color = a colorimetry string
      Returns: true if color conveys the same colorimetry info as the color
        information in info.
  */
  bool matches(string color)
  {
    bool _retval;
    const(char)* _color = color.toCString(No.Alloc);
    _retval = cast(bool)gst_video_colorimetry_matches(cast(const(GstVideoColorimetry)*)&this, _color);
    return _retval;
  }

  /**
      Make a string representation of cinfo.
      Returns: a string representation of cinfo
        or null if all the entries of cinfo are unknown values.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gst_video_colorimetry_to_string(cast(const(GstVideoColorimetry)*)&this);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
