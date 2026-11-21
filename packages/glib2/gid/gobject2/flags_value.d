/// Module for [FlagsValue] struct
module gid.gobject2.flags_value;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.types;

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
