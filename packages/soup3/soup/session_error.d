/// Module for [SessionError] enum namespace
module soup.session_error;

import gid.gid;
import glib.error;
import glib.types;
import soup.c.functions;
import soup.c.types;
import soup.types;

/// Namespace for [SessionError] enum
struct SessionError
{
  alias Enum = soup.types.SessionError; ///

  /**
      Registers error quark for SoupSession if needed.
      Returns: Error quark for SoupSession.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = soup_session_error_quark();
    return _retval;
  }
}

class SessionException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(soup.session_error.SessionError.quark, cast(int)code, msg);
  }

  alias Code = soup.types.SessionError;
}
