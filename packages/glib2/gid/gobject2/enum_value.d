/// Module for [EnumValue] struct
module gid.gobject2.enum_value;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.types;

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
