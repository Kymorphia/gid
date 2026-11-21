/// Module for [SessionError] enum namespace
module gid.soup3.session_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/// Namespace for [SessionError] enum
struct SessionError
{
  alias Enum = gid.soup3.types.SessionError; ///

  /**
      Registers error quark for SoupSession if needed.
      Returns: Error quark for SoupSession.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = soup_session_error_quark();
    return _retval;
  }
}

class SessionException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.soup3.session_error.SessionError.quark, cast(int)code, msg);
  }

  alias Code = gid.soup3.types.SessionError;
}
