/// Module for [PixbufError] enum namespace
module gid.gdkpixbuf2.pixbuf_error;

import gid.core.gid;
import gid.gdkpixbuf2.c.functions;
import gid.gdkpixbuf2.c.types;
import gid.gdkpixbuf2.types;
import gid.glib2.error;
import gid.glib2.types;

/// Namespace for [PixbufError] enum
struct PixbufError
{
  alias Enum = gid.gdkpixbuf2.types.PixbufError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gdk_pixbuf_error_quark();
    return _retval;
  }
}

class PixbufException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gdkpixbuf2.pixbuf_error.PixbufError.quark, cast(int)code, msg);
  }

  alias Code = gid.gdkpixbuf2.types.PixbufError;
}
