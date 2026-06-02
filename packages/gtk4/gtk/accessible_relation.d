/// Module for [AccessibleRelation] enum namespace
module gtk.accessible_relation;

import gid.gid;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [AccessibleRelation] enum
struct AccessibleRelation
{
  alias Enum = gtk.types.AccessibleRelation; ///

  /** */
  static void initValue(gtk.types.AccessibleRelation relation, gobject.value.Value value) nothrow
  {
    gtk_accessible_relation_init_value(relation, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
