/// Module for [GLContextError] enum namespace
module gid.gstgl1.glcontext_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/// Namespace for [GLContextError] enum
struct GLContextError
{
  alias Enum = gid.gstgl1.types.GLContextError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_gl_context_error_quark();
    return _retval;
  }
}

class GLContextException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gstgl1.glcontext_error.GLContextError.quark, cast(int)code, msg);
  }

  alias Code = gid.gstgl1.types.GLContextError;
}
