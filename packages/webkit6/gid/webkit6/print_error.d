/// Module for [PrintError] enum namespace
module gid.webkit6.print_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/// Namespace for [PrintError] enum
struct PrintError
{
  alias Enum = gid.webkit6.types.PrintError; ///

  /**
      Gets the quark for the domain of printing errors.
      Returns: print error domain.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = webkit_print_error_quark();
    return _retval;
  }
}

class PrintException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.webkit6.print_error.PrintError.quark, cast(int)code, msg);
  }

  alias Code = gid.webkit6.types.PrintError;
}
