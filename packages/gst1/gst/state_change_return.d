/// Module for [StateChangeReturn] enum namespace
module gst.state_change_return;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [StateChangeReturn] enum
struct StateChangeReturn
{
  alias Enum = gst.types.StateChangeReturn; ///

  /**
      Gets a string representing the given state change result.
  
      Params:
        stateRet = a #GstStateChangeReturn to get the name of.
      Returns: a string with the name of the state
           result.
  */
  static string getName(gst.types.StateChangeReturn stateRet) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_state_change_return_get_name(stateRet);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
