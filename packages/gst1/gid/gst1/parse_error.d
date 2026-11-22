/// Module for [ParseError] enum namespace
module gid.gst1.parse_error;

import gid.core.utils;
import gid.glib2.error;
import gid.glib2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/// Namespace for [ParseError] enum
struct ParseError
{
  alias Enum = gid.gst1.types.ParseError; ///

  /**
      Get the error quark used by the parsing subsystem.
      Returns: the quark of the parse errors.
  */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_parse_error_quark();
    return _retval;
  }
}

class ParseException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gst1.parse_error.ParseError.quark, cast(int)code, msg);
  }

  alias Code = gid.gst1.types.ParseError;
}
