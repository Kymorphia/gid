/// Module for [PolicyError] enum namespace
module gid.webkit6.policy_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/// Namespace for [PolicyError] enum
struct PolicyError
{
  alias Enum = gid.webkit6.types.PolicyError; ///

  /**
      Gets the quark for the domain of policy errors.
      Returns: policy error domain.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = webkit_policy_error_quark();
    return _retval;
  }
}

class PolicyException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.webkit6.policy_error.PolicyError.quark, cast(int)code, msg);
  }

  alias Code = gid.webkit6.types.PolicyError;
}
