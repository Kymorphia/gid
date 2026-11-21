/// Module for [GLSLError] enum namespace
module gid.gstgl1.glslerror;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/// Namespace for [GLSLError] enum
struct GLSLError
{
  alias Enum = gid.gstgl1.types.GLSLError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_glsl_error_quark();
    return _retval;
  }
}

class GLSLException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gstgl1.glslerror.GLSLError.quark, cast(int)code, msg);
  }

  alias Code = gid.gstgl1.types.GLSLError;
}
