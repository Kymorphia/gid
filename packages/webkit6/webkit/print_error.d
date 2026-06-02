/// Module for [PrintError] enum namespace
module webkit.print_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [PrintError] enum
struct PrintError
{
  alias Enum = webkit.types.PrintError; ///

  /**
      Gets the quark for the domain of printing errors.
      Returns: print error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_print_error_quark();
    return _retval;
  }
}

class PrintException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.print_error.PrintError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.PrintError;
}
