/// Module for [PrintError] enum namespace
module gtk.print_error;

import gid.gid;
import glib.error;
import glib.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [PrintError] enum
struct PrintError
{
  alias Enum = gtk.types.PrintError; ///

  /**
      Registers an error quark for [gtk.print_operation.PrintOperation] if necessary.
      Returns: The error quark used for [gtk.print_operation.PrintOperation] errors.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_print_error_quark();
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
    super(gtk.print_error.PrintError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.PrintError;
}
