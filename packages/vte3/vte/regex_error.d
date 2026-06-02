/// Module for [RegexError] enum namespace
module vte.regex_error;

import gid.gid;
import glib.error;
import glib.types;
import vte.c.functions;
import vte.c.types;
import vte.types;

/// Namespace for [RegexError] enum
struct RegexError
{
  alias Enum = vte.types.RegexError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = vte_regex_error_quark();
    return _retval;
  }
}

class RegexException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(vte.regex_error.RegexError.quark, cast(int)code, msg);
  }

  alias Code = vte.types.RegexError;
}
