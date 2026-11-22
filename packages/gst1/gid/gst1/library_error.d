/// Module for [LibraryError] enum namespace
module gid.gst1.library_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [LibraryError] enum
struct LibraryError
{
  alias Enum = gid.gst1.types.LibraryError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_library_error_quark();
    return _retval;
  }
}

class LibraryException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gst1.library_error.LibraryError.quark, cast(int)code, msg);
  }

  alias Code = gid.gst1.types.LibraryError;
}
