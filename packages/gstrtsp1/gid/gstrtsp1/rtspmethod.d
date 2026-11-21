/// Module for [RTSPMethod] flags namespace
module gid.gstrtsp1.rtspmethod;

import gid.core.gid;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.types;

/// Namespace for [RTSPMethod] flags
struct RTSPMethod
{
  alias Enum = gid.gstrtsp1.types.RTSPMethod; ///

  /**
      Convert method to a string.
  
      Params:
        method = a #GstRTSPMethod
      Returns: a string representation of method.
  */
  static string asText(gid.gstrtsp1.types.RTSPMethod method) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_rtsp_method_as_text(method);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
