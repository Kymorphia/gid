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

  /**
      Initializes value with the appropriate type for the relation.
      
      This function is mostly meant for language bindings, in conjunction
      with [gtk.accessible.Accessible.updateRelationValue].
  
      Params:
        relation = a [gtk.types.AccessibleRelation]
        value = an uninitialized [gobject.value.Value]
  */
  static void initValue(gtk.types.AccessibleRelation relation, gobject.value.Value value) nothrow
  {
    gtk_accessible_relation_init_value(relation, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
