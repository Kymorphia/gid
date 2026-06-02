/// Module for [GLBaseMemoryError] enum namespace
module gstgl.glbase_memory_error;

import gid.gid;
import glib.error;
import glib.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/// Namespace for [GLBaseMemoryError] enum
struct GLBaseMemoryError
{
  alias Enum = gstgl.types.GLBaseMemoryError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_gl_base_memory_error_quark();
    return _retval;
  }
}

class GLBaseMemoryException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gstgl.glbase_memory_error.GLBaseMemoryError.quark, cast(int)code, msg);
  }

  alias Code = gstgl.types.GLBaseMemoryError;
}
