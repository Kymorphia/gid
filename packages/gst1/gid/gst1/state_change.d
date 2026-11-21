/// Module for [StateChange] enum namespace
module gid.gst1.state_change;

import gid.core.gid;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [StateChange] enum
struct StateChange
{
  alias Enum = gid.gst1.types.StateChange; ///

  /**
      Gets a string representing the given state transition.
  
      Params:
        transition = a #GstStateChange to get the name of.
      Returns: a string with the name of the state
           result.
  */
  static string getName(gid.gst1.types.StateChange transition) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_state_change_get_name(transition);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
