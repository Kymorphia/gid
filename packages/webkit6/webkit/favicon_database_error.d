/// Module for [FaviconDatabaseError] enum namespace
module webkit.favicon_database_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [FaviconDatabaseError] enum
struct FaviconDatabaseError
{
  alias Enum = webkit.types.FaviconDatabaseError; ///

  /**
      Gets the quark for the domain of favicon database errors.
      Returns: favicon database error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_favicon_database_error_quark();
    return _retval;
  }
}

class FaviconDatabaseException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.favicon_database_error.FaviconDatabaseError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.FaviconDatabaseError;
}
