/// Module for [DragAction] flags namespace
module gdk.drag_action;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;

/// Namespace for [DragAction] flags
struct DragAction
{
  alias Enum = gdk.types.DragAction; ///

  /**
      Checks if action represents a single action or includes
      multiple actions.
      
      When action is 0 - ie no action was given, true
      is returned.
  
      Params:
        action = a [gdk.types.DragAction]
      Returns: true if exactly one action was given
  */
  static bool isUnique(gdk.types.DragAction action)
  {
    bool _retval;
    _retval = cast(bool)gdk_drag_action_is_unique(action);
    return _retval;
  }
}
