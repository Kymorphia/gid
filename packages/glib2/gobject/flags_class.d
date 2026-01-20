/// Module for [FlagsClass] struct
module gobject.flags_class;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.flags_value;
import gobject.type_class;
import gobject.types;

/**
    The class of a flags type holds information about its
    possible values.
*/
struct FlagsClass
{
  /**
      the parent class
  */
  TypeClass gTypeClass;

  /**
      a mask covering all possible values.
  */
  uint mask;

  /**
      the number of possible values.
  */
  uint nValues;

  /**
      an array of #GFlagsValue structs describing the
       individual values.
  */
  FlagsValue* values;
}
