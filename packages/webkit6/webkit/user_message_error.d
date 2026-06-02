/// Module for [UserMessageError] enum namespace
module webkit.user_message_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [UserMessageError] enum
struct UserMessageError
{
  alias Enum = webkit.types.UserMessageError; ///

  /**
      Gets the quark for the domain of user message errors.
      Returns: user message error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_user_message_error_quark();
    return _retval;
  }
}

class UserMessageException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.user_message_error.UserMessageError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.UserMessageError;
}
