/// Module for [WebExtensionMatchPatternError] enum namespace
module gid.webkit6.web_extension_match_pattern_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/// Namespace for [WebExtensionMatchPatternError] enum
struct WebExtensionMatchPatternError
{
  alias Enum = gid.webkit6.types.WebExtensionMatchPatternError; ///

  /**
      Gets the quark for the domain of Web Extension Match Pattern errors.
      Returns: web extension match pattern error domain.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = webkit_web_extension_match_pattern_error_quark();
    return _retval;
  }
}

class WebExtensionMatchPatternException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.webkit6.web_extension_match_pattern_error.WebExtensionMatchPatternError.quark, cast(int)code, msg);
  }

  alias Code = gid.webkit6.types.WebExtensionMatchPatternError;
}
