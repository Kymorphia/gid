/// Module for [FileLoaderError] enum namespace
module gid.gtksource4.file_loader_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.types;

/// Namespace for [FileLoaderError] enum
struct FileLoaderError
{
  alias Enum = gid.gtksource4.types.FileLoaderError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_source_file_loader_error_quark();
    return _retval;
  }
}

class FileLoadeException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtksource4.file_loader_error.FileLoaderError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtksource4.types.FileLoaderError;
}
