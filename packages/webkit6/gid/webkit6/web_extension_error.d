/// Module for [WebExtensionError] enum namespace
module gid.webkit6.web_extension_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/// Namespace for [WebExtensionError] enum
struct WebExtensionError
{
  alias Enum = gid.webkit6.types.WebExtensionError; ///

  /**
      Gets the quark for the domain of Web Extension errors.
      Returns: web extension error domain.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
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
    super(gid.webkit6.web_extension_error.WebExtensionError.quark, cast(int)code, msg);
  }

  alias Code = gid.webkit6.types.WebExtensionError;
}
