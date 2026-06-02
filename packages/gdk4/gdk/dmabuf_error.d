/// Module for [DmabufError] enum namespace
module gdk.dmabuf_error;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import glib.error;
import glib.types;

/// Namespace for [DmabufError] enum
struct DmabufError
{
  alias Enum = gdk.types.DmabufError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gdk_dmabuf_error_quark();
    return _retval;
  }
}

class DmabufException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gdk.dmabuf_error.DmabufError.quark, cast(int)code, msg);
  }

  alias Code = gdk.types.DmabufError;
}
