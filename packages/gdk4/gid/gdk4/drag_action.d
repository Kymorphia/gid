/// Module for [DragAction] flags namespace
module gid.gdk4.drag_action;

import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;

/// Namespace for [DragAction] flags
struct DragAction
{
  alias Enum = gid.gdk4.types.DragAction; ///

  /**
      Checks if action represents a single action or includes
      multiple actions.
      
      When action is [gid.gdk4.types.DragAction.None] - ie no action was given, `TRUE`
      is returned.
  
      Params:
        action = a [gid.gdk4.types.DragAction]
      Returns: true if exactly one action was given
  */
  static bool isUnique(gid.gdk4.types.DragAction action) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_drag_action_is_unique(action);
    return _retval;
  }
}
