/// Module for [WebExtensionError] enum namespace
module webkit.web_extension_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [WebExtensionError] enum
struct WebExtensionError
{
  alias Enum = webkit.types.WebExtensionError; ///

  /**
      Gets the quark for the domain of Web Extension errors.
      Returns: web extension error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_web_extension_error_quark();
    return _retval;
  }
}

class WebExtensionException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.web_extension_error.WebExtensionError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.WebExtensionError;
}
