/// Module for [PtyError] enum namespace
module vte.pty_error;

import gid.gid;
import glib.error;
import glib.types;
import vte.c.functions;
import vte.c.types;
import vte.types;

/// Namespace for [PtyError] enum
struct PtyError
{
  alias Enum = vte.types.PtyError; ///

  /**
      Error domain for VTE PTY errors. Errors in this domain will be from the #VtePtyError
      enumeration. See #GError for more information on error domains.
      Returns: the error domain for VTE PTY errors
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = vte_pty_error_quark();
    return _retval;
  }
}

class PtyException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(vte.pty_error.PtyError.quark, cast(int)code, msg);
  }

  alias Code = vte.types.PtyError;
}
