/// Module for [GLError] enum namespace
module gdk.glerror;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import glib.error;
import glib.types;

/// Namespace for [GLError] enum
struct GLError
{
  alias Enum = gdk.types.GLError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gdk_gl_error_quark();
    return _retval;
  }
}

class GLException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gdk.glerror.GLError.quark, cast(int)code, msg);
  }

  alias Code = gdk.types.GLError;
}
