/// Module for [DsdFormat] enum namespace
module gid.gstaudio1.dsd_format;

import gid.core.utils;
import gid.gstaudio1.c.functions;
import gid.gstaudio1.c.types;
import gid.gstaudio1.types;

/// Namespace for [DsdFormat] enum
struct DsdFormat
{
  alias Enum = gid.gstaudio1.types.DsdFormat; ///

  /**
      Convert the DSD format string str to its #GstDsdFormat.
  
      Params:
        str = a DSD format string
      Returns: the #GstDsdFormat for format or GST_DSD_FORMAT_UNKNOWN when the
        string is not a known format.
  */
  static gid.gstaudio1.types.DsdFormat fromString(string str) nothrow
  {
    GstDsdFormat _cretval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_dsd_format_from_string(_str);
    gid.gstaudio1.types.DsdFormat _retval = cast(gid.gstaudio1.types.DsdFormat)_cretval;
    return _retval;
  }

  /** */
  static uint getWidth(gid.gstaudio1.types.DsdFormat format) nothrow
  {
    uint _retval;
    _retval = gst_dsd_format_get_width(format);
    return _retval;
  }

  /**
      Returns a string containing a descriptive name for
      the #GstDsdFormat if there is one, or NULL otherwise.
  
      Params:
        format = a #GstDsdFormat
      Returns: the name corresponding to format
  */
  static string toString_(gid.gstaudio1.types.DsdFormat format) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_dsd_format_to_string(format);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
