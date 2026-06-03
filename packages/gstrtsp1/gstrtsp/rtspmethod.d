/// Module for [RTSPMethod] flags namespace
module gstrtsp.rtspmethod;

import gid.gid;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.types;

/// Namespace for [RTSPMethod] flags
struct RTSPMethod
{
  alias Enum = gstrtsp.types.RTSPMethod; ///

  /**
      Convert method to a string.
  
      Params:
        method = a #GstRTSPMethod
      Returns: a string representation of method.
  */
  static string asText(gstrtsp.types.RTSPMethod method) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_rtsp_method_as_text(method);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
