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

  /** */
  static void initValue(gtk.types.AccessibleState state, gobject.value.Value value) nothrow
  {
    gtk_accessible_state_init_value(state, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
