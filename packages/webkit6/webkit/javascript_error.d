/// Module for [JavascriptError] enum namespace
module webkit.javascript_error;

import gid.gid;
import glib.error;
import glib.types;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/// Namespace for [JavascriptError] enum
struct JavascriptError
{
  alias Enum = webkit.types.JavascriptError; ///

  /**
      Gets the quark for the domain of JavaScript errors.
      Returns: JavaScript error domain.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = webkit_javascript_error_quark();
    return _retval;
  }
}

class JavascriptException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(webkit.javascript_error.JavascriptError.quark, cast(int)code, msg);
  }

  alias Code = webkit.types.JavascriptError;
}
