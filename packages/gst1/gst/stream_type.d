/// Module for [StreamType] flags namespace
module gst.stream_type;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [StreamType] flags
struct StreamType
{
  alias Enum = gst.types.StreamType; ///

  /**
      Get a descriptive string for a given #GstStreamType
  
      Params:
        stype = a #GstStreamType
      Returns: A string describing the stream type
  */
  static string getName(gst.types.StreamType stype) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_stream_type_get_name(stype);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
