/// Module for [EnumClass] struct
module gid.gobject2.enum_class;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.type_class;
import gid.gobject2.types;

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
  GEnumValue* values;
}
