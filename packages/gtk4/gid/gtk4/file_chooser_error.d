/// Module for [FileChooserError] enum namespace
module gid.gtk4.file_chooser_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/// Namespace for [FileChooserError] enum
struct FileChooserError
{
  alias Enum = gid.gtk4.types.FileChooserError; ///

  /**
      Registers an error quark for [gid.gtk4.file_chooser.FileChooser] errors.
      Returns: The error quark used for [gid.gtk4.file_chooser.FileChooser] errors.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_file_chooser_error_quark();
    return _retval;
  }
}

class FileChooseException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtk4.file_chooser_error.FileChooserError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtk4.types.FileChooserError;
}
