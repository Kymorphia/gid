/// Module for [PolicyError] enum namespace
module webkit.policy_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [PolicyError] enum
struct PolicyError
{
  alias Enum = webkit.types.PolicyError; ///

  /**
      Gets the quark for the domain of policy errors.
      Returns: policy error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_policy_error_quark();
    return _retval;
  }
}

class PolicyException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.policy_error.PolicyError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.PolicyError;
}
