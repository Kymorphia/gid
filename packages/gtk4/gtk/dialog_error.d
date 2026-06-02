/// Module for [DialogError] enum namespace
module gtk.dialog_error;

import gid.gid;
import glib.error;
import glib.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [DialogError] enum
struct DialogError
{
  alias Enum = gtk.types.DialogError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_dialog_error_quark();
    return _retval;
  }
}

class DialogException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtk.dialog_error.DialogError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.DialogError;
}
