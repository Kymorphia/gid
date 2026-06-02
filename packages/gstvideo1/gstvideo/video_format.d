/// Module for [VideoFormat] enum namespace
module gstvideo.video_format;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_format_info;

/// Namespace for [VideoFormat] enum
struct VideoFormat
{
  alias Enum = gstvideo.types.VideoFormat; ///

  /**
      Converts a FOURCC value into the corresponding #GstVideoFormat.
      If the FOURCC cannot be represented by #GstVideoFormat,
      #GST_VIDEO_FORMAT_UNKNOWN is returned.
  
      Params:
        fourcc = a FOURCC value representing raw YUV video
      Returns: the #GstVideoFormat describing the FOURCC value
  */
  static gstvideo.types.VideoFormat fromFourcc(uint fourcc) nothrow
  {
    GstVideoFormat _cretval;
    _cretval = gst_video_format_from_fourcc(fourcc);
    gstvideo.types.VideoFormat _retval = cast(gstvideo.types.VideoFormat)_cretval;
    return _retval;
  }

  /**
      Find the #GstVideoFormat for the given parameters.
  
      Params:
        depth = the amount of bits used for a pixel
        bpp = the amount of bits used to store a pixel. This value is bigger than
            depth
        endianness = the endianness of the masks, #G_LITTLE_ENDIAN or #G_BIG_ENDIAN
        redMask = the red mask
        greenMask = the green mask
        blueMask = the blue mask
        alphaMask = the alpha mask, or 0 if no alpha mask
      Returns: a #GstVideoFormat or GST_VIDEO_FORMAT_UNKNOWN when the parameters to
        not specify a known format.
  */
  static gstvideo.types.VideoFormat fromMasks(int depth, int bpp, int endianness, uint redMask, uint greenMask, uint blueMask, uint alphaMask) nothrow
  {
    GstVideoFormat _cretval;
    _cretval = gst_video_format_from_masks(depth, bpp, endianness, redMask, greenMask, blueMask, alphaMask);
    gstvideo.types.VideoFormat _retval = cast(gstvideo.types.VideoFormat)_cretval;
    return _retval;
  }

  /**
      Convert the format string to its #GstVideoFormat.
  
      Params:
        format = a format string
      Returns: the #GstVideoFormat for format or GST_VIDEO_FORMAT_UNKNOWN when the
        string is not a known format.
  */
  static gstvideo.types.VideoFormat fromString(string format) nothrow
  {
    GstVideoFormat _cretval;
    const(char)* _format = format.toCString(No.Alloc);
    _cretval = gst_video_format_from_string(_format);
    gstvideo.types.VideoFormat _retval = cast(gstvideo.types.VideoFormat)_cretval;
    return _retval;
  }

  /**
      Get the #GstVideoFormatInfo for format
  
      Params:
        format = a #GstVideoFormat
      Returns: The #GstVideoFormatInfo for format.
  */
  static gstvideo.video_format_info.VideoFormatInfo getInfo(gstvideo.types.VideoFormat format) nothrow
  {
    const(GstVideoFormatInfo)* _cretval;
    _cretval = gst_video_format_get_info(format);
    auto _retval = _cretval ? new gstvideo.video_format_info.VideoFormatInfo(cast(GstVideoFormatInfo*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the default palette of format. This the palette used in the pack
      function for paletted formats.
  
      Params:
        format = a #GstVideoFormat
        size = size of the palette in bytes
      Returns: the default palette of format or null when
        format does not have a palette.
  */
  static const(void)* getPalette(gstvideo.types.VideoFormat format, out size_t size) nothrow
  {
    auto _retval = gst_video_format_get_palette(format, cast(size_t*)&size);
    return _retval;
  }

  /**
      Converts a #GstVideoFormat value into the corresponding FOURCC.  Only
      a few YUV formats have corresponding FOURCC values.  If format has
      no corresponding FOURCC value, 0 is returned.
  
      Params:
        format = a #GstVideoFormat video format
      Returns: the FOURCC corresponding to format
  */
  static uint toFourcc(gstvideo.types.VideoFormat format) nothrow
  {
    uint _retval;
    _retval = gst_video_format_to_fourcc(format);
    return _retval;
  }

  /**
      Returns a string containing a descriptive name for
      the #GstVideoFormat if there is one, or NULL otherwise.
  
      Params:
        format = a #GstVideoFormat video format
      Returns: the name corresponding to format
  */
  static string toString_(gstvideo.types.VideoFormat format) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_video_format_to_string(format);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
