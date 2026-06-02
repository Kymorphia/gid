/// Module for [FileChooserError] enum namespace
module gtk.file_chooser_error;

import gid.gid;
import glib.error;
import glib.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [FileChooserError] enum
struct FileChooserError
{
  alias Enum = gtk.types.FileChooserError; ///

  /**
      Registers an error quark for [gtk.file_chooser.FileChooser] errors.
      Returns: The error quark used for [gtk.file_chooser.FileChooser] errors.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_file_chooser_error_quark();
    return _retval;
  }
}

class FileChooseException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtk.file_chooser_error.FileChooserError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.FileChooserError;
}
