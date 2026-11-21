/// Module for [ParserError] enum namespace
module gid.json1.parser_error;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.json1.c.functions;
import gid.json1.c.types;
import gid.json1.types;

/// Namespace for [ParserError] enum
struct ParserError
{
  alias Enum = gid.json1.types.ParserError; ///

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = json_parser_error_quark();
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
    super(gid.json1.parser_error.ParserError.quark, cast(int)code, msg);
  }

  alias Code = gid.json1.types.ParserError;
}
