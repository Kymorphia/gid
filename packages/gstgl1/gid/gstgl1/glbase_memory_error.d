/// Module for [GLBaseMemoryError] enum namespace
module gid.gstgl1.glbase_memory_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gstgl1.c.functions;
import gid.gstgl1.c.types;
import gid.gstgl1.types;

/// Namespace for [GLBaseMemoryError] enum
struct GLBaseMemoryError
{
  alias Enum = gid.gstgl1.types.GLBaseMemoryError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_gl_base_memory_error_quark();
    return _retval;
  }
}

class GLBaseMemoryException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gstgl1.glbase_memory_error.GLBaseMemoryError.quark, cast(int)code, msg);
  }

  alias Code = gid.gstgl1.types.GLBaseMemoryError;
}
