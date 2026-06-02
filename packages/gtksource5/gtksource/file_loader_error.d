/// Module for [FileLoaderError] enum namespace
module gtksource.file_loader_error;

import gid.gid;
import glib.error;
import glib.types;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/// Namespace for [FileLoaderError] enum
struct FileLoaderError
{
  alias Enum = gtksource.types.FileLoaderError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_source_file_loader_error_quark();
    return _retval;
  }
}

class FileLoadeException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtksource.file_loader_error.FileLoaderError.quark, cast(int)code, msg);
  }

  alias Code = gtksource.types.FileLoaderError;
}
