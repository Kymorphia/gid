/// Module for [TextureError] enum namespace
module gid.gdk4.texture_error;

import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.glib2.error;
import gid.glib2.types;

/// Namespace for [TextureError] enum
struct TextureError
{
  alias Enum = gid.gdk4.types.TextureError; ///

  /**
      Registers an error quark for [gid.gdk4.texture.Texture] errors.
      Returns: the error quark
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gdk_texture_error_quark();
    return _retval;
  }
}

class TextureException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gdk4.texture_error.TextureError.quark, cast(int)code, msg);
  }

  alias Code = gid.gdk4.types.TextureError;
}
