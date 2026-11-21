/// Module for [CssProviderError] enum namespace
module gid.gtk3.css_provider_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/// Namespace for [CssProviderError] enum
struct CssProviderError
{
  alias Enum = gid.gtk3.types.CssProviderError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gtk_css_provider_error_quark();
    return _retval;
  }
}

class CssProvideException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gtk3.css_provider_error.CssProviderError.quark, cast(int)code, msg);
  }

  alias Code = gid.gtk3.types.CssProviderError;
}
