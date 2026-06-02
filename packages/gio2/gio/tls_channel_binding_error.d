/// Module for [TlsChannelBindingError] enum namespace
module gio.tls_channel_binding_error;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import glib.types;

/// Namespace for [TlsChannelBindingError] enum
struct TlsChannelBindingError
{
  alias Enum = gio.types.TlsChannelBindingError; ///

  /**
      Gets the TLS channel binding error quark.
      Returns: a #GQuark.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = g_tls_channel_binding_error_quark();
    return _retval;
  }
}

class TlsChannelBindingException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gio.tls_channel_binding_error.TlsChannelBindingError.quark, cast(int)code, msg);
  }

  alias Code = gio.types.TlsChannelBindingError;
}
