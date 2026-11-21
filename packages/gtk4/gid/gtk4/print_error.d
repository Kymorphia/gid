/// Module for [PrintError] enum namespace
module gid.gtk4.print_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/// Namespace for [PrintError] enum
struct PrintError
{
  alias Enum = gid.gtk4.types.PrintError; ///

  /**
      Registers an error quark for [gid.gtk4.print_operation.PrintOperation] if necessary.
      Returns: The error quark used for [gid.gtk4.print_operation.PrintOperation] errors.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_print_error_quark();
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
    super(gid.gtk4.print_error.PrintError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtk4.types.PrintError;
}
