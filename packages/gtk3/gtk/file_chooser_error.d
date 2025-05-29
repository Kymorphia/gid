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
      Registers an error quark for #GtkFileChooser if necessary.
      Returns: The error quark used for #GtkFileChooser errors.
  */
  static glib.types.Quark quark()
  {
    glib.types.Quark _retval;
    _retval = gtk_file_chooser_error_quark();
    return _retval;
  }
}

class FileChooseException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gtk.file_chooser_error.FileChooserError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.FileChooserError;
}
