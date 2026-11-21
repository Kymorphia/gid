/// Module for [GLError] enum namespace
module gid.gdk4.glerror;

import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.glib2.error;
import gid.glib2.types;

/// Namespace for [GLError] enum
struct GLError
{
  alias Enum = gid.gdk4.types.GLError; ///

  /**
      Registers an error quark for [gid.gdk4.glcontext.GLContext] errors.
      Returns: the error quark
  */
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
    super(gid.gdk4.glerror.GLError.quark, cast(int)code, msg);
  }

  alias Code = gid.gdk4.types.GLError;
}
