/// Module for [FileSaverError] enum namespace
module gid.gtksource4.file_saver_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.types;

/// Namespace for [FileSaverError] enum
struct FileSaverError
{
  alias Enum = gid.gtksource4.types.FileSaverError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_source_file_saver_error_quark();
    return _retval;
  }
}

class FileSaveException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtksource4.file_saver_error.FileSaverError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtksource4.types.FileSaverError;
}
