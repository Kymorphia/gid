/// Module for [AccessibleState] enum namespace
module gtk.accessible_state;

import gid.gid;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [AccessibleState] enum
struct AccessibleState
{
  alias Enum = gtk.types.AccessibleState; ///

  /**
      Initializes value with the appropriate type for the state.
      
      This function is mostly meant for language bindings, in conjunction
      with gtk_accessible_update_relation_state().
  
      Params:
        state = a [gtk.types.AccessibleState]
        value = an uninitialized [gobject.value.Value]
  */
  static void initValue(gtk.types.AccessibleState state, gobject.value.Value value) nothrow
  {
    gtk_accessible_state_init_value(state, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
