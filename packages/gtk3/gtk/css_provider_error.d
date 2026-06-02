/// Module for [CssProviderError] enum namespace
module gtk.css_provider_error;

import gid.gid;
import glib.error;
import glib.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/// Namespace for [CssProviderError] enum
struct CssProviderError
{
  alias Enum = gtk.types.CssProviderError; ///

  /** */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gtk_css_provider_error_quark();
    return _retval;
  }
}

class CssProvideException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gtk.css_provider_error.CssProviderError.quark, cast(int)code, msg);
  }

  alias Code = gtk.types.CssProviderError;
}
