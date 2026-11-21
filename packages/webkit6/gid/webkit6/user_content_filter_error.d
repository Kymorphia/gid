/// Module for [UserContentFilterError] enum namespace
module gid.webkit6.user_content_filter_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/// Namespace for [UserContentFilterError] enum
struct UserContentFilterError
{
  alias Enum = gid.webkit6.types.UserContentFilterError; ///

  /**
      Gets the quark for the domain of user content filter errors.
      Returns: user content filter error domain.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = webkit_user_content_filter_error_quark();
    return _retval;
  }
}

class UserContentFilteException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.webkit6.user_content_filter_error.UserContentFilterError.quark, cast(int)code, msg);
  }

  alias Code = gid.webkit6.types.UserContentFilterError;
}
