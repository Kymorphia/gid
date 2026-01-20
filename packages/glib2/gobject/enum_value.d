/// Module for [EnumValue] struct
module gobject.enum_value;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    A structure which contains a single enum value, its name, and its
    nickname.
*/
struct EnumValue
{
  /**
      the enum value
  */
  int value;

  /**
      the name of the value
  */
  const(char)* valueName;

  /**
      the nickname of the value
  */
  const(char)* valueNick;
}
