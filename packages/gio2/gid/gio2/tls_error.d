/// Module for [TlsError] enum namespace
module gid.gio2.tls_error;

import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.types;

/// Namespace for [TlsError] enum
struct TlsError
{
  alias Enum = gid.gio2.types.TlsError; ///

  /**
      Gets the TLS error quark.
      Returns: a #GQuark.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = g_tls_error_quark();
    return _retval;
  }
}

class TlsException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gio2.tls_error.TlsError.quark, cast(int)code, msg);
  }

  alias Code = gid.gio2.types.TlsError;
}
