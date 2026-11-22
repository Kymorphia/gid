/// Module for [StateChangeReturn] enum namespace
module gid.gst1.state_change_return;

import gid.core.utils;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [StateChangeReturn] enum
struct StateChangeReturn
{
  alias Enum = gid.gst1.types.StateChangeReturn; ///

  /**
      Gets a string representing the given state change result.
  
      Params:
        stateRet = a #GstStateChangeReturn to get the name of.
      Returns: a string with the name of the state
           result.
  */
  static string getName(gid.gst1.types.StateChangeReturn stateRet) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_state_change_return_get_name(stateRet);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
