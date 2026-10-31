/// Module for [State] enum namespace
module gst.state;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [State] enum
struct State
{
  alias Enum = gst.types.State; ///

  /**
      Gets a string representing the given state.
  
      Params:
        state = a #GstState to get the name of.
      Returns: a string with the name of the state.
  */
  static string getName(gst.types.State state) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_state_get_name(state);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }
}
