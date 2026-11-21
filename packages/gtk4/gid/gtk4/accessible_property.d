/// Module for [AccessibleProperty] enum namespace
module gid.gtk4.accessible_property;

import gid.core.gid;
import gid.gobject2.value;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/// Namespace for [AccessibleProperty] enum
struct AccessibleProperty
{
  alias Enum = gid.gtk4.types.AccessibleProperty; ///

  /**
      Initializes value with the appropriate type for the property.
      
      This function is mostly meant for language bindings, in conjunction
      with [gid.gtk4.accessible.Accessible.updatePropertyValue].
  
      Params:
        property = a [gid.gtk4.types.AccessibleProperty]
        value = an uninitialized [gid.gobject2.value.Value]
  */
  static void initValue(gid.gtk4.types.AccessibleProperty property, gid.gobject2.value.Value value) nothrow
  {
    gtk_accessible_property_init_value(property, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
