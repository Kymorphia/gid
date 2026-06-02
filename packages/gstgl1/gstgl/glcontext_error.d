/// Module for [GLContextError] enum namespace
module gstgl.glcontext_error;

import gid.gid;
import glib.error;
import glib.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLContextError] enum
struct GLContextError
{
  alias Enum = gstgl.types.GLContextError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_gl_context_error_quark();
    return _retval;
  }
}

class GLContextException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gstgl.glcontext_error.GLContextError.quark, cast(int)code, msg);
  }

  alias Code = gstgl.types.GLContextError;
}
