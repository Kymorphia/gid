/// Module for [NetworkError] enum namespace
module webkit.network_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [NetworkError] enum
struct NetworkError
{
  alias Enum = webkit.types.NetworkError; ///

  /**
      Gets the quark for the domain of networking errors.
      Returns: network error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_network_error_quark();
    return _retval;
  }
}

class NetworkException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.network_error.NetworkError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.NetworkError;
}
