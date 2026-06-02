/// Module for [CoreError] enum namespace
module gst.core_error;

import gid.gid;
import glib.error;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [CoreError] enum
struct CoreError
{
  alias Enum = gst.types.CoreError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_core_error_quark();
    return _retval;
  }
}

class CoreException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gst.core_error.CoreError.quark, cast(int)code, msg);
  }

  alias Code = gst.types.CoreError;
}
