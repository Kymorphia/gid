/// Module for [TlsError] enum namespace
module gio.tls_error;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import glib.types;

/// Namespace for [TlsError] enum
struct TlsError
{
  alias Enum = gio.types.TlsError; ///

  /**
      Gets the TLS error quark.
      Returns: a #GQuark.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = g_tls_error_quark();
    return _retval;
  }
}

class TlsException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gio.tls_error.TlsError.quark, cast(int)code, msg);
  }

  alias Code = gio.types.TlsError;
}
