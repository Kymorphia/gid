/// Module for [IconThemeError] enum namespace
module gid.gtk4.icon_theme_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/// Namespace for [IconThemeError] enum
struct IconThemeError
{
  alias Enum = gid.gtk4.types.IconThemeError; ///

  /**
      Registers an error quark for [gid.gtk4.icon_theme.IconTheme] errors.
      Returns: the error quark
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_icon_theme_error_quark();
    return _retval;
  }
}

class IconThemeException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtk4.icon_theme_error.IconThemeError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtk4.types.IconThemeError;
}
