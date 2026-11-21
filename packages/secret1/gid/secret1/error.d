/// Module for [Error] enum namespace
module gid.secret1.error;

import gid.core.gid;
import gid.glib2.types;
import gid.secret1.c.functions;
import gid.secret1.c.types;
import gid.secret1.types;

/// Namespace for [Error] enum
struct Error
{
  alias Enum = gid.secret1.types.Error; ///

  /**
      Get the error quark.
      Returns: the quark
  */
  static gid.glib2.types.Quark getQuark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = secret_error_get_quark();
    return _retval;
  }
}
