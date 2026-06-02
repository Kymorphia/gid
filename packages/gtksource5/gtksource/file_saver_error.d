/// Module for [FileSaverError] enum namespace
module gtksource.file_saver_error;

import gid.gid;
import glib.error;
import glib.types;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/// Namespace for [FileSaverError] enum
struct FileSaverError
{
  alias Enum = gtksource.types.FileSaverError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_source_file_saver_error_quark();
    return _retval;
  }
}

class FileSaveException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtksource.file_saver_error.FileSaverError.quark, cast(int)code, msg);
  }

  alias Code = gtksource.types.FileSaverError;
}
