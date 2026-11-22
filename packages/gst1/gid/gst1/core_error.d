/// Module for [CoreError] enum namespace
module gid.gst1.core_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [CoreError] enum
struct CoreError
{
  alias Enum = gid.gst1.types.CoreError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_core_error_quark();
    return _retval;
  }
}

class CoreException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gst1.core_error.CoreError.quark, cast(int)code, msg);
  }

  alias Code = gid.gst1.types.CoreError;
}
