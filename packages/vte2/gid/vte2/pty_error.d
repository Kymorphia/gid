/// Module for [PtyError] enum namespace
module gid.vte2.pty_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.vte2.c.functions;
import gid.vte2.c.types;
import gid.vte2.types;

/// Namespace for [PtyError] enum
struct PtyError
{
  alias Enum = gid.vte2.types.PtyError; ///

  /**
      Error domain for VTE PTY errors. Errors in this domain will be from the #VtePtyError
      enumeration. See #GError for more information on error domains.
      Returns: the error domain for VTE PTY errors
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = vte_pty_error_quark();
    return _retval;
  }
}

class PtyException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.vte2.pty_error.PtyError.quark, cast(int)code, msg);
  }

  alias Code = gid.vte2.types.PtyError;
}
