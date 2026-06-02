/// Module for [GLWindowError] enum namespace
module gstgl.glwindow_error;

import gid.gid;
import glib.error;
import glib.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLWindowError] enum
struct GLWindowError
{
  alias Enum = gstgl.types.GLWindowError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_gl_window_error_quark();
    return _retval;
  }
}

class GLWindowException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gstgl.glwindow_error.GLWindowError.quark, cast(int)code, msg);
  }

  alias Code = gstgl.types.GLWindowError;
}
