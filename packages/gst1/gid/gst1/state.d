/// Module for [State] enum namespace
module gid.gst1.state;

import gid.core.utils;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [State] enum
struct State
{
  alias Enum = gid.gst1.types.State; ///

  /**
      Gets a string representing the given state.
  
      Params:
        state = a #GstState to get the name of.
      Returns: a string with the name of the state.
  */
  static string getName(gid.gst1.types.State state) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_state_get_name(state);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
