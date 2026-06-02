/// Module for [TextureError] enum namespace
module gdk.texture_error;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import glib.error;
import glib.types;

/// Namespace for [TextureError] enum
struct TextureError
{
  alias Enum = gdk.types.TextureError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gdk_texture_error_quark();
    return _retval;
  }
}

class TextureException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gdk.texture_error.TextureError.quark, cast(int)code, msg);
  }

  alias Code = gdk.types.TextureError;
}
