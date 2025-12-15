/// Module for [VideoColorimetry] class
module gstvideo.video_colorimetry;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Structure describing the color info.
*/
class VideoColorimetry
{
  GstVideoColorimetry cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_colorimetry.VideoColorimetry");

    cInstance = *cast(GstVideoColorimetry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `range` field.
      Returns: the color range. This is the valid range for the samples.
              It is used to convert the samples to Y'PbPr values.
  */
  @property gstvideo.types.VideoColorRange range()
  {
    return cast(gstvideo.types.VideoColorRange)(cast(GstVideoColorimetry*)this._cPtr).range;
  }

  /**
      Set `range` field.
      Params:
        propval = the color range. This is the valid range for the samples.
                It is used to convert the samples to Y'PbPr values.
  */
  @property void range(gstvideo.types.VideoColorRange propval)
  {
    (cast(GstVideoColorimetry*)this._cPtr).range = cast(GstVideoColorRange)propval;
  }

  /**
      Get `matrix` field.
      Returns: the color matrix. Used to convert between Y'PbPr and
               non-linear RGB (R'G'B')
  */
  @property gstvideo.types.VideoColorMatrix matrix()
  {
    return cast(gstvideo.types.VideoColorMatrix)(cast(GstVideoColorimetry*)this._cPtr).matrix;
  }

  /**
      Set `matrix` field.
      Params:
        propval = the color matrix. Used to convert between Y'PbPr and
                 non-linear RGB (R'G'B')
  */
  @property void matrix(gstvideo.types.VideoColorMatrix propval)
  {
    (cast(GstVideoColorimetry*)this._cPtr).matrix = cast(GstVideoColorMatrix)propval;
  }

  /**
      Get `transfer` field.
      Returns: the transfer function. used to convert between R'G'B' and RGB
  */
  @property gstvideo.types.VideoTransferFunction transfer()
  {
    return cast(gstvideo.types.VideoTransferFunction)(cast(GstVideoColorimetry*)this._cPtr).transfer;
  }

  /**
      Set `transfer` field.
      Params:
        propval = the transfer function. used to convert between R'G'B' and RGB
  */
  @property void transfer(gstvideo.types.VideoTransferFunction propval)
  {
    (cast(GstVideoColorimetry*)this._cPtr).transfer = cast(GstVideoTransferFunction)propval;
  }

  /**
      Get `primaries` field.
      Returns: color primaries. used to convert between R'G'B' and CIE XYZ
  */
  @property gstvideo.types.VideoColorPrimaries primaries()
  {
    return cast(gstvideo.types.VideoColorPrimaries)(cast(GstVideoColorimetry*)this._cPtr).primaries;
  }

  /**
      Set `primaries` field.
      Params:
        propval = color primaries. used to convert between R'G'B' and CIE XYZ
  */
  @property void primaries(gstvideo.types.VideoColorPrimaries propval)
  {
    (cast(GstVideoColorimetry*)this._cPtr).primaries = cast(GstVideoColorPrimaries)propval;
  }

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
    _retval = cast(bool)gst_video_colorimetry_from_string(cast(GstVideoColorimetry*)this._cPtr, _color);
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
    _retval = cast(bool)gst_video_colorimetry_is_equal(cast(const(GstVideoColorimetry)*)this._cPtr, other ? cast(const(GstVideoColorimetry)*)other._cPtr : null);
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
    _retval = cast(bool)gst_video_colorimetry_is_equivalent(cast(const(GstVideoColorimetry)*)this._cPtr, bitdepth, other ? cast(const(GstVideoColorimetry)*)other._cPtr : null, otherBitdepth);
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
    _retval = cast(bool)gst_video_colorimetry_matches(cast(const(GstVideoColorimetry)*)this._cPtr, _color);
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
    _cretval = gst_video_colorimetry_to_string(cast(const(GstVideoColorimetry)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
