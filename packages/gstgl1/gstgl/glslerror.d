/// Module for [GLSLError] enum namespace
module gstgl.glslerror;

import gid.gid;
import glib.error;
import glib.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLSLError] enum
struct GLSLError
{
  alias Enum = gstgl.types.GLSLError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_glsl_error_quark();
    return _retval;
  }
}

class GLSLException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gstgl.glslerror.GLSLError.quark, cast(int)code, msg);
  }

  alias Code = gstgl.types.GLSLError;
}
