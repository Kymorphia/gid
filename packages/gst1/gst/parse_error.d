/// Module for [ParseError] enum namespace
module gst.parse_error;

import gid.gid;
import glib.error;
import glib.types;
import gst.c.functions;
import gst.c.types;
import gst.types;

/// Namespace for [ParseError] enum
struct ParseError
{
  alias Enum = gst.types.ParseError; ///

  /**
      Get the error quark used by the parsing subsystem.
      Returns: the quark of the parse errors.
  */
  static glib.types.Quark quark() nothrow
  {
    glib.types.Quark _retval;
    _retval = gst_parse_error_quark();
    return _retval;
  }
}

class ParseException : ErrorWrap
{
  this(GError* err) nothrow
  {
    super(err);
  }

  this(Code code, string msg) nothrow
  {
    super(gst.parse_error.ParseError.quark, cast(int)code, msg);
  }

  alias Code = gst.types.ParseError;
}
