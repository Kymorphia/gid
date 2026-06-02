/// Module for [IconThemeError] enum namespace
module gtk.icon_theme_error;

import gid.gid;
import glib.error;
import glib.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [IconThemeError] enum
struct IconThemeError
{
  alias Enum = gtk.types.IconThemeError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_icon_theme_error_quark();
    return _retval;
  }
}

class IconThemeException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtk.icon_theme_error.IconThemeError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.IconThemeError;
}
