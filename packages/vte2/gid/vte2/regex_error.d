/// Module for [RegexError] enum namespace
module gid.vte2.regex_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.vte2.c.functions;
import gid.vte2.c.types;
import gid.vte2.types;

/// Namespace for [RegexError] enum
struct RegexError
{
  alias Enum = gid.vte2.types.RegexError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = vte_regex_error_quark();
    return _retval;
  }
}

class RegexException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.vte2.regex_error.RegexError.quark, cast(int)code, msg);
  }

  alias Code = gid.vte2.types.RegexError;
}
