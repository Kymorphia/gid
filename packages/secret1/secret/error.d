/// Module for [Error] enum namespace
module secret.error;

import gid.gid;
import glib.types;
import secret.c.functions;
import secret.c.types;
import secret.types;

/// Namespace for [Error] enum
struct Error
{
  alias Enum = secret.types.Error; ///

  /**
      Get the error quark.
      Returns: the quark
  */
  static glib.types.Quark getQuark() nothrow
  {
    glib.types.Quark _retval;
    _retval = secret_error_get_quark();
    return _retval;
  }
}
