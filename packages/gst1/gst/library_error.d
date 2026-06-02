/// Module for [LibraryError] enum namespace
module gst.library_error;

import gid.gid;
import glib.error;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [LibraryError] enum
struct LibraryError
{
  alias Enum = gst.types.LibraryError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_library_error_quark();
    return _retval;
  }
}

class LibraryException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gst.library_error.LibraryError.quark, cast(int)code, msg);
  }

  alias Code = gst.types.LibraryError;
}
