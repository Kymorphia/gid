/// Module for [AccessibleState] enum namespace
module gid.gtk4.accessible_state;

import gid.core.utils;
import gid.gobject2.value;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/// Namespace for [AccessibleState] enum
struct AccessibleState
{
  alias Enum = gid.gtk4.types.AccessibleState; ///

  /**
      Initializes value with the appropriate type for the state.
      
      This function is mostly meant for language bindings, in conjunction
      with gtk_accessible_update_relation_state().
  
      Params:
        state = a [gid.gtk4.types.AccessibleState]
        value = an uninitialized [gid.gobject2.value.Value]
  */
  static void initValue(gid.gtk4.types.AccessibleState state, gid.gobject2.value.Value value) nothrow
  {
    gtk_accessible_state_init_value(state, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
