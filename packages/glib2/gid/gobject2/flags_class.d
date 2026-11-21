/// Module for [FlagsClass] struct
module gid.gobject2.flags_class;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.type_class;
import gid.gobject2.types;

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
  GFlagsValue* values;
}
