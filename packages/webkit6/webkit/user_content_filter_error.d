/// Module for [UserContentFilterError] enum namespace
module webkit.user_content_filter_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [UserContentFilterError] enum
struct UserContentFilterError
{
  alias Enum = webkit.types.UserContentFilterError; ///

  /**
      Gets the quark for the domain of user content filter errors.
      Returns: user content filter error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_user_content_filter_error_quark();
    return _retval;
  }
}

class UserContentFilteException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.user_content_filter_error.UserContentFilterError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.UserContentFilterError;
}
