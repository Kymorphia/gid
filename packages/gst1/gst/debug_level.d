/// Module for [DebugLevel] enum namespace
module gst.debug_level;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [DebugLevel] enum
struct DebugLevel
{
  alias Enum = gst.types.DebugLevel; ///

  /**
      Get the string representation of a debugging level
  
      Params:
        level = the level to get the name for
      Returns: the name
  */
  static string getName(gst.types.DebugLevel level) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_debug_level_get_name(level);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
