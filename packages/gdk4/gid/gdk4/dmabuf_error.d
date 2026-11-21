/// Module for [DmabufError] enum namespace
module gid.gdk4.dmabuf_error;

import gid.core.gid;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.glib2.error;
import gid.glib2.types;

/// Namespace for [DmabufError] enum
struct DmabufError
{
  alias Enum = gid.gdk4.types.DmabufError; ///

  /**
      Registers an error quark for [gid.gdk4.dmabuf_texture.DmabufTexture] errors.
      Returns: the error quark
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gdk_dmabuf_error_quark();
    return _retval;
  }
}

class DmabufException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gdk4.dmabuf_error.DmabufError.quark, cast(int)code, msg);
  }

  alias Code = gid.gdk4.types.DmabufError;
}
