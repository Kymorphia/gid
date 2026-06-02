/// Module for [WebExtensionMatchPatternError] enum namespace
module webkit.web_extension_match_pattern_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [WebExtensionMatchPatternError] enum
struct WebExtensionMatchPatternError
{
  alias Enum = webkit.types.WebExtensionMatchPatternError; ///

  /**
      Gets the quark for the domain of Web Extension Match Pattern errors.
      Returns: web extension match pattern error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_web_extension_match_pattern_error_quark();
    return _retval;
  }
}

class WebExtensionMatchPatternException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.web_extension_match_pattern_error.WebExtensionMatchPatternError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.WebExtensionMatchPatternError;
}
