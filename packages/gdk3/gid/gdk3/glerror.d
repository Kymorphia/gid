/// Module for [GLError] enum namespace
module gid.gdk3.glerror;

import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.types;
import gid.glib2.error;
import gid.glib2.types;

/// Namespace for [GLError] enum
struct GLError
{
  alias Enum = gid.gdk3.types.GLError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gdk_gl_error_quark();
    return _retval;
  }
}

class GLException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gdk3.glerror.GLError.quark, cast(int)code, msg);
  }

  alias Code = gid.gdk3.types.GLError;
}
