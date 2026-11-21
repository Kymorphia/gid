/// Module for [DebugLevel] enum namespace
module gid.gst1.debug_level;

import gid.core.gid;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [DebugLevel] enum
struct DebugLevel
{
  alias Enum = gid.gst1.types.DebugLevel; ///

  /**
      Get the string representation of a debugging level
  
      Params:
        level = the level to get the name for
      Returns: the name
  */
  static string getName(gid.gst1.types.DebugLevel level) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_debug_level_get_name(level);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
