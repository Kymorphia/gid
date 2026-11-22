/// Module for [AccessibleRelation] enum namespace
module gid.gtk4.accessible_relation;

import gid.core.utils;
import gid.gobject2.value;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/// Namespace for [AccessibleRelation] enum
struct AccessibleRelation
{
  alias Enum = gid.gtk4.types.AccessibleRelation; ///

  /**
      Initializes value with the appropriate type for the relation.
      
      This function is mostly meant for language bindings, in conjunction
      with [gid.gtk4.accessible.Accessible.updateRelationValue].
  
      Params:
        relation = a [gid.gtk4.types.AccessibleRelation]
        value = an uninitialized [gid.gobject2.value.Value]
  */
  static void initValue(gid.gtk4.types.AccessibleRelation relation, gid.gobject2.value.Value value) nothrow
  {
    gtk_accessible_relation_init_value(relation, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
