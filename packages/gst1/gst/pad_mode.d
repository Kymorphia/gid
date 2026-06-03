/// Module for [PadMode] enum namespace
module gst.pad_mode;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [PadMode] enum
struct PadMode
{
  alias Enum = gst.types.PadMode; ///

  /**
      Return the name of a pad mode, for use in debug messages mostly.
  
      Params:
        mode = the pad mode
      Returns: short mnemonic for pad mode mode
  */
  static string getName(gst.types.PadMode mode) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_pad_mode_get_name(mode);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
