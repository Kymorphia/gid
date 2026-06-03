/// Module for [StateChange] enum namespace
module gst.state_change;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [StateChange] enum
struct StateChange
{
  alias Enum = gst.types.StateChange; ///

  /**
      Gets a string representing the given state transition.
  
      Params:
        transition = a #GstStateChange to get the name of.
      Returns: a string with the name of the state
           result.
  */
  static string getName(gst.types.StateChange transition) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_state_change_get_name(transition);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
