/// Module for [StreamType] flags namespace
module gid.gst1.stream_type;

import gid.core.utils;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [StreamType] flags
struct StreamType
{
  alias Enum = gid.gst1.types.StreamType; ///

  /**
      Get a descriptive string for a given #GstStreamType
  
      Params:
        stype = a #GstStreamType
      Returns: A string describing the stream type
  */
  static string getName(gid.gst1.types.StreamType stype) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_stream_type_get_name(stype);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
