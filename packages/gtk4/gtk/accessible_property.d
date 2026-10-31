/// Module for [AccessibleProperty] enum namespace
module gtk.accessible_property;

import gid.gid;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [AccessibleProperty] enum
struct AccessibleProperty
{
  alias Enum = gtk.types.AccessibleProperty; ///

  /**
      Initializes value with the appropriate type for the property.
      
      This function is mostly meant for language bindings, in conjunction
      with [gtk.accessible.Accessible.updatePropertyValue].
  
      Params:
        property = a [gtk.types.AccessibleProperty]
        value = an uninitialized [gobject.value.Value]
  */
  static void initValue(gtk.types.AccessibleProperty property, gobject.value.Value value) nothrow
  {
    gtk_accessible_property_init_value(property, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }
}
