/// Module for [RTSPVersion] enum namespace
module gid.gstrtsp1.rtspversion;

import gid.core.utils;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.types;

/// Namespace for [RTSPVersion] enum
struct RTSPVersion
{
  alias Enum = gid.gstrtsp1.types.RTSPVersion; ///

  /**
      Convert version to a string.
  
      Params:
        version_ = a #GstRTSPVersion
      Returns: a string representation of version.
  */
  static string asText(gid.gstrtsp1.types.RTSPVersion version_) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_rtsp_version_as_text(version_);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
