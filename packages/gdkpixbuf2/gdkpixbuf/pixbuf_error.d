/// Module for [PixbufError] enum namespace
module gdkpixbuf.pixbuf_error;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.types;
import gid.gid;
import glib.error;
import glib.types;

/// Namespace for [PixbufError] enum
struct PixbufError
{
  alias Enum = gdkpixbuf.types.PixbufError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gdk_pixbuf_error_quark();
    return _retval;
  }
}

class PixbufException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gdkpixbuf.pixbuf_error.PixbufError.quark, cast(int)code, msg);
  }

  alias Code = gdkpixbuf.types.PixbufError;
}
