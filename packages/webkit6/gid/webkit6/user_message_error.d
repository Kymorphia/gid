/// Module for [UserMessageError] enum namespace
module gid.webkit6.user_message_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/// Namespace for [UserMessageError] enum
struct UserMessageError
{
  alias Enum = gid.webkit6.types.UserMessageError; ///

  /**
      Gets the quark for the domain of user message errors.
      Returns: user message error domain.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = webkit_user_message_error_quark();
    return _retval;
  }
}

class UserMessageException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.webkit6.user_message_error.UserMessageError.quark, cast(int)code, msg);
  }

  alias Code = gid.webkit6.types.UserMessageError;
}
