/// Module for [FlagsValue] struct
module gobject.flags_value;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    A structure which contains a single flags value, its name, and its
    nickname.
*/
struct FlagsValue
{
  /**
      the flags value
  */
  uint value;

  /**
      the name of the value
  */
  const(char)* valueName;

  /**
      the nickname of the value
  */
  const(char)* valueNick;
}
