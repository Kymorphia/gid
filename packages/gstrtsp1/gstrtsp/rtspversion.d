/// Module for [RTSPVersion] enum namespace
module gstrtsp.rtspversion;

import gid.gid;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.types;

/// Namespace for [RTSPVersion] enum
struct RTSPVersion
{
  alias Enum = gstrtsp.types.RTSPVersion; ///

  /**
      Convert version to a string.
  
      Params:
        version_ = a #GstRTSPVersion
      Returns: a string representation of version.
  */
  static string asText(gstrtsp.types.RTSPVersion version_) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_rtsp_version_as_text(version_);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
