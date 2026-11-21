/// Module for [DialogError] enum namespace
module gid.gtk4.dialog_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/// Namespace for [DialogError] enum
struct DialogError
{
  alias Enum = gid.gtk4.types.DialogError; ///

  /**
      Registers an error quark for an operation that requires a dialog if
      necessary.
      Returns: the error quark
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_dialog_error_quark();
    return _retval;
  }
}

class DialogException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtk4.dialog_error.DialogError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtk4.types.DialogError;
}
