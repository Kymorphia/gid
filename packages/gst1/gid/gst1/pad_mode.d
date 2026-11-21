/// Module for [PadMode] enum namespace
module gid.gst1.pad_mode;

import gid.core.gid;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [PadMode] enum
struct PadMode
{
  alias Enum = gid.gst1.types.PadMode; ///

  /**
      Return the name of a pad mode, for use in debug messages mostly.
  
      Params:
        mode = the pad mode
      Returns: short mnemonic for pad mode mode
  */
  static string getName(gid.gst1.types.PadMode mode) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_pad_mode_get_name(mode);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
