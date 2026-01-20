/// Module for [EnumClass] struct
module gobject.enum_class;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.enum_value;
import gobject.type_class;
import gobject.types;

/**
    The class of an enumeration type holds information about its
    possible values.
*/
struct EnumClass
{
  /**
      the parent class
  */
  TypeClass gTypeClass;

  /**
      the smallest possible value.
  */
  int minimum;

  /**
      the largest possible value.
  */
  int maximum;

  /**
      the number of possible values.
  */
  uint nValues;

  /**
      an array of #GEnumValue structs describing the
       individual values.
  */
  EnumValue* values;
}
