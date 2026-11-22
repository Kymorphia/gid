/// Module for [FileSaverError] enum namespace
module gid.gtksource5.file_saver_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;

/// Namespace for [FileSaverError] enum
struct FileSaverError
{
  alias Enum = gid.gtksource5.types.FileSaverError; ///

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
    super(gid.gtksource5.file_saver_error.FileSaverError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtksource5.types.FileSaverError;
}
