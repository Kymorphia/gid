/// Module for [DsdFormat] enum namespace
module gstaudio.dsd_format;

import gid.gid;
import gstaudio.c.functions;
import gstaudio.c.types;
import gstaudio.types;

/// Namespace for [DsdFormat] enum
struct DsdFormat
{
  alias Enum = gstaudio.types.DsdFormat; ///

  /**
      Convert the DSD format string str to its #GstDsdFormat.
  
      Params:
        str = a DSD format string
      Returns: the #GstDsdFormat for format or GST_DSD_FORMAT_UNKNOWN when the
        string is not a known format.
  */
  static gstaudio.types.DsdFormat fromString(string str) nothrow
  {
    GstDsdFormat _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = gst_dsd_format_from_string(_str);
    gstaudio.types.DsdFormat _retval = cast(gstaudio.types.DsdFormat)_cretval;
    return _retval;
  }

  /** */
  static uint getWidth(gstaudio.types.DsdFormat format) nothrow
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
  static string toString_(gstaudio.types.DsdFormat format) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_dsd_format_to_string(format);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
